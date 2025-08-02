# Absolute Safety API

REST API for managing clients, engineers, and certification requests in the Absolute Safety system.

## Table of Contents
- [Base URL](#base-url)
- [Authentication](#authentication)
- [API Endpoints](#api-endpoints)
  - [Clients](#clients)
  - [Engineers](#engineers)
  - [Certification Requests](#certification-requests)
- [Request/Response Examples](#requestresponse-examples)
- [Error Handling](#error-handling)
- [Status Codes](#status-codes)
- [Rate Limiting](#rate-limiting)
- [Local Development](#local-development)

## Base URL
- http://localhost/absolute_safety_project/webapp/api


## Authentication
All endpoints require JWT authentication (to be implemented).

## API Endpoints

### Clients
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/clients` | GET | Get all clients |
| `/clients` | POST | Create new client |
| `/clients/{id}` | GET | Get client by ID |
| `/clients/{id}` | PUT | Update client |
| `/clients/{id}` | DELETE | Delete client |

### Engineers
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/engineers` | GET | Get all engineers |
| `/engineers` | POST | Create new engineer |
| `/engineers/{id}` | GET | Get engineer by ID |
| `/engineers/{id}` | PUT | Update engineer |
| `/engineers/{id}` | DELETE | Delete engineer |

### Certification Requests
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/certification-requests` | GET | Get all requests |
| `/certification-requests` | POST | Create new request |
| `/certification-requests/{id}` | GET | Get request by ID |
| `/certification-requests/{id}` | PUT | Update request |
| `/certification-requests/{id}` | DELETE | Delete request |
| `/certification-requests/client/{client_id}` | GET | Get requests by client |
| `/certification-requests/engineer/{engineer_id}` | GET | Get requests by engineer |
| `/certification-requests/{id}/status` | PUT | Update request status |

