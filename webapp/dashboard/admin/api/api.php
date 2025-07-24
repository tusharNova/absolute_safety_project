
<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Handle preflight OPTIONS request
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    exit(0);
}

require_once 'Client.php';

class APIHandler {
    private $client;
    
    public function __construct() {
        $this->client = new Client();
    }
    
    public function handleRequest() {
        $method = $_SERVER['REQUEST_METHOD'];
        $path = isset($_GET['path']) ? $_GET['path'] : '';
        
        // Parse the path
        $pathParts = explode('/', trim($path, '/'));
        $resource = isset($pathParts[0]) ? $pathParts[0] : '';
        $id = isset($pathParts[1]) ? $pathParts[1] : null;
        $action = isset($pathParts[2]) ? $pathParts[2] : null;
        
        // Route the request
        if ($resource === 'clients') {
            switch ($method) {
                case 'GET':
                    if ($id) {
                        $this->getClientById($id);
                    } else {
                        $this->getAllClients();
                    }
                    break;
                case 'POST':
                    if ($action === 'login') {
                        // POST /clients/login
                        $this->loginClient();
                    } else {
                        // POST /clients
                        $this->createClient();
                    }
                    break;
                default:
                    $this->sendResponse(405, ['success' => false, 'message' => 'Method not allowed']);
                    break;
            }
        } elseif ($resource === 'login') {
            // Alternative login endpoint: POST /login
            if ($method === 'POST') {
                $this->loginClient();
            } else {
                $this->sendResponse(405, ['success' => false, 'message' => 'Method not allowed']);
            }
        } else {
            $this->sendResponse(404, ['success' => false, 'message' => 'Resource not found']);
        }
    }
    
    private function getAllClients() {
        $result = $this->client->getAll();
        $statusCode = $result['success'] ? 200 : 500;
        $this->sendResponse($statusCode, $result);
    }
    
    private function getClientById($id) {
        $result = $this->client->getById($id);
        $statusCode = $result['success'] ? 200 : 404;
        $this->sendResponse($statusCode, $result);
    }
    
    private function createClient() {
        $data = json_decode(file_get_contents('php://input'), true);
        
        if (!$this->validateClientData($data)) {
            $this->sendResponse(400, ['success' => false, 'message' => 'Username and password are required']);
            return;
        }
        
        $result = $this->client->create($data);
        $statusCode = $result['success'] ? 201 : 400;
        $this->sendResponse($statusCode, $result);
    }
    
    private function loginClient() {
        $data = json_decode(file_get_contents('php://input'), true);
        
        if (!$this->validateClientData($data)) {
            $this->sendResponse(400, ['success' => false, 'message' => 'Username and password are required']);
            return;
        }
        
        $result = $this->client->verifyLogin($data['username'], $data['password']);
        $statusCode = $result['success'] ? 200 : 401;
        $this->sendResponse($statusCode, $result);
    }
    
    private function validateClientData($data) {
        return isset($data['username']) && isset($data['password']) && 
               !empty($data['username']) && !empty($data['password']);
    }
    
    private function sendResponse($statusCode, $data) {
        http_response_code($statusCode);
        echo json_encode($data);
        exit;
    }
}

// Handle the API request
$api = new APIHandler();
$api->handleRequest();
?>