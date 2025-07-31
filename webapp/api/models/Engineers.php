<?php
require_once 'config/db.php';

class Engineers {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();

        if (!$this->db) {
            die("❌ Failed to connect to database.");
        }
    }

    public function getAll() {
        $sql = "SELECT * FROM engineers";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();        
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getById($id) {
        $sql = "SELECT * FROM engineers WHERE id = :id";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch();
    }

    public function create($data) {
        $sql = "INSERT INTO engineers (username, password, first_name, last_name, email, contact, area, experience_years) 
                VALUES (:username, :password, :first_name, :last_name, :email, :contact, :area, :experience_years)";
        $stmt = $this->db->prepare($sql);

        $hashed_password = password_hash($data['password'], PASSWORD_DEFAULT);
        $stmt->bindParam(':username', $data['username']);
        $stmt->bindParam(':password', $hashed_password);
        $stmt->bindParam(':first_name', $data['first_name']);
        $stmt->bindParam(':last_name', $data['last_name']);
        $stmt->bindParam(':email', $data['email']);
        $stmt->bindParam(':contact', $data['contact']);
        $stmt->bindParam(':area', $data['area']);
        $stmt->bindParam(':experience_years', $data['experience_years']);

        if ($stmt->execute()) {
            return $this->getById($this->db->lastInsertId());
        }
        return false;
    }

    public function update($id, $data) {
        $fields = [];
        $params = [':id' => $id];
        
        $allowed_fields = [
            'username', 'first_name', 'last_name', 'email',
            'contact', 'area', 'experience_years'
        ];

        foreach ($allowed_fields as $field) {
            if (isset($data[$field])) {
                $fields[] = "$field = :$field";
                $params[":$field"] = $data[$field];
            }
        }

        if (isset($data['password']) && !empty($data['password'])) {
            $fields[] = "password = :password";
            $params[':password'] = password_hash($data['password'], PASSWORD_DEFAULT);
        }

        if (empty($fields)) {
            return false;
        }

        $sql = "UPDATE engineers SET " . implode(', ', $fields) . " WHERE id = :id";
        $stmt = $this->db->prepare($sql);

        if ($stmt->execute($params)) {
            return $this->getById($id);
        }

        return false;
    }

    public function delete($id) {
        $sql = "DELETE FROM engineers WHERE id = :id";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        return $stmt->execute();
    }

    public function emailExists($email, $exclude_id = null) {
        $sql = "SELECT COUNT(*) as count FROM engineers WHERE email = :email";
        $params = [':email' => $email];

        if ($exclude_id) {
            $sql .= " AND id != :id";
            $params[':id'] = $exclude_id;
        }

        $stmt = $this->db->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetch()['count'] > 0;
    }

    public function usernameExists($username, $exclude_id = null) {
        $sql = "SELECT COUNT(*) as count FROM engineers WHERE username = :username";
        $params = [':username' => $username];

        if ($exclude_id) {
            $sql .= " AND id != :id";
            $params[':id'] = $exclude_id;
        }

        $stmt = $this->db->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetch()['count'] > 0;
    }

    public function authenticate($username, $password) {
        $sql = "SELECT id, username, password, first_name, last_name, email, area, experience_years FROM engineers 
                WHERE username = :username OR email = :username";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->execute();

        $engineer = $stmt->fetch();

        if ($engineer && password_verify($password, $engineer['password'])) {
            unset($engineer['password']);
            return $engineer;
        }

        return false;
    }
}
