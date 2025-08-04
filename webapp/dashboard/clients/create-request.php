<?php
session_start();
if (!isset($_SESSION['role'])) {
    if ($_SESSION['role'] != 'clients') {

        header("Location: ../../index.php");
        exit();
    }
}
$user = $_SESSION['user'];

?>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
    data-assets-path=" ../assets/" data-template="vertical-menu-template-free">
<?php include_once './includes/header.php'; ?>

<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->
            <?php include_once './includes/slider.php'; ?>
            <!-- / Menu -->

            <!-- Layout container -->
            <div class="layout-page">
                <!-- Navbar -->

                <?php include_once("./includes/navbar.php") ?>

                <!-- / Navbar -->

                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->
                    <div class="container-xxl flex-grow-1 container-p-y">
                        <h4 class="fw-bold py-3 mb-4">
                            <span class="text-muted fw-light">Dashboard /</span>
                            Create a Request for certificate
                        </h4>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-body">
                                    <form id="formCreateRequest">
                                        <div class="row">
                                            <div class="mb-3 col-md-6">
                                                <input type="hidden" value="<?= htmlspecialchars($user["id"]); ?>"
                                                    id="client_id">

                                                <label for="companyName" class="form-label">Company Name</label>
                                                <input class="form-control" type="text" id="companyName"
                                                    name="companyName" value="<?php echo $user['company_name']; ?>"
                                                    autofocus />
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="dataFor" class="form-label">Date</label>
                                                <input class="form-control" type="date" name="dataFor" id="myDateInput"
                                                    value="" />
                                            </div>

                                            <div class="mb-3 col-md-6">
                                                <label for="machine_name" class="form-label">Machine Name</label>


                                                <select class="form-control" name="machine_name" id="machine_name">
                                                    <!-- <option>Select Machine </option> -->
                                                    <option value="Passenger Matrial Hoist">Passenger Matrial Hoist
                                                    </option>
                                                    <option value="Dril RIG">Drill RIG</option>

                                                </select>
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="machine_details" class="form-label">Machine Details (Serial
                                                    no)</label>
                                                <input type="text" class="form-control" id="machine_details"
                                                    name="machine_details" value="" required />
                                            </div>
                                        </div>
                                        <div class="mt-2">
                                            <button type="submit" class="btn btn-primary me-2">
                                                Do Request
                                            </button>
                                            <button type="reset" class="btn btn-outline-secondary">
                                                Cancel
                                            </button>
                                        </div>
                                    </form>
                                </div>
                                <!-- /Account -->
                            </div>

                        </div>
                        <div class="card">
                            <h5 class="card-header">Bordered Table</h5>
                            <div class="card-body">
                                <div class="table-responsive text-nowrap">
                                    <table class="table table-bordered" id="certificationRequestsTable">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Machine Name</th>
                                                <th>Machine Details</th>
                                                <th>Request Date</th>
                                                <th>Assigned Engineer</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <!-- / Content -->

                <!-- Footer -->
                <?php include_once './includes/footer.php'; ?>
                <!-- / Footer -->
                <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>

    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
    $(document).ready(function() {
        // load Certification Requests funtion call
        var clientId = $('#client_id').val();
        loadCertificationRequests(clientId);

        const API_BASE_URL = '../../api';
        // Get the current date
        const today = new Date();
        const year = today.getFullYear();
        const month = String(today.getMonth() + 1).padStart(2, '0');
        const day = String(today.getDate()).padStart(2, '0');
        const formattedDate = `${year}-${month}-${day}`;
        document.getElementById('myDateInput').value = formattedDate;


        $('#formCreateRequest').submit(function(e) {
            e.preventDefault();
            // alert("submit");
            var clientId = $('#client_id').val();
            var formDataObj = {};

            formDataObj['client_id'] = clientId;
            $(this).serializeArray().forEach(function(item) {
                formDataObj[item.name] = item.value;
            });

            // formDataObj['client_id'] = 
            // 2. Convert object to JSON string
            var jsonData = JSON.stringify(formDataObj);
            // alert(jsonData);
            // console.log(jsonData);
            const endpoint = '/certification-requests';
            const apiUrl = API_BASE_URL + endpoint;
            $.ajax({
                method: 'POST',
                url: apiUrl,
                data: jsonData,
                dataType: "application/json",
                dataType: 'json',
                success: function(response) {
                    // console.log(response);
                    // alert(response);
                    if (response.success) {
                        alert('Inspection request Added');
                        $("#formCreateRequest")[0].reset();
                        loadCertificationRequests(clientId);
                    } else {
                        alert('Error: ' + response.message);
                    }
                },
                error: function(xhr, status, error) {
                    console.log(xhr.responseText);
                    alert('An error occurred: ' + error);
                }
            });

        });


        $("#btnLogout").click(function() {
            alert("logout funtion call");
            // window.location.href = "../auth/logout.php";
        });

        function loadCertificationRequests(clientId) {

            const API_BASE_URL = '../../api';
            // Construct the API URL dynamically with the provided client ID
            var apiUrl = API_BASE_URL + `/certification-requests/client/${clientId}`;
            $.ajax({
                url: apiUrl,
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    // console.log(response);

                    // Check if the API call was successful and data exists
                    if (response.success && response.data && response.data.length > 0) {
                        var tableBody = $('#certificationRequestsTable tbody');
                        tableBody.empty(); // Clear existing rows

                        // Iterate over the data array and build table rows
                        $.each(response.data, function(index, request) {
                            var statusClass = '';
                            if (request.status === 'pending') {
                                statusClass = 'bg-warning text-dark';
                            } else if (request.status === 'approved') {
                                statusClass = 'bg-success';
                            } else if (request.status === 'rejected') {
                                statusClass = 'bg-danger';
                            }

                            var row = `<tr>
                            <td>${request.id}</td>
                            <td>${request.machine_name}</td>
                            <td>${request.machine_details}</td>
                            <td>${request.request_date}</td>
                            <td>${request.assigned_engineer || 'N/A'}</td>
                            <td><span class="badge ${statusClass}">${request.status || 'N/A'}</span></td>
                        </tr>`;
                            tableBody.append(row);
                        });
                    } else {
                        // Handle case where no data is returned or the request failed
                        var tableBody = $('#certificationRequestsTable tbody');
                        tableBody.empty();
                        var message = response.message ||
                            'No certification requests found for this client.';
                        tableBody.append(
                            `<tr><td colspan="6" class="text-center">${message}</td></tr>`);
                    }
                },
                error: function(xhr, status, error) {
                    // Handle AJAX errors
                    console.error('An error occurred:', error);
                    var tableBody = $('#certificationRequestsTable tbody');
                    tableBody.empty();
                    tableBody.append(
                        `<tr><td colspan="6" class="text-center">Failed to load data. Please try again.</td></tr>`
                    );
                }
            });
        }




    });
    </script>

    <!-- Core JS -->
    <!-- build:js ../assets/vendor/js/core.js -->
    <script src=" ../assets/vendor/libs/jquery/jquery.js"></script>
    <script src=" ../assets/vendor/libs/popper/popper.js"></script>
    <script src=" ../assets/vendor/js/bootstrap.js"></script>
    <script src=" ../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src=" ../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->
    <!-- Vendors JS -->
    <script src=" ../assets/vendor/libs/apex-charts/apexcharts.js"></script>
    <script src=" ../assets/js/main.js"></script>
    <script src=" ../assets/js/dashboards-analytics.js"></script>
    <script async defer src="https://buttons.github.io/buttons.js"></script>
</body>

</html>