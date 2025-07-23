<?php 

session_start();

?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Absolute Safety - Login</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
    <div class="login-container">
      <div class="header">
        <h1>Absolute Safety</h1>
      </div>

      <h3 class="welcome-message">
        <strong>Welcome to Absolute Safety! 👋</strong><br />
        Please sign-in to your account and start the adventure
      </h3>

      <form id="loginForm">
        <div class="form-group">
          <label for="username">Username or Email</label>
          <input
            type="text"
            id="username"
            name="username"
            value="admin"
            placeholder="Enter your username or email"
            required
          />
        </div>

        <div class="form-group">
          <label for="password">Password</label>
          <div class="input-wrapper">
            <input
              type="password"
              id="password"
              name="password"
              placeholder="Enter your password"
              required
            />
            <button
              type="button"
              class="password-toggle"
              id="togglePassword"
              aria-label="Toggle password visibility"
            >
              👁️
            </button>
          </div>
        </div>

        <button type="submit" class="login-btn" id="signInBtn">Sign In</button>
      </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
      $(document).ready(function () {
        // Password show/hide functionality
        $("#togglePassword").on("click", function () {
          const passwordField = $("#password");
          const currentType = passwordField.attr("type");

          if (currentType === "password") {
            passwordField.attr("type", "text");
            $(this).text("🙈");
          } else {
            passwordField.attr("type", "password");
            $(this).text("👁️");
          }
        });

        // Form submission handler
        $("#loginForm").on("submit", function (e) {
          e.preventDefault();

          const data = {
            password: $("#password").val(),
            username: $("#username").val(),
          };

          // alert(data.username)
          // Here you would typically make an AJAX call to your backend
          $.ajax({
            url: "api.php",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(data),

            success: function (response) {
              // alert(response);
              if (response.status === 'success') {
                alert(`Welcome! Logged in as ${response.role}`);
              } else {
                alert("Login failed: " + response.message);
              }

              // window.location.href = '/dashboard';
            },
            error: function (xhr, status, error) {
              alert("Login failed: " + error);

            },
          });
        });

        // Add focus effects to inputs
        $("input").on("focus", function () {
          $(this).parent().css("transform", "scale(1.02)");
        });

        $("input").on("blur", function () {
          $(this).parent().css("transform", "scale(1)");
        });

        // Add smooth button hover effects
        $(".login-btn").on("mouseenter", function () {
          $(this).css({
            transform: "translateY(-2px)",
            "box-shadow": "0 8px 25px rgba(102, 126, 234, 0.3)",
          });
        });

        $(".login-btn").on("mouseleave", function () {
          $(this).css({
            transform: "translateY(0)",
            "box-shadow": "none",
          });
        });

        // Input validation on typing
        $("#username").on("input", function () {
          const value = $(this).val().trim();
          if (value.length > 0) {
            $(this).css("border-color", "#28a745");
          } else {
            $(this).css("border-color", "#e1e5e9");
          }
        });

        $("#password").on("input", function () {
          const value = $(this).val().trim();
          if (value.length >= 6) {
            $(this).css("border-color", "#28a745");
          } else if (value.length > 0) {
            $(this).css("border-color", "#ffc107");
          } else {
            $(this).css("border-color", "#e1e5e9");
          }
        });

        // Enter key functionality
        $("#username, #password").on("keypress", function (e) {
          if (e.which === 13) {
            // Enter key
            $("#loginForm").submit();
          }
        });

        // Clear form function (optional)
        window.clearForm = function () {
          $("#loginForm")[0].reset();
          $("input").css("border-color", "#e1e5e9");
        };
      });
    </script>
  </body>
</html>
