<?php

session_start();

ob_start();
header('Content-Type: application/json');

try {
    require_once '../includes/db_connection.php';
    
    function checkLogin($pdo, $table, $username, $password) {
        $allowedTables = ['Admins', 'clients', 'engineers'];
        if (!in_array($table, $allowedTables)) {
            return false;
        }
        
        $sql = "SELECT * FROM `$table` WHERE username = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$username]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($password == $user['password']) {
            unset($user['password']); 
            
            return [
                'status' => 'success',
                'role' => $table,
                'user' => $user
            ];
        }
        return false;
    }
    
    $input = file_get_contents("php://input");
    $data = json_decode($input, true);
        
    if (json_last_error() !== JSON_ERROR_NONE) {
        throw new Exception('Invalid JSON input: ' . json_last_error_msg());
    }
    
    $username = $data['username'] ?? '';
    $password = $data['password'] ?? '';
    
    if (!$username || !$password) {
        http_response_code(400);

        $response = ['status' => 'error', 'message' => 'Missing username or password'];
    } else
    {
        $loginSuccess = false;
        foreach (['Admins', 'clients', 'engineers'] as $table) {
            $result = checkLogin($pdo, $table, $username, $password);
            if ($result) {

                $response = $result;
                $loginSuccess = true;
                $_SESSION['user'] = $result['user'];
                $_SESSION['role'] = $result['role'];
                break;
            }
        }
        
        if (!$loginSuccess) {
            http_response_code(401);
            $response = ['status' => 'error', 'message' => 'Invalid username or password'];
        }
    }
    
} catch (PDOException $e) {
    // Database error
    http_response_code(500);
    $response = [
        'status' => 'error', 
        'message' => 'Database connection error'
    ];
    // Log the actual error for debugging (don't send to client)
    error_log("Database error in api.php: " . $e->getMessage());
    
} catch (Exception $e) {
    // Other errors
    http_response_code(500);
    $response = [
        'status' => 'error', 
        'message' => $e->getMessage()
    ];
    error_log("Error in api.php: " . $e->getMessage());
}

ob_clean();


echo json_encode($response);
exit;
?>