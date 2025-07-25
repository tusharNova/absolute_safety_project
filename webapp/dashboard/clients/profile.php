<?php
session_start();
if (!isset($_SESSION['role'])) {
  if ($_SESSION['role'] == 'clients') {
    header("Location: ../../index.php");
    exit();
  }
  $user = $_SESSION['user'];
  
}
?>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
  data-assets-path=" ../assets/" data-template="vertical-menu-template-free">
<?php include_once './includes/header.php'; ?>

<body>
  <div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
      <!-- Menu -->
      <?php include_once './includes/slider.php'; ?>
      <!-- / Menu -->

      <!-- Layout container -->
      <div class="layout-page">

        <!-- Navbar -->
        <?php include_once './includes/navbar.php'; ?>
        <!-- / Navbar -->

        <!-- Content wrapper -->
        <div class="content-wrapper">
          <!-- Content -->
          <div>
            <?php
            $fullname = $user['first_name'] . " " . $user['last_name'];
            echo $fullname;
            echo "<br>";
            $cid = $user['id'];
            echo $cid;
            ?>
          </div>
          <div class="container-xxl flex-grow-1 container-p-y">
            <h4 class="fw-bold py-3 mb-4">
              <span class="text-muted fw-light">Account Settings /</span>
              Account
            </h4>

            <div class="row">
              <div class="col-md-12">
                <div class="card mb-4">
                  <h5 class="card-header">Profile Details</h5>
                  <hr class="my-0" />
                  <div class="card-body">
                    <form id="formAccountSettings" method="POST" onsubmit="return false">
                      <div class="row">
                        <div class="mb-3 col-md-6">
                          <label for="firstName" class="form-label">First Name</label>
                          <input class="form-control" type="text" id="firstName"
                            name="firstName" value="John" autofocus />
                        </div>
                        <div class="mb-3 col-md-6">
                          <label for="lastName" class="form-label">Last Name</label>
                          <input class="form-control" type="text" name="lastName"
                            id="lastName" value="Doe" />
                        </div>
                        <div class="mb-3 col-md-6">
                          <label for="email" class="form-label">E-mail</label>
                          <input class="form-control" type="text" id="email" name="email"
                            value="john.doe@example.com"
                            placeholder="john.doe@example.com" />
                        </div>
                        <div class="mb-3 col-md-6">
                          <label for="organization" class="form-label">Organization</label>
                          <input type="text" class="form-control" id="organization"
                            name="organization" value="XYZ private Limited" />
                        </div>
                        <div class="mb-3 col-md-6">
                          <label class="form-label" for="phoneNumber">Phone Number</label>
                          <div class="input-group input-group-merge">
                            <span class="input-group-text">IND (+91)</span>
                            <input type="text" id="phoneNumber" name="phoneNumber"
                              class="form-control" placeholder="98XXXXXXX" />
                          </div>
                        </div>
                        <div class="mb-3 col-md-6">
                          <label for="address" class="form-label">Address</label>
                          <input type="text" class="form-control" id="address" name="address"
                            placeholder="Address" />
                        </div>
                        <div class="mb-3 col-md-6">
                          <label for="state" class="form-label">State</label>
                          <input class="form-control" type="text" id="state" name="state"
                            placeholder="MH" />
                        </div>
                        <div class="mb-3 col-md-6">
                          <label for="zipCode" class="form-label">Zip Code</label>
                          <input type="text" class="form-control" id="zipCode" name="zipCode"
                            placeholder="441202" maxlength="6" />
                        </div>



                      </div>
                      <div class="mt-2">
                        <button type="submit" class="btn btn-primary me-2">
                          Save changes
                        </button>
                        <button type="reset" class="btn btn-outline-secondary">
                          Cancel
                        </button>
                      </div>
                    </form>
                  </div>
                  <!-- /Account -->
                </div>
                <div class="card">
                  <h5 class="card-header">Delete Account</h5>
                  <div class="card-body">
                    <div class="mb-3 col-12 mb-0">
                      <div class="alert alert-warning">
                        <h6 class="alert-heading fw-bold mb-1">
                          Are you sure you want to delete your account?
                        </h6>
                        <p class="mb-0">
                          Once you delete your account, there is no going
                          back. Please be certain.
                        </p>
                      </div>
                    </div>
                    <form id="formAccountDeactivation" onsubmit="return false">
                      <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" name="accountActivation"
                          id="accountActivation" />
                        <label class="form-check-label" for="accountActivation">I confirm my
                          account deactivation</label>
                      </div>
                      <button type="submit" class="btn btn-danger deactivate-account">
                        Deactivate Account
                      </button>
                    </form>
                  </div>
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
    </div>
    <div class="layout-overlay layout-menu-toggle"></div>
  </div>

  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script>
    $(document).ready(function() {
      $("#btnLogout").click(function() {
        window.location.href = "../../auth/logout.php";
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