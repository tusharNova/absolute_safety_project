<?php

require '../includes/db_connection.php';

$cmd=$_POST["cmd"];
if ($cmd === "Login") {
    if ($cmd === "Login") {
        $email = $_POST["email"];
        $password = $_POST["password"];
        
        $sql = "SELECT * FROM user WHERE email='$email' AND password='$password'";
        $result = mysqli_query($conn, $sql);
        
        if (mysqli_num_rows($result) > 0) {
            // User found, create session or token for authentication
            
            $user = mysqli_fetch_assoc($result);
            $response = array(
                "msg" => "Login successful",
                "user" => $user
            );
            $response = json_encode($response);
            echo $response;
            $_SESSION['loginUser']=$email;
        } else {
            // User not found or password incorrect
            $response = array(
                "msg" => "Invalid email or password"
            );
            $response = json_encode($response);
            echo $response;
        }
    }
		
}

?>