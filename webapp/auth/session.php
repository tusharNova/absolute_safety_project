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

// $user = $_SESSION['user'];
// $fullname = $user['first_name'] ." ". $user['last_name'];
// $uid =$user['id'];
// echo $fullname;
// echo "<br>";
// echo $uid;
echo "<br><br>";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>testing session.php</title>
</head>
<body>
    
</body>
</html>

