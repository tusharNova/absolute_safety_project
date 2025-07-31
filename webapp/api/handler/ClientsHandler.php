
<?php


require_once('models/Clients.php');
require_once('helpers/Response.php');

class ClientHandler {
    private $client;

    public function __construct() {
        $this->client = new Clients();
    }


    public function getAll(){
        try {
            $result = $this->client->getAll();
            Response::success($result, 'User retrieved successfully');
        } catch (Exception $e) {
            Response::error('Failed to retrieve users: ' . $e->getMessage(), 500);
        }
    }
      public function getById($id) {
        if (!is_numeric($id)) {
            Response::error('Invalid user ID', 400);
        }

        try {
            $client = $this->client->getById($id);
            if ($client) {
                Response::success($client, 'User retrieved successfully');
            } else {
                Response::error('User not found', 404);
            }
        } catch (Exception $e) {
            Response::error('Failed to retrieve user: ' . $e->getMessage(), 500);
        }
    }

        public function create() {
        $input = json_decode(file_get_contents('php://input'), true);

        // Validation
        // $errors = $this->validateUserData($input);
        // if (!empty($errors)) {
        //     Response::error('Validation failed', 400, $errors);
        // }

        // Check if email already exists
        // if ($this->client->emailExists($input['email'])) {
        //     Response::error('Email already exists', 409);
        // }

        try {
            $new_client = $this->client->create($input);
            if ($new_client) {
                Response::success($new_client, 'User created successfully', 201);
            } else {
                Response::error('Failed to create user', 500);
            }
        } catch (Exception $e) {
            Response::error('Failed to create user: ' . $e->getMessage(), 500);
        }
    }

        public function update($id) {
        if (!is_numeric($id)) {
            Response::error('Invalid user ID', 400);
        }

        $input = json_decode(file_get_contents('php://input'), true);

        // Check if user exists
        // $existing_user = $this->user->getById($id);
        // if (!$existing_user) {
        //     Response::error('User not found', 404);
        // }

        // Validation
        // $errors = $this->validateUserData($input);
        // if (!empty($errors)) {
        //     Response::error('Validation failed', 400, $errors);
        // }

        // Check if email already exists (excluding current user)
        // if ($this->client->emailExists($input['email'], $id)) {
        //     Response::error('Email already exists', 409);
        // }

        try {
            $updated_client = $this->client->update($id, $input);
            if ($updated_client) {
                Response::success($updated_client, 'User updated successfully');
            } else {
                Response::error('Failed to update user', 500);
            }
        } catch (Exception $e) {
            Response::error('Failed to update user: ' . $e->getMessage(), 500);
        }
    }
     public function delete($id) {
        if (!is_numeric($id)) {
            Response::error('Invalid user ID', 400);
        }

        // Check if user exists
        $existing_client = $this->client->getById($id);
        if (!$existing_client) {
            Response::error('User not found', 404);
        }

        try {
            if ($this->client->delete($id)) {
                Response::success(null, 'User deleted successfully');
            } else {
                Response::error('Failed to delete user', 500);
            }
        } catch (Exception $e) {
            Response::error('Failed to delete user: ' . $e->getMessage(), 500);
        }
    }
        private function validateUserData($data) {
        $errors = [];

        if (empty($data['name']) || strlen(trim($data['name'])) < 2) {
            $errors['name'] = 'Name is required and must be at least 2 characters';
        }

        if (empty($data['email']) || !filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
            $errors['email'] = 'Valid email is required';
        }

        if (isset($data['age']) && (!is_numeric($data['age']) || $data['age'] < 1 || $data['age'] > 150)) {
            $errors['age'] = 'Age must be a number between 1 and 150';
        }

        return $errors;
    }


}
?>