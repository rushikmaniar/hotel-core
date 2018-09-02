<?php
session_start();


$mysqli = new mysqli('localhost', 'root', 'root', 'hotel_minute_masti');
if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
}

if (isset($_SESSION['hotel-admin'])) {
    //continute to dashboard

    header("Location: http://localhost/hotel-core/backoffice/dashboard.php");
    die();
} else {
    //else login first
    echo '<pre>';
    print_r($_POST);
    echo '</pre>';
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $password = sha1($password);

        $result = $mysqli->query("SELECT * FROM user_master WHERE user_email='$username' AND user_password='$password' AND user_type=1");

        if ($result->num_rows == 1) {
            $arr = $result->fetch_assoc();
            $_SESSION['hotel-admin'] = $arr;
        }

        /* free result set */
        $result->free();
    } else {
        //nothing
    }


    /* close connection */
    $mysqli->close();
}
?>
<!DOCTYPE html>
<html>
<head>
    <?php include('include/head.php'); ?>
</head>
<body>
<div class="login-wrap customscroll d-flex align-items-center flex-wrap justify-content-center pd-20">
    <div class="login-box bg-white box-shadow pd-30 border-radius-5">
        <img src="vendors/images/login-img.png" alt="login" class="login-img">
        <h2 class="text-center mb-30">Login</h2>
        <form action="index.php" method="post">
            <div class="input-group custom input-group-lg">
                <input type="text" class="form-control" placeholder="User Email" name="username">
                <div class="input-group-append custom">
                    <span class="input-group-text"><i class="fa fa-user" aria-hidden="true"></i></span>
                </div>
            </div>
            <div class="input-group custom input-group-lg">
                <input type="password" class="form-control" placeholder="**********" name="password">
                <div class="input-group-append custom">
                    <span class="input-group-text"><i class="fa fa-lock" aria-hidden="true"></i></span>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="input-group">
                        <!--
                            use code for form submit
                            <input class="btn btn-outline-primary btn-lg btn-block" type="submit" value="Sign In">
                        -->
                        <button class="btn btn-outline-primary btn-lg btn-block" type="submit">Sign In</button>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="forgot-password padding-top-10"><a href="forgot-password.php">Forgot Password</a></div>
                </div>
            </div>
        </form>
    </div>
</div>
<?php include('include/script.php'); ?>
</body>
</html>