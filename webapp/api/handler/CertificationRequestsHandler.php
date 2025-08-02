<?php
require_once(__DIR__.'/../models/CertificationRequests.php');
require_once(__DIR__.'/../helpers/Response.php');

class CertificationRequestsHandler {
    private $certificationRequest;

    public function __construct() {
        $this->certificationRequest = new CertificationRequests();
    }

    public function getAll() {
        try {
            $result = $this->certificationRequest->getAll();
            Response::success($result, 'Certification requests retrieved successfully');
        } catch (Exception $e) {
            Response::error('Failed to retrieve certification requests: ' . $e->getMessage(), 500);
        }
    }

    public function getById($id) {
        if (!is_numeric($id)) {
            Response::error('Invalid certification request ID', 400);
        }

        try {
            $request = $this->certificationRequest->getById($id);
            if ($request) {
                Response::success($request, 'Certification request retrieved successfully');
            } else {
                Response::error('Certification request not found', 404);
            }
        } catch (Exception $e) {
            Response::error('Failed to retrieve certification request: ' . $e->getMessage(), 500);
        }
    }

    public function getByClientId($client_id) {
        if (!is_numeric($client_id)) {
            Response::error('Invalid client ID', 400);
        }

        try {
            $requests = $this->certificationRequest->getByClientId($client_id);
            Response::success($requests, 'Certification requests retrieved successfully');
        } catch (Exception $e) {
            Response::error('Failed to retrieve certification requests: ' . $e->getMessage(), 500);
        }
    }

    public function getByEngineerId($engineer_id) {
        if (!is_numeric($engineer_id)) {
            Response::error('Invalid engineer ID', 400);
        }

        try {
            $requests = $this->certificationRequest->getByEngineerId($engineer_id);
            Response::success($requests, 'Certification requests retrieved successfully');
        } catch (Exception $e) {
            Response::error('Failed to retrieve certification requests: ' . $e->getMessage(), 500);
        }
    }

    public function create() {
        $input = json_decode(file_get_contents('php://input'), true);

        // Basic validation
        if (empty($input['client_id']) || empty($input['machine_name'])) {
            Response::error('Client ID and machine name are required', 400);
        }

        try {
            $newRequest = $this->certificationRequest->create($input);
            if ($newRequest) {
                Response::success($newRequest, 'Certification request created successfully', 201);
            } else {
                Response::error('Failed to create certification request', 500);
            }
        } catch (Exception $e) {
            Response::error('Failed to create certification request: ' . $e->getMessage(), 500);
        }
    }

    public function update($id) {
        if (!is_numeric($id)) {
            Response::error('Invalid certification request ID', 400);
        }

        $input = json_decode(file_get_contents('php://input'), true);

        try {
            $updatedRequest = $this->certificationRequest->update($id, $input);
            if ($updatedRequest) {
                Response::success($updatedRequest, 'Certification request updated successfully');
            } else {
                Response::error('Failed to update certification request', 500);
            }
        } catch (Exception $e) {
            Response::error('Failed to update certification request: ' . $e->getMessage(), 500);
        }
    }

    public function updateStatus($id) {
        if (!is_numeric($id)) {
            Response::error('Invalid certification request ID', 400);
        }

        $input = json_decode(file_get_contents('php://input'), true);
        
        if (empty($input['status'])) {
            Response::error('Status is required', 400);
        }

        try {
            if ($this->certificationRequest->updateStatus($id, $input['status'])) {
                $updatedRequest = $this->certificationRequest->getById($id);
                Response::success($updatedRequest, 'Certification request status updated successfully');
            } else {
                Response::error('Failed to update certification request status', 500);
            }
        } catch (Exception $e) {
            Response::error('Failed to update certification request status: ' . $e->getMessage(), 500);
        }
    }

    public function delete($id) {
        if (!is_numeric($id)) {
            Response::error('Invalid certification request ID', 400);
        }

        try {
            if ($this->certificationRequest->delete($id)) {
                Response::success(null, 'Certification request deleted successfully');
            } else {
                Response::error('Failed to delete certification request', 500);
            }
        } catch (Exception $e) {
            Response::error('Failed to delete certification request: ' . $e->getMessage(), 500);
        }
    }
}
?>