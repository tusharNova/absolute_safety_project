<?php
require_once 'config/db.php';


class Clients{
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();

        if (!$this->db) {
        die("❌ Failed to connect to database.");
    }
    }
    public function getAll(){
        $sql = "SELECT * from clients";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();        
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }



    public function getById($id){
        $sql = "SELECT * from clients WHERE id = :id";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(); // ✅ only one return
}
    
    public function create($data){
        
        $sql = "INSERT INTO clients (username, password, first_name, last_name, email, company_name, contact, address, state, pincode, status) VALUES (:username, :password, :first_name, :last_name, :email, :company_name, :contact, :address, :state, :pincode, :status)";
        $stmt = $this->db->prepare($sql);

        $hashed_password = password_hash($data['password'], PASSWORD_DEFAULT);
        $stmt->bindParam(':username', $data['username']);
        $stmt->bindParam(':password', $hashed_password);
        $stmt->bindParam(':first_name', $data['first_name']);
        $stmt->bindParam(':last_name', $data['last_name']);
        $stmt->bindParam(':email', $data['email']);
        $stmt->bindParam(':company_name', $data['company_name']);
        $stmt->bindParam(':contact', $data['contact']);
        $stmt->bindParam(':address', $data['address']);
        $stmt->bindParam(':state', $data['state']);
        $stmt->bindParam(':pincode', $data['pincode']);
        $stmt->bindParam(':status', $data['status']);

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
        'company_name', 'contact', 'address', 'state',
        'pincode', 'status'
    ];
    
    foreach ($allowed_fields as $field) {
        if (isset($data[$field])) {
            $fields[] = "$field = :$field";
            $params[":$field"] = $data[$field];  // ✅ Fixed here
        }
    }

    // Handle password separately
    if (isset($data['password']) && !empty($data['password'])) {
        $fields[] = "password = :password";
        $params[':password'] = password_hash($data['password'], PASSWORD_DEFAULT);
    }

    if (empty($fields)) {
        return false; // Nothing to update
    }

    $sql = "UPDATE clients SET " . implode(', ', $fields) . " WHERE id = :id";
    $stmt = $this->db->prepare($sql);

    if ($stmt->execute($params)) {
        return $this->getById($id);
    }

    return false;
}


     public function delete($id) {
        $sql = "DELETE FROM clients WHERE id = :id";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        
        return $stmt->execute();
    }
    public function emailExists($email, $exclude_id = null) {
        $sql = "SELECT COUNT(*) as count FROM clients WHERE email = :email";
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
        $sql = "SELECT COUNT(*) as count FROM clients WHERE username = :username";
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
        $sql = "SELECT id, username, password, first_name, last_name, email, status FROM clients WHERE username = :username OR email = :username";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->execute();
        
        $client = $stmt->fetch();
        
        if ($client && password_verify($password, $client['password'])) {
            // Remove password from return data
            unset($client['password']);
            return $client;
        }
        
        return false;
    }
    
}