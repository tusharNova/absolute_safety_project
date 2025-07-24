<?php
class Database {
    private $db;
    
    public function __construct() {
        $db_path= __DIR__ . '../../../db/db_ASCM.db';
        try {
            // Create SQLite database
            $this->db = new PDO('sqlite:' . $db_path);
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            // echo "Database connection successful!\n";
        } catch(PDOException $e) {
            die("Connection failed: " . $e->getMessage());
        }
    }
    
    public function getConnection() {
        return $this->db;
    }
}
// $database = new Database();
// $db = $database->getConnection();

// // You can further verify by checking if $db is an instance of PDO
// if ($db instanceof PDO) {
//     echo "The \$db variable holds a PDO object.\n";
// } else {
//     echo "The \$db variable does not hold a PDO object (connection failed or other issue).\n";
// }

// // You could also try a simple query to ensure it's truly working
// try {
//     $result = $db->query("SELECT 1"); // A simple query that should always return 1 if connection is good
//     if ($result) {
//         echo "Simple query executed successfully, database is responsive.\n";
//     } else {
//         echo "Simple query failed, database might not be responsive.\n";
//     }
// } catch (PDOException $e) {
//     echo "Error executing simple query: " . $e->getMessage() . "\n";
// }

?>