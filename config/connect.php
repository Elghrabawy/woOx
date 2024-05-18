<?php
try {
    // host name
    $host = "localhost";

    // username
    $user = "root";

    // password
    $password = "";

    // database name
    $dbname = "wooxtravel";

    // connection

    // $conn = mysqli_connect($host, $user, $password, $dbname);

    $conn = new PDO("mysql:host=" . $host . ";dbname=" . $dbname . "", $user, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($conn) {
        echo 'Connected to the Database!';
    } else {
        echo 'Error';
    }
} catch (Exception $e) {
    echo $e->getMessage();
}
