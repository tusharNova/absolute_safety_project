<?php
ob_start();


header('Content-Type: application/json');

// ini_set('display_errors', 0);
// error_reporting(E_ALL);

try {
    require_once '../includes/db_connection.php';
    
    function checkLogin($pdo, $table, $username, $password) {
        $allowedTables = ['Admins', 'clients', 'engineers'];
        if (!in_array($table, $allowedTables)) {
            return false;
        }
        
        // Use backticks for table name since it's whitelisted
        $sql = "SELECT * FROM `$table` WHERE username = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$username]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($password == $user['password']) {
            unset($user['password']); // Remove password from response
            
            return [
                'status' => 'success',
                'role' => $table,
                'user' => $user
            ];
        }
        return false;
    }
    
    // Get and decode JSON input
    $input = file_get_contents("php://input");
    $data = json_decode($input, true);
    
    // Check for JSON parsing errors
    if (json_last_error() !== JSON_ERROR_NONE) {
        throw new Exception('Invalid JSON input: ' . json_last_error_msg());
    }
    
    $username = $data['username'] ?? '';
    $password = $data['password'] ?? '';
    
    if (!$username || !$password) {
        http_response_code(400);
        $response = ['status' => 'error', 'message' => 'Missing username or password'];
    } else {
        // Check each table
        $loginSuccess = false;
        foreach (['Admins', 'clients', 'engineers'] as $table) {
            $result = checkLogin($pdo, $table, $username, $password);
            if ($result) {
                $response = $result;
                $loginSuccess = true;
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

// Clean any output buffer content
ob_clean();

// Send JSON response
echo json_encode($response);
exit;
?>