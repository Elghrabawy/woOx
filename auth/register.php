<?php require "../includes/header.php"; ?>
<?php require "../config/connect.php"; ?>

<?php
if (isset($_SESSION['username'])) {
    header("location: " . APPURL . "");
}


if (isset($_POST['register'])) {
    if (empty($_POST['username']) or empty($_POST['password']) or empty($_POST['email'])) {
        echo "<script> alert('there are empty fields'); </script>";
    } else {
        try {
            $username = $_POST['username'];
            // $password = password_hash($_POST['password'], PASSWORD_DEFAULT); //(password verify method not work)
            $password = $_POST['password'];
            $email = $_POST['email'];


            $select = $conn->query("SELECT * FROM users WHERE email = '$email'");
            $select->execute();

            if ($select->rowCount() > 0) {
                echo "<script> alert('this email is aleady exists'); </script>";
            } else {
                $insert = $conn->prepare("INSERT INTO users (username, email, password) VALUES (:username, :email, :password)");
                // $stm = "INSERT INTO users (username, email, password) VALUES('$username', '$email', '$password');";
                // $insert = mysqli_query($conn, $stm);
                // $insert = $conn->prepare($stm)->execute();

                $insert->execute([
                    ":username" => $username,
                    ":email" => $email,
                    ":password" => $password
                ]);
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
                <form id="reservation-form" name="gs" method="POST" role="search" action="register.php">
                    <div class="row">
                        <div class="col-lg-12">
                            <h4>Register</h4>
                        </div>
                        <div class="col-md-12">
                            <fieldset>
                                <label for="username" class="form-label">Username</label>
                                <input type="text" name="username" class="username" placeholder="username" autocomplete="on" required>
                            </fieldset>
                        </div>

                        <div class="col-md-12">
                            <fieldset>
                                <label for="email" class="form-label">Your Email</label>
                                <input type="email" name="email" class="email" placeholder="email" autocomplete="on" required>
                            </fieldset>
                        </div>

                        <div class="col-md-12">
                            <fieldset>
                                <label for="password" class="form-label">Your Password</label>
                                <input type="password" name="password" class="password" placeholder="password" autocomplete="on" required>
                            </fieldset>
                        </div>
                        <div class="col-lg-12">
                            <fieldset>
                                <button type="submit" name="register" id="register" class="main-button">register</button>
                            </fieldset>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php require "../includes/footer.php" ?>