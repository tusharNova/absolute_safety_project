<?php
include_once("../../core/session_helper.php");

checkDashboardAccess('Admins');
?>

<?php include_once 'includes/header.php' ?>
<!-- Menu -->
<?php include_once 'includes/slide.php'; ?>
<!-- / Menu -->
<!-- Layout container -->
<div class="layout-page">
    <!-- Navbar -->

<?php include_once('includes/navbar.php')?>
    <!-- / Navbar -->
    <!-- Content wrapper -->
    <div class="content-wrapper">
        <!-- Content -->
        <div class="container-xxl flex-grow-1 container-p-y">
            <div class="row">
                <div class="col-md-6 col-xl-4">
                    <div class="card bg-primary text-white mb-3">
                        <div class="card-header">Status</div>
                        <div class="card-body">
                            <h5 class="card-title text-white">
                                Requests for Certificate
                            </h5>
                            <h3 class="text-white">10</h3>
                            <!-- <p class="card-text">
                        Some quick example text to build on the card title and
                        make up.
                      </p> -->
                            <a href="javascript:void(0)" class="btn btn-dark">Show Requests</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-4">
                    <div class="card bg-secondary text-white mb-3">
                        <div class="card-header">Status</div>
                        <div class="card-body">
                            <h5 class="card-title text-white">In Progress</h5>
                            <h3 class="text-white">15</h3>
                            <!-- <p class="card-text">
                        Some quick example text to build on the card title and
                        make up.
                      </p> -->
                            <a href="javascript:void(0)" class="btn btn-dark">Move</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-4">
                    <div class="card bg-success text-white mb-3">
                        <div class="card-header">Status</div>
                        <div class="card-body">
                            <h5 class="card-title text-white">New Requests</h5>
                            <h3 class="text-white">15</h3>
                            <a href="javascript:void(0)" class="btn btn-dark">Show</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-4">
                    <div class="card bg-info text-white mb-3">
                        <div class="card-header">Status</div>
                        <div class="card-body">
                            <h5 class="card-title text-white">Rejected</h5>
                            <h3 class="text-white">5</h3>
                            <a href="javascript:void(0)" class="btn btn-dark">Update</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-4">
                    <div class="card bg-danger text-white mb-3">
                        <div class="card-header">Status</div>
                        <div class="card-body">
                            <!-- <h5 class="card-title text-white">Danger card title</h5> -->
                            <h5 class="card-title text-white">Delivered</h5>
                            <h3 class="text-white">25</h3>
                            <a href="javascript:void(0)" class="btn btn-dark">Information</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-4">
                    <div class="card bg-warning text-white mb-3">
                        <div class="card-header">Status</div>
                        <div class="card-body">
                            <!-- <h5 class="card-title text-white">Danger card title</h5> -->
                            <h5 class="card-title text-white">Expired</h5>

                            <h3 class="text-white">3</h3>
                            <a href="javascript:void(0)" class="btn btn-dark">Recreate</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 mb-4 order-0">
                    <div class="card">
                        <div class="d-flex align-items-end row">
                            <div class="col-sm-7">
                                <div class="card-body">
                                    <h5 class="card-title text-primary">
                                        Hoist Inspection Summary 🏗️
                                    </h5>
                                    <p class="mb-4">
                                        Last inspection completed on
                                        <span class="fw-bold">26.05.2025</span>. Next
                                        inspection due by
                                        <span class="fw-bold">25.11.2025</span>.
                                    </p>
                                    <a href="javascript:;" class="btn btn-sm btn-outline-primary">View Full Report</a>
                                </div>
                            </div>
                            <!-- <div class="col-sm-5 text-center text-sm-left">
                                            <div class="card-body pb-0 px-0 px-md-4">
                                                <img src="../assets/img/illustrations/construction-light.png" height="140"
                                                    alt="Hoist Inspection" data-app-dark-img="illustrations/construction-dark.png"
                                                    data-app-light-img="illustrations/construction-light.png" />
                                            </div>
                                        </div> -->
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 order-1">
                    <div class="row">
                        <div class="col-lg-6 col-md-12 col-6 mb-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-title d-flex align-items-start justify-content-between">
                                        <span class="fw-semibold d-block mb-1">Active Hoists</span>
                                    </div>

                                    <h3 class="card-title mb-2">1</h3>
                                    <small class="text-success fw-semibold">Operational</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-6 mb-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-title d-flex align-items-start justify-content-between">
                                        <span>Safety Score</span>
                                    </div>

                                    <h3 class="card-title text-nowrap mb-1">98%</h3>
                                    <small class="text-success fw-semibold">All systems OK</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Hoist Details -->
                <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
                    <div class="card">
                        <h5 class="card-header">
                            ALBISO SC200 Hoist Specifications
                        </h5>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <ul class="list-unstyled mb-0">
                                        <li class="mb-2">
                                            <strong>Serial No:</strong> 20250502
                                        </li>
                                        <li class="mb-2">
                                            <strong>Maximum Capacity:</strong> 2 ton (1600kg
                                            SWL)
                                        </li>
                                        <li class="mb-2">
                                            <strong>Current Height:</strong> 60 meters
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <ul class="list-unstyled mb-0">
                                        <li class="mb-2">
                                            <strong>Manufacture Date:</strong> 01/2025
                                        </li>
                                        <li class="mb-2">
                                            <strong>Safety Lock No:</strong> 01398355
                                        </li>
                                        <li class="mb-2">
                                            <strong>Certificate Valid Until:</strong> 01/2030
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="mt-3">
                                <div class="alert alert-success">
                                    <h6 class="alert-heading">Last Inspection Results</h6>
                                    <p class="mb-0">
                                        All critical components checked and found
                                        satisfactory. Preventive drop safety device working
                                        properly.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ Hoist Details -->

                <!-- Maintenance Schedule -->
                <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                    <div class="card h-100">
                        <h5 class="card-header">Maintenance Schedule</h5>
                        <div class="card-body">
                            <div class="mb-3">
                                <h6 class="small">Next Scheduled Maintenance</h6>
                                <div class="alert alert-warning">
                                    <i class="bx bx-calendar-exclamation"></i> 26.11.2025
                                    (6 months from last inspection)
                                </div>
                            </div>
                            <div>
                                <h6 class="small">Recommended Actions</h6>
                                <ul class="list-unstyled">
                                    <li class="d-flex mb-2">
                                        <span class="badge bg-label-success me-2"><i class="bx bx-check"></i></span>
                                        <span>Follow manufacturer's scheduled maintenance</span>
                                    </li>
                                    <li class="d-flex mb-2">
                                        <span class="badge bg-label-primary me-2"><i class="bx bx-check"></i></span>
                                        <span>Monitor brake performance</span>
                                    </li>
                                    <li class="d-flex">
                                        <span class="badge bg-label-primary me-2"><i class="bx bx-check"></i></span>
                                        <span>Check safety gear monthly</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ Maintenance Schedule -->
            </div>

            <div class="row">
                <!-- Inspection Components -->
                <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
                    <div class="card h-100">
                        <div class="card-header d-flex align-items-center justify-content-between pb-0">
                            <div class="card-title mb-0">
                                <h5 class="m-0 me-2">Component Status</h5>
                                <small class="text-muted">Last inspection: 26.05.2025</small>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div id="componentStatusChart"></div>
                            </div>
                            <ul class="p-0 m-0">
                                <li class="d-flex mb-4 pb-1">
                                    <div class="avatar flex-shrink-0 me-3">
                                        <span class="avatar-initial rounded bg-label-success"><i
                                                class="bx bx-check-shield"></i></span>
                                    </div>
                                    <div
                                        class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                        <div class="me-2">
                                            <h6 class="mb-0">Safety Systems</h6>
                                            <small class="text-muted">Gates, interlocks, safety gear</small>
                                        </div>
                                        <div class="badge bg-label-success rounded-pill">
                                            OK
                                        </div>
                                    </div>
                                </li>
                                <li class="d-flex mb-4 pb-1">
                                    <div class="avatar flex-shrink-0 me-3">
                                        <span class="avatar-initial rounded bg-label-success"><i
                                                class="bx bx-cog"></i></span>
                                    </div>
                                    <div
                                        class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                        <div class="me-2">
                                            <h6 class="mb-0">Mechanical Parts</h6>
                                            <small class="text-muted">Brakes, gearbox, guides</small>
                                        </div>
                                        <div class="badge bg-label-success rounded-pill">
                                            OK
                                        </div>
                                    </div>
                                </li>
                                <li class="d-flex mb-4 pb-1">
                                    <div class="avatar flex-shrink-0 me-3">
                                        <span class="avatar-initial rounded bg-label-success"><i
                                                class="bx bx-bolt"></i></span>
                                    </div>
                                    <div
                                        class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                        <div class="me-2">
                                            <h6 class="mb-0">Electrical Systems</h6>
                                            <small class="text-muted">Controls, wiring, sensors</small>
                                        </div>
                                        <div class="badge bg-label-success rounded-pill">
                                            OK
                                        </div>
                                    </div>
                                </li>
                                <li class="d-flex">
                                    <div class="avatar flex-shrink-0 me-3">
                                        <span class="avatar-initial rounded bg-label-info"><i
                                                class="bx bx-note"></i></span>
                                    </div>
                                    <div
                                        class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                        <div class="me-2">
                                            <h6 class="mb-0">Documentation</h6>
                                            <small class="text-muted">Certificates, manuals</small>
                                        </div>
                                        <div class="badge bg-label-info rounded-pill">
                                            Complete
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--/ Inspection Components -->

                <!-- Compliance Overview -->
                <div class="col-md-6 col-lg-4 order-1 mb-4">
                    <div class="card h-100">
                        <div class="card-header">
                            <h5>Regulatory Compliance</h5>
                        </div>
                        <div class="card-body">
                            <div class="d-flex p-4 pt-3">
                                <!-- <div class="avatar flex-shrink-0 me-3">
                                                <img src="../assets/img/icons/unicons/law.png" alt="Compliance" />
                                            </div> -->
                                <div>
                                    <small class="text-muted d-block">Maharashtra Factories Rules 1963</small>
                                    <div class="d-flex align-items-center">
                                        <h6 class="mb-0 me-1">Fully Compliant</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="compliance-timeline mt-4">
                                <h6 class="small mb-3">Key Compliance Dates</h6>
                                <ul class="timeline">
                                    <li class="timeline-item timeline-item-success mb-4">
                                        <span class="timeline-point"></span>
                                        <div class="timeline-event">
                                            <div class="timeline-header">
                                                <h6 class="mb-0">Last Inspection</h6>
                                                <small class="text-muted">26 May 2025</small>
                                            </div>
                                            <p class="mb-2">Completed by Absolute Safety</p>
                                        </div>
                                    </li>
                                    <li class="timeline-item timeline-item-primary mb-4">
                                        <span class="timeline-point"></span>
                                        <div class="timeline-event">
                                            <div class="timeline-header">
                                                <h6 class="mb-0">Next Inspection Due</h6>
                                                <small class="text-muted">25 Nov 2025</small>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="timeline-item timeline-item-warning">
                                        <span class="timeline-point"></span>
                                        <div class="timeline-event">
                                            <div class="timeline-header">
                                                <h6 class="mb-0">Certificate Expiry</h6>
                                                <small class="text-muted">01 Jan 2030</small>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ Compliance Overview -->

                <!-- Recent Activities -->
                <div class="col-md-6 col-lg-4 order-2 mb-4">
                    <div class="card h-100">
                        <div class="card-header d-flex align-items-center justify-content-between">
                            <h5 class="card-title m-0 me-2">Maintenance Log</h5>
                        </div>
                        <div class="card-body">
                            <ul class="p-0 m-0">
                                <li class="d-flex mb-4 pb-1">
                                    <div class="avatar flex-shrink-0 me-3">
                                        <span class="avatar-initial rounded bg-label-success"><i
                                                class="bx bx-check"></i></span>
                                    </div>
                                    <div
                                        class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                        <div class="me-2">
                                            <small class="text-muted d-block mb-1">26 May 2025</small>
                                            <h6 class="mb-0">Routine Inspection</h6>
                                            <small>All components checked - no defects
                                                found</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="d-flex mb-4 pb-1">
                                    <div class="avatar flex-shrink-0 me-3">
                                        <span class="avatar-initial rounded bg-label-info"><i
                                                class="bx bx-cog"></i></span>
                                    </div>
                                    <div
                                        class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                        <div class="me-2">
                                            <small class="text-muted d-block mb-1">15 Apr 2025</small>
                                            <h6 class="mb-0">Brake Adjustment</h6>
                                            <small>Normal wear adjustment performed</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="d-flex mb-4 pb-1">
                                    <div class="avatar flex-shrink-0 me-3">
                                        <span class="avatar-initial rounded bg-label-primary"><i
                                                class="bx bx-wrench"></i></span>
                                    </div>
                                    <div
                                        class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                        <div class="me-2">
                                            <small class="text-muted d-block mb-1">02 Mar 2025</small>
                                            <h6 class="mb-0">Safety Gear Test</h6>
                                            <small>Drop test performed - satisfactory</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="d-flex">
                                    <div class="avatar flex-shrink-0 me-3">
                                        <span class="avatar-initial rounded bg-label-secondary"><i
                                                class="bx bx-calendar"></i></span>
                                    </div>
                                    <div
                                        class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                        <div class="me-2">
                                            <small class="text-muted d-block mb-1">10 Jan 2025</small>
                                            <h6 class="mb-0">Installation Completed</h6>
                                            <small>Hoist commissioned at 60m height</small>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <!-- Footer -->
        <?php include_once 'includes/footer.php'; ?>
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
        $("#btnLogout").click(function() {

            alert("okkk")
            // window.location.href = "../auth/logout.php";
        });
    });
</script>

<!-- Core JS -->

<script src=" ../assets/vendor/libs/jquery/jquery.js"></script>
<script src=" ../assets/vendor/libs/popper/popper.js"></script>
<script src=" ../assets/vendor/js/bootstrap.js"></script>
<script src=" ../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src=" ../assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script src=" ../assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src=" ../assets/js/main.js"></script>
<!-- <script src="../assets/js/main.js"></script> -->
<!-- Page JS -->
<script src=" ../assets/js/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>

</html>