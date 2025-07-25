<?php
session_start();

if (isset($_SESSION['user'])) {
    echo json_encode([
        'status' => 'logged_in',
        'user' => $_SESSION['user'],
        'role' => $_SESSION['role']
    ]);
} else {
    http_response_code(401);
    echo json_encode(['status' => 'not_logged_in']);
}

echo "<br><br>";

$user = $_SESSION['user'];
$fullname = $user['first_name'] ." ". $user['last_name'];
$uid =$user['id'];
echo $fullname;
echo "<br>";
echo $uid;