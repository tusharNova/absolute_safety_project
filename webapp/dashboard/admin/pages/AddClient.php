<?php
include_once './cdnLinks.php';
include_once '../includes/header.php';
include_once "../includes/slide.php";
?>

<div class="layout-page">
    <nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
        id="layout-navbar">
        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
            <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
            </a>
        </div>

        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
            <!-- Search -->
            <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                    <i class="bx bx-search fs-4 lh-0"></i>
                    <input type="text" class="form-control border-0 shadow-none" placeholder="Search..."
                        aria-label="Search..." />
                </div>
            </div>
            <!-- /Search -->

            <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Place this tag where you want the button to render. -->
                <li class="nav-item lh-1 me-3">
                    <a class="github-button" href="https://github.com/themeselection/sneat-html-admin-template-free"
                        data-icon="octicon-star" data-size="large" data-show-count="true"
                        aria-label="Star themeselection/sneat-html-admin-template-free on GitHub">Star</a>
                </li>

                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                    <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                        <div class="avatar avatar-online">
                            <img src=" ../../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li>
                            <a class="dropdown-item" href="#">
                                <div class="d-flex">
                                    <div class="flex-shrink-0 me-3">
                                        <div class="avatar avatar-online">
                                            <img src=" ../../assets/img/avatars/1.png" alt
                                                class="w-px-40 h-auto rounded-circle" />
                                        </div>
                                    </div>
                                    <div class="flex-grow-1">
                                        <span class="fw-semibold d-block">John Doe</span>
                                        <small class="text-muted">User</small>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <div class="dropdown-divider"></div>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#">
                                <i class="bx bx-user me-2"></i>
                                <span class="align-middle">My Profile</span>
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#">
                                <i class="bx bx-cog me-2"></i>
                                <span class="align-middle">Settings</span>
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#">
                                <span class="d-flex align-items-center align-middle">
                                    <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
                                    <span class="flex-grow-1 align-middle">Billing</span>
                                    <span
                                        class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                                </span>
                            </a>
                        </li>
                        <li>
                            <div class="dropdown-divider"></div>
                        </li>
                        <li>
                            <a class="dropdown-item" id="btnLogout" style="cursor: pointer">
                                <i class="bx bx-power-off me-2"></i>
                                <span class="align-middle">Log Out</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!--/ User -->
            </ul>
        </div>
    </nav>

    <div class="content-wrapper">
        <div class="container-xxl flex-grow-1 container-p-y">
            <div class="row">
                <!-- Add Client Form -->
                <div class="col-md-6">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title">Add New Client</h5>
                            <form id="addClientForm">
                                <div class="mb-3">
                                    <label for="username" class="form-label">Username</label>
                                    <input type="text" class="form-control" id="username" name="username" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>
                                <!-- <div class="mb-3">
                                    <label for="first_name" class="form-label">First Name</label>
                                    <input type="text" class="form-control" id="first_name" name="first_name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="last_name" class="form-label">Last Name</label>
                                    <input type="text" class="form-control" id="last_name" name="last_name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                                <div class="mb-3">
                                    <label for="company_name" class="form-label">Company Name</label>
                                    <input type="text" class="form-control" id="company_name" name="company_name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="contact" class="form-label">Contact</label>
                                    <input type="text" class="form-control" id="contact" name="contact" required>
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <textarea class="form-control" id="address" name="address" rows="2"></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="state" class="form-label">State</label>
                                    <input type="text" class="form-control" id="state" name="state" required>
                                </div>
                                <div class="mb-3">
                                    <label for="pincode" class="form-label">Pincode</label>
                                    <input type="text" class="form-control" id="pincode" name="pincode" required>
                                </div> -->
                                <button type="submit" class="btn btn-primary">Add Client</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Clients Table -->
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Clients List</h5>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped" id="clientsTable">
                                    <thead>
                                        <tr>
                                            <th>Sr.no</th>
                                            <th>Username</th>
                                            <!-- <th>Password</th> -->
                                            <!-- <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Email</th> -->
                                            <th>Company</th>
                                            <th>Contact</th>
                                            <th>Status</th>
                                            <!-- <th>Actions</th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Data will be loaded via AJAX -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- <img src="../../auth/add" alt=""> -->
        <?php
        include_once '../includes/footer.php';

        ?>
    </div>
</div>

<!-- jQuery and other scripts -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="../../assets/vendor/libs/popper/popper.js"></script>
<script src="../../assets/vendor/js/bootstrap.js"></script>
<script src="../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="../../assets/vendor/js/menu.js"></script>
<script src="../../assets/js/main.js"></script>

<script>
    $(document).ready(function() {
        // Load clients data on page load
        loadClients();
        
        $("#addClientForm").submit(function(e) {
            e.preventDefault();


            var formDataObj = {};
            $(this).serializeArray().forEach(function(item) {
                formDataObj[item.name] = item.value;
            });

            // 2. Convert object to JSON string
            var jsonData = JSON.stringify(formDataObj);
            alert(jsonData);
            // 3. Send AJAX request with JSON
            $.ajax({
                url: '../../../api/clients', // Adjust as needed
                type: 'POST',
                data: jsonData,
                contentType: 'application/json', // tell the server it's JSON
                dataType: 'json', // expect JSON response
                success: function(response) {
                    console.log(response);
                    if (response.success) {
                        alert('Client added successfully!');
                        $("#addClientForm")[0].reset();
                        loadClients(); // Refresh the client table
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

        // Logout button handler
        $("#btnLogout").click(function() {
            window.location.href = "../auth/logout.php";
        });
    });

    // Function to load clients data
    // function loadClients() {
    //     $.ajax({
    //         url: '../../../api/clients', // You'll need to create this file
    //         type: 'GET',
    //         dataType: 'json',
    //         success: function(response) {
    //             alert(response);
    //             console.log(response)
    //             if (response.status === 'success') {
    //                 var tableBody = $('#clientsTable tbody');
    //                 tableBody.empty();
    //                 var i = 1;
    //                 $.each(response.data, function(index, client) {
    //                     var row = '<tr>' +
    //                         '<td>' + i++ + '</td>' +
    //                         '<td>' + client.username + '</td>' +
    //                         '<td>' + client.company_name + '</td>' +
    //                         '<td>' + client.contact + '</td>' +
    //                         '<td><span class="badge bg-' + (client.status === 'Active' ? 'success' : 'danger') + '">' + client.status + '</span></td>' +
    //                         '<td>' +
    //                         // '<button class="btn btn-sm btn-primary edit-client" data-id="' + client.id + '">Edit</button> ' +
    //                         // '<button class="btn btn-sm btn-danger delete-client" data-id="' + client.id + '">Delete</button>' +
    //                         '</td>' +
    //                         '</tr>';

    //                     tableBody.append(row);
    //                 });
    //             } else {
    //                 alert('Error loading clients: ' + response.message);
    //             }
    //         },
    //         error: function(xhr, status, error) {
    //             alert('An error occurred while loading clients: ' + error);
    //         }
    //     });
    // }
    function loadClients() {
        $.ajax({
            url: '../../../api/clients', // Make sure this endpoint returns the JSON shown above
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                console.log(response);
                if (response.success) {
                    var tableBody = $('#clientsTable tbody');
                    tableBody.empty();
                    var i = 1;
                    $.each(response.data, function(index, client) {
                        var row = '<tr>' +
                            '<td>' + i++ + '</td>' +
                            '<td>' + client.username + '</td>' +
                            '<td>' + client.company_name + '</td>' +
                            '<td>' + client.contact + '</td>' +
                            '<td><span class="badge bg-' + (client.status && client.status.toLowerCase() === 'active' ? 'success' : 'danger') + '">' + (client.status || 'N/A') + '</span></td>' +
                            // '<td>' +
                            // Add Edit/Delete buttons if needed
                            // '</td>' +
                            '</tr>';
                        tableBody.append(row);
                    });
                } else {
                    alert('Error loading clients: ' + response.message);
                }
            },
            error: function(xhr, status, error) {
                alert('An error occurred while loading clients: ' + error);
            }
        });
    }
</script>