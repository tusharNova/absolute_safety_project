<?php

$db_path = __DIR__ . '/../db/db_ASCM.db';

try {
    $conn = new PDO("sqlite:" . $db_path);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {

    die("Connection failed: " . $e->getMessage());
}
?>