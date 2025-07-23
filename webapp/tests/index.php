<?php



require_once '../includes/db_connection.php';

$stmt = $pdo->query("SELECT * FROM clients");

$clients = $stmt->fetchAll();

foreach ($clients as $client) {
    echo $client['first_name'] . "<br>";
}
?>