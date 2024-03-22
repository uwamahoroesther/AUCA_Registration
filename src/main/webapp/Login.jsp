<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="stylesheet" href="css/style.css">
  <title>Login</title>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<div class="row no-gutter">
  <div class="col-md-6 no-gutters">
    <div class="leftside">
      <img src="images/auca_logo.png" alt="AUCA logo" class="logo">
      <h1 class="hdr">Login</h1>
      <h2>Welcome! Please Enter your details.</h2>
      <form action="/LoginServlet" method="post">
        <div class="input-group">
          <label for="id">Enter your Email or ID</label>
          <div class="input-field">
            <input type="text" name="userName" id="id" required>
          </div>

          <label for="password">password</label>
          <div class="input-field">
            <input type="password" class="fom-control" name="password" id="password" required>
          </div>
          <a href="forgotPassword.html">Forgot Password?</a>
          <div class="row mt-2 form-inputs">
            <label class="checkbox-label">
              <input id="lecturerCheck" name="user_type" value="staff" type="checkbox">
              Staff
            </label>

          </div>

          <div class="container-button">
            <button type="submit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCourseModal">Login</button>
          </div>
          <p>Don't have an account?<a href="registration.html">  Sign Up  </a></p>

        </div>
      </form>
    </div>
  </div>
  <div class="col-md-6 no-gutters">
    <div class="rightside">
      <img src="images/download.jpg" alt="AUCA building" class="building">
    </div>
  </div>
</div>
</body>
</html></html>