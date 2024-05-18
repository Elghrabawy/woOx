<?php require "../includes/header.php"; ?>
<?php

include "../config/connect.php";

if (isset($_SESSION['username'])) {
    header("location: " . APPURL . "");
}

if (isset($_POST['login'])) {
    if (empty($_POST['password']) or empty($_POST['email'])) {
        echo "<script> alert('there are empty fields'); </script>";
    } else {
        try {
            $email = $_POST['email'];
            $password = $_POST['password'];

            $stm = "SELECT * FROM users WHERE email = '$email'";
            $query = $conn->query($stm);
            $query->execute();

            $fetch = $query->fetch(PDO::FETCH_ASSOC);

            if ($query->rowCount() > 0) {

                // if(password_verify($password, $fetch['password'])){
                if ($password == $fetch['password']) {

                    $_SESSION['username'] = $fetch['email'];
                    $_SESSION['user_id'] = $fetch['id'];

                    header("location: " . APPURL . "");
                } else {
                    echo "<script> alert('this password is not correct'); </script>";
                }
            } else {
                echo "<script> alert('this email is not exists'); </script>";
            }
        } catch (Exception $e) {
        }
    }
}
?>


<div class="reservation-form">
    <div class="container">
        <div class="row">

            <div class="col-lg-12">
                <form id="reservation-form" name="gs" method="POST" role="search" action="#">
                    <div class="row">
                        <div class="col-lg-12">
                            <h4>Login</h4>
                        </div>
                        <div class="col-md-12">
                            <fieldset>
                                <label for="email" class="form-label">Your Email</label>
                                <input type="email" name="email" class="Name" placeholder="email" autocomplete="on" required>
                            </fieldset>
                        </div>
                        <div class="col-md-12">
                            <fieldset>
                                <label for="password" class="form-label">Your Password</label>
                                <input type="password" name="password" class="Name" placeholder="password" autocomplete="on" required>
                            </fieldset>
                        </div>
                        <div class="col-lg-12">
                            <fieldset>
                                <button type="submit" name="login" class="main-button">login</button>
                            </fieldset>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<?php require "../includes/footer.php" ?>