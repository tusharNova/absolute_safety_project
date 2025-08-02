<?php
session_start();

if (!isset($_SESSION['role'])) {
  if ($_SESSION['role'] != 'clients') {

    header("Location: ../../index.php");
    exit();
  }
}
?>

<!-- <script>
  // alert("<?php echo $_SESSION['clients']; ?>");
</script>
 -->


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
        <?php include_once("./includes/navbar.php");?>
        <!-- / Navbar -->

        <!-- Content wrapper -->
        <div class="content-wrapper">
          <!-- Content -->

          <div class="container-xxl flex-grow-1 container-p-y">
            <h4 class="fw-bold py-3 mb-4">
              <span class="text-muted fw-light">Dashboard /</span>
              Account
            </h4>

            <div class="row">
              <div class="col-md-12">

                <!-- Account -->
                <h6 class="pb-1 mb-4 text-muted">Header and footer</h6>
                <div class="row mb-5">
                  <div class="col-md-6 col-lg-3 mb-3">
                    <div class="card">
                      <div class="card-header">Pending</div>
                      <div class="card-body">
                        <h5 class="card-title">2</h5>
                        <p class="card-text">
                          With supporting text below as a natural lead-in to additional

                        </p>
                        <!-- <a href="javascript:void(0)" class="btn btn-primary">Go
                          somewhere</a> -->
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6 col-lg-3 mb-3">
                    <div class="card">
                      <div class="card-header">Under Review</div>
                      <div class="card-body">
                        <h5 class="card-title">1</h5>
                        <p class="card-text">
                          With supporting text below as a natural lead-in to additional

                        </p>
                        <!-- <a href="javascript:void(0)" class="btn btn-primary">Go
                          somewhere</a> -->
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6 col-lg-3 mb-3">
                    <div class="card">
                      <div class="card-header">Completed</div>
                      <div class="card-body">
                        <h5 class="card-title">2</h5>
                        <p class="card-text">
                          With supporting text below as a natural lead-in to additional

                        </p>
                        <!-- <a href="javascript:void(0)" class="btn btn-primary">Go
                          somewhere</a> -->
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6 col-lg-3 mb-3">
                    <div class="card">
                      <div class="card-header">certified</div>
                      <div class="card-body">
                        <h5 class="card-title">0</h5>
                        <p class="card-text">
                          With supporting text below as a natural lead-in to additional

                        </p>
                        <!-- <a href="javascript:void(0)" class="btn btn-primary">Go
                          somewhere</a> -->
                      </div>
                    </div>
                  </div>

                </div>
                <!-- /Account -->
              </div>
            </div>

            <!-- table table details -->
            <div class="card">
              <h5 class="card-header">Bordered Table</h5>
              <div class="card-body">
                <div class="table-responsive text-nowrap">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>Project</th>
                        <th>Client</th>
                        <th>Users</th>
                        <th>Status</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <i class="fab fa-angular fa-lg text-danger me-3"></i>
                          <strong>Angular Project</strong>
                        </td>
                        <td>Albert Cook</td>
                        <td>
                          <ul
                            class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom"
                              data-bs-placement="top" class="avatar avatar-xs pull-up"
                              title="Lilian Fuller">
                              <img src="../assets/img/avatars/5.png" alt="Avatar"
                                class="rounded-circle" />
                            </li>
                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom"
                              data-bs-placement="top" class="avatar avatar-xs pull-up"
                              title="Sophia Wilkerson">
                              <img src="../assets/img/avatars/6.png" alt="Avatar"
                                class="rounded-circle" />
                            </li>
                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom"
                              data-bs-placement="top" class="avatar avatar-xs pull-up"
                              title="Christina Parker">
                              <img src="../assets/img/avatars/7.png" alt="Avatar"
                                class="rounded-circle" />
                            </li>
                          </ul>
                        </td>
                        <td><span class="badge bg-label-primary me-1">Active</span></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                              data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"><i
                                  class="bx bx-edit-alt me-1"></i> Edit</a>
                              <a class="dropdown-item" href="javascript:void(0);"><i
                                  class="bx bx-trash me-1"></i> Delete</a>
                            </div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td><i class="fab fa-react fa-lg text-info me-3"></i> <strong>React
                            Project</strong></td>
                        <td>Barry Hunter</td>
                        <td>
                          <ul
                            class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom"
                              data-bs-placement="top" class="avatar avatar-xs pull-up"
                              title="Lilian Fuller">
                              <img src="../assets/img/avatars/5.png" alt="Avatar"
                                class="rounded-circle" />
                            </li>
                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom"
                              data-bs-placement="top" class="avatar avatar-xs pull-up"
                              title="Sophia Wilkerson">
                              <img src="../assets/img/avatars/6.png" alt="Avatar"
                                class="rounded-circle" />
                            </li>
                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom"
                              data-bs-placement="top" class="avatar avatar-xs pull-up"
                              title="Christina Parker">
                              <img src="../assets/img/avatars/7.png" alt="Avatar"
                                class="rounded-circle" />
                            </li>
                          </ul>
                        </td>
                        <td><span class="badge bg-label-success me-1">Completed</span></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                              data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"><i
                                  class="bx bx-edit-alt me-1"></i> Edit</a>
                              <a class="dropdown-item" href="javascript:void(0);"><i
                                  class="bx bx-trash me-1"></i> Delete</a>
                            </div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td><i class="fab fa-vuejs fa-lg text-success me-3"></i> <strong>VueJs
                            Project</strong></td>
                        <td>Trevor Baker</td>
                        <td>
                          <ul
                            class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom"
                              data-bs-placement="top" class="avatar avatar-xs pull-up"
                              title="Lilian Fuller">
                              <img src="../assets/img/avatars/5.png" alt="Avatar"
                                class="rounded-circle" />
                            </li>
                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom"
                              data-bs-placement="top" class="avatar avatar-xs pull-up"
                              title="Sophia Wilkerson">
                              <img src="../assets/img/avatars/6.png" alt="Avatar"
                                class="rounded-circle" />
                            </li>
                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom"
                              data-bs-placement="top" class="avatar avatar-xs pull-up"
                              title="Christina Parker">
                              <img src="../assets/img/avatars/7.png" alt="Avatar"
                                class="rounded-circle" />
                            </li>
                          </ul>
                        </td>
                        <td><span class="badge bg-label-info me-1">Scheduled</span></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                              data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"><i
                                  class="bx bx-edit-alt me-1"></i> Edit</a>
                              <a class="dropdown-item" href="javascript:void(0);"><i
                                  class="bx bx-trash me-1"></i> Delete</a>
                            </div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <i class="fab fa-bootstrap fa-lg text-primary me-3"></i>
                          <strong>Bootstrap Project</strong>
                        </td>
                        <td>Jerry Milton</td>
                        <td>
                          <ul
                            class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom"
                              data-bs-placement="top" class="avatar avatar-xs pull-up"
                              title="Lilian Fuller">
                              <img src="../assets/img/avatars/5.png" alt="Avatar"
                                class="rounded-circle" />
                            </li>
                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom"
                              data-bs-placement="top" class="avatar avatar-xs pull-up"
                              title="Sophia Wilkerson">
                              <img src="../assets/img/avatars/6.png" alt="Avatar"
                                class="rounded-circle" />
                            </li>
                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom"
                              data-bs-placement="top" class="avatar avatar-xs pull-up"
                              title="Christina Parker">
                              <img src="../assets/img/avatars/7.png" alt="Avatar"
                                class="rounded-circle" />
                            </li>
                          </ul>
                        </td>
                        <td><span class="badge bg-label-warning me-1">Pending</span></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                              data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"><i
                                  class="bx bx-edit-alt me-1"></i> Edit</a>
                              <a class="dropdown-item" href="javascript:void(0);"><i
                                  class="bx bx-trash me-1"></i> Delete</a>
                            </div>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

          </div>
          <!-- / Content -->

          <!-- Footer -->
          <!-- Footer -->
          <?php include_once './includes/footer.php'; ?>
          <!-- / Footer -->
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
        alert("logout funtion call");
        // window.location.href = "../auth/logout.php";
      });
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