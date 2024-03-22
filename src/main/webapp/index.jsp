<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/Header.css" />
    <link rel="stylesheet" href="css/Login_Signup.css" />

    <title>AUCA Registration - Login</title>
</head>
<body>
<div class="login-signup">
    <section class="left-side container">
        <div class="auca-logo-container">
            <img src="images/auca_logo.png" alt="" class="auca-logo mt-5" />
        </div>

        <form method="post" action="LoginServlet" id="form1">
            <div class="row justify-content-center align-items-center h-100"> <!-- Center content vertically and horizontally -->
                <div class="col-md-6">
                    <h2 class="h2 txt-prmry text-center">Login</h2>
                    <h6 class="txt-scndry mb-3 text-center info-txt">Welcome! Please enter your details.</h6>
                    <div class="form-group mt-2">
                        <label for="txtUsername" class="input-label">Enter your Email or ID</label>
                        <input name="userName" type="text" id="txtUsername" class="form-control" />
                    </div>
                    <div class="form-group mt-2">
                        <label for="txtPassword" cass="input-label">Password</label>
                        <input name="password" type="password" id="txtPassword" class="form-control" />
                        <a href="ForgotPassword" class="foget-password-txt">Forgot password</a>
                    </div>

                    <div class="form-check mt-2">
                        <input id="LecturerCheck" type="checkbox" name="user_type" class="form-check-input" value="staff" />
                        <label class="form-check-label input-label" for="LecturerCheck">
                            I am a staff
                        </label>
                    </div>

                    <div class="form-inputs">
                        <button class="btn btn-primary mt-4 mb-3 text-light" type="submit">Sign In</button>

                        <span class="text-center info-txt mb-4">Don't have an account? <a href="Signup">Sign Up</a></span>
                        <label style="color: red;">${message}</label>
                    </div>
                </div>
            </div>
        </form>
    </section>
    <section class="right-side"></section>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
