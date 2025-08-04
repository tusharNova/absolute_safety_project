<?php

/**
 * Checks if the user is authenticated and has the required role.
 * If not, it redirects them to the home page and terminates the script.
 *
 * @param string $requiredRole The role required to access the current page.
 */
function checkDashboardAccess($requiredRole) {
    // Start the session if it's not already started
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }   
    // Check if the session variable 'role' is not set,
    if (!isset($_SESSION['role']) || $_SESSION['role'] !== $requiredRole) {
        header("Location: ../../index.php");
        exit();
    }
}
