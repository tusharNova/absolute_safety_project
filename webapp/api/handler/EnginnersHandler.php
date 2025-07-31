<?php

require_once('models/Engineers.php');
require_once('helpers/Response.php');

class EngineerHandler {
    private $engineer;

    public function __construct() {
        $this->engineer = new Engineers();
    }

    public function getAll() {
        try {
            $result = $this->engineer->getAll();
            Response::success($result, 'Engineers retrieved successfully');
        } catch (Exception $e) {
            Response::error('Failed to retrieve engineers: ' . $e->getMessage(), 500);
        }
    }

    public function getById($id) {
        if (!is_numeric($id)) {
            Response::error('Invalid engineer ID', 400);
        }

        try {
            $engineer = $this->engineer->getById($id);
            if ($engineer) {
                Response::success($engineer, 'Engineer retrieved successfully');
            } else {
                Response::error('Engineer not found', 404);
            }
        } catch (Exception $e) {
            Response::error('Failed to retrieve engineer: ' . $e->getMessage(), 500);
        }
    }

    public function create() {
        $input = json_decode(file_get_contents('php://input'), true);

        if ($this->engineer->emailExists($input['email'])) {
            Response::error('Email already exists', 409);
        }

        try {
            $new_engineer = $this->engineer->create($input);
            if ($new_engineer) {
                Response::success($new_engineer, 'Engineer created successfully', 201);
            } else {
                Response::error('Failed to create engineer', 500);
            }
        } catch (Exception $e) {
            Response::error('Failed to create engineer: ' . $e->getMessage(), 500);
        }
    }

    public function update($id) {
        if (!is_numeric($id)) {
            Response::error('Invalid engineer ID', 400);
        }

        $input = json_decode(file_get_contents('php://input'), true);

        try {
            $updated_engineer = $this->engineer->update($id, $input);
            if ($updated_engineer) {
                Response::success($updated_engineer, 'Engineer updated successfully');
            } else {
                Response::error('Failed to update engineer', 500);
            }
        } catch (Exception $e) {
            Response::error('Failed to update engineer: ' . $e->getMessage(), 500);
        }
    }

    public function delete($id) {
        if (!is_numeric($id)) {
            Response::error('Invalid engineer ID', 400);
        }

        $existing_engineer = $this->engineer->getById($id);
        if (!$existing_engineer) {
            Response::error('Engineer not found', 404);
        }

        try {
            if ($this->engineer->delete($id)) {
                Response::success(null, 'Engineer deleted successfully');
            } else {
                Response::error('Failed to delete engineer', 500);
            }
        } catch (Exception $e) {
            Response::error('Failed to delete engineer: ' . $e->getMessage(), 500);
        }
    }
}
?>
