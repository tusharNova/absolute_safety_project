<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

require_once(__DIR__ . '/helpers/Response.php');

require_once(__DIR__ . '/handler/ClientsHandler.php');
require_once(__DIR__ . '/handler/EnginnersHandler.php');
require_once(__DIR__ . '/handler/CertificationRequestsHandler.php');
// webapp\api\handler\ClientsHandler.php

// Parse the URL - Handle different URL patterns
$request_uri = $_SERVER['REQUEST_URI'];
$script_name = $_SERVER['SCRIPT_NAME'];

// Remove script name from request URI to get the path
$path = str_replace(dirname($script_name), '', $request_uri);
$path = str_replace('/index.php', '', $path);

// Remove query string
$path = parse_url($path, PHP_URL_PATH);

// Clean up the path
$path = trim($path, '/');
$path_parts = explode('/', $path);

if ($path_parts[0] === 'api') {
    array_shift($path_parts);
}

$resource = $path_parts[0] ?? '';
$id = $path_parts[1] ?? null;
$method = $_SERVER['REQUEST_METHOD'];

// Debug output (remove in production)
error_log("Request URI: " . $request_uri);
error_log("Path: " . $path);
error_log("Resource: " . $resource);
error_log("ID: " . $id);
error_log("Method: " . $method);


try {
    switch ($resource) {
        case 'clients':
            $handler = new ClientHandler();
            break;
        case 'enginners':
            $handler = new EngineerHandler();
            break;
        case 'certification-requests':
            $handler = new CertificationRequestsHandler();

            // Handle additional routes
            if (isset($path_parts[1])) {
                $sub_resource = $path_parts[1];
                $sub_id = $path_parts[2
                
                ] ?? null;

                switch ($sub_resource) {
                    case 'client':
                        if ($method === 'GET' && $sub_id) {
                            $handler->getByClientId($sub_id);
                        } else {
                            Response::error('Invalid request', 400);
                        }
                        break;
                    case 'engineer':
                        if ($method === 'GET' && $sub_id) {
                            $handler->getByEngineerId($sub_id);
                        } else {
                            Response::error('Invalid request', 400);
                        }
                        break;
                    case 'status':
                        if ($method === 'PUT' && $id) {
                            $handler->updateStatus($id);
                        } else {
                            Response::error('Invalid request', 400);
                        }
                        break;
                    default:
                        Response::error('Resource not found', 404);
                }
            } else {
                switch ($method) {
                    case 'GET':
                        if ($id) {
                            $handler->getById($id);
                        } else {
                            $handler->getAll();
                        }
                        break;
                    case 'POST':
                        $handler->create();
                        break;
                    case 'PUT':
                        if ($id) {
                            $handler->update($id);
                        } else {
                            Response::error('ID required for update', 400);
                        }
                        break;
                    case 'DELETE':
                        if ($id) {
                            $handler->delete($id);
                        } else {
                            Response::error('ID required for delete', 400);
                        }
                        break;
                    default:
                        Response::error('Method not allowed', 405);
                }
            }
            break;

        case '':
            // API root - show available endpoints
            Response::success([
                'message' => 'REST API Demo',
                'endpoints' => [
                    'clients' => '/api/clients',
                    'subjects' => '/api/enginners',
                    'certification-requests' => '/api/certification-requests',
                ],
                'methods' => ['GET', 'POST', 'PUT', 'DELETE']
            ], 'API is working');
            break;
        default:
            Response::error('Resource not found. Available resources: users, subjects', 404);
            exit();
    }

    // Route to appropriate handler method
    switch ($method) {
        case 'GET':
            if ($id) {
                $handler->getById($id);
            } else {
                $handler->getAll();
            }
            break;
        case 'POST':
            $handler->create();
            break;
        case 'PUT':
            if ($id) {
                $handler->update($id);
            } else {
                Response::error('ID required for update', 400);
            }
            break;
        case 'DELETE':
            if ($id) {
                $handler->delete($id);
            } else {
                Response::error('ID required for delete', 400);
            }
            break;
        default:
            Response::error('Method not allowed', 405);
    }
} catch (Exception $e) {
    Response::error('Server error: ' . $e->getMessage(), 500);
}
