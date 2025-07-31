<?php

class Database {

    private $db_path;
    private $conn;

    public function __construct() {
        $this->db_path = __DIR__ .'/../../db/db_ASCM.db';
        $this->connect();
    }

    private function connect() {
        try {
            $db_dir = dirname($this->db_path);
            if (!is_dir($db_dir)) {
                mkdir($db_dir, 0755, true); 
            }

            $this->conn = new PDO('sqlite:' . $this->db_path);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

        } catch (PDOException $e) {
            throw new Exception("Database connection failed: " . $e->getMessage());
        }
    }

    public function getConnection() {
        return $this->conn; 
    }
}

// try {
//     $db = new Database();
//     echo "Database connection successful!";
// } catch (Exception $e) {
//     echo "Error: " . $e->getMessage();
// }