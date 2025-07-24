
<?php
require_once '../../connection/database.php';

class Client {
    private $db;
    
    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }
    
    // Create client with only username and password
    public function create($data) {
        try {
            $sql = "INSERT INTO clients (username, password) VALUES (:username, :password)";
            $stmt = $this->db->prepare($sql);
            
            // Hash password for security
            $hashedPassword = password_hash($data['password'], PASSWORD_DEFAULT);
            
            $stmt->bindParam(':username', $data['username']);
            $stmt->bindParam(':password', $hashedPassword);
            
            if($stmt->execute()) {
                return [
                    'success' => true, 
                    'id' => $this->db->lastInsertId(), 
                    'message' => 'Client created successfully',
                    'data' => [
                        'id' => $this->db->lastInsertId(),
                        'username' => $data['username']
                    ]
                ];
            }
            return ['success' => false, 'message' => 'Failed to create client'];
        } catch(PDOException $e) {
            return ['success' => false, 'message' => 'Error: ' . $e->getMessage()];
        }
    }
    
    // Get all clients (without passwords for security)
    public function getAll() {
        try {
            $sql = "SELECT id, username, created_at FROM clients ORDER BY created_at DESC";
            $stmt = $this->db->prepare($sql);
            $stmt->execute();
            
            $clients = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return ['success' => true, 'data' => $clients];
        } catch(PDOException $e) {
            return ['success' => false, 'message' => 'Error: ' . $e->getMessage()];
        }
    }
    
    // Get client by ID (without password)
    public function getById($id) {
        try {
            $sql = "SELECT id, username, created_at FROM clients WHERE id = :id";
            $stmt = $this->db->prepare($sql);
            $stmt->bindParam(':id', $id);
            $stmt->execute();
            
            $client = $stmt->fetch(PDO::FETCH_ASSOC);
            if($client) {
                return ['success' => true, 'data' => $client];
            }
            return ['success' => false, 'message' => 'Client not found'];
        } catch(PDOException $e) {
            return ['success' => false, 'message' => 'Error: ' . $e->getMessage()];
        }
    }
    
    // Verify login (for authentication)
    public function verifyLogin($username, $password) {
        try {
            $sql = "SELECT id, password FROM clients WHERE username = :username";
            $stmt = $this->db->prepare($sql);
            $stmt->bindParam(':username', $username);
            $stmt->execute();
            
            $client = $stmt->fetch(PDO::FETCH_ASSOC);
            // echo $client;
            if($client && password_verify($password, $client['password']))
            // if($client && $password== $client['password'])
            {
                return ['success' => true, 'message' => 'Login successful', 'client_id' => $client['id']];
            }
            return ['success' => false, 'message' => 'Invalid username or password'];
        } catch(PDOException $e) {
            return ['success' => false, 'message' => 'Error: ' . $e->getMessage()];
        }
    }
}
?>