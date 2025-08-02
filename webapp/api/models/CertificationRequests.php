<?php
require_once 'config/db.php';

class CertificationRequests {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();

        if (!$this->db) {
            die("❌ Failed to connect to database.");
        }
    }

    public function getAll() {
        $sql = "SELECT * FROM certification_requests";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();        
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getById($id) {
        $sql = "SELECT * FROM certification_requests WHERE id = :id";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch();
    }

    public function getByClientId($client_id) {
        $sql = "SELECT * FROM certification_requests WHERE client_id = :client_id";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':client_id', $client_id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
        // return $sql;
    }

    public function getByEngineerId($engineer_id) {
        $sql = "SELECT * FROM certification_requests WHERE assigned_engineer = :engineer_id";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':engineer_id', $engineer_id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function create($data) {
        $sql = "INSERT INTO certification_requests 
                (client_id, machine_name, machine_details, assigned_engineer, status, expiry_months) 
                VALUES 
                (:client_id, :machine_name, :machine_details, :assigned_engineer, :status, :expiry_months)";
        
        $stmt = $this->db->prepare($sql);

        $stmt->bindValue(':client_id', $data['client_id'], PDO::PARAM_INT);
        $stmt->bindValue(':machine_name', $data['machine_name']);
        $stmt->bindValue(':machine_details', $data['machine_details']);
        $stmt->bindValue(':assigned_engineer', '');
        $stmt->bindValue(':status', 'pending');
        $stmt->bindValue(':expiry_months', '');

        if ($stmt->execute()) {
            return $this->getById($this->db->lastInsertId());
        }
        return false;
    }

    public function update($id, $data) {
        $fields = [];
        $params = [':id' => $id];
        
        $allowed_fields = [
            'client_id', 'machine_name', 'machine_details', 
            'assigned_engineer', 'status', 'expiry_months'
        ];
        
        foreach ($allowed_fields as $field) {
            if (isset($data[$field])) {
                $fields[] = "$field = :$field";
                $params[":$field"] = $data[$field];
            }
        }

        if (empty($fields)) {
            return false;
        }

        $sql = "UPDATE certification_requests SET " . implode(', ', $fields) . " WHERE id = :id";
        $stmt = $this->db->prepare($sql);

        if ($stmt->execute($params)) {
            return $this->getById($id);
        }

        return false;
    }

    public function delete($id) {
        $sql = "DELETE FROM certification_requests WHERE id = :id";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        return $stmt->execute();
    }

    public function updateStatus($id, $status) {
        $sql = "UPDATE certification_requests SET status = :status WHERE id = :id";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->bindParam(':status', $status);
        return $stmt->execute();
    }
}
?>