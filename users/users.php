<?php require "../includes/header.php"; ?>
<?php require "../config/connect.php"; ?>

<?php
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $user_booking = $conn->query(
        "SELECT * FROM booking WHERE user_id = $id"
    );
    $user_booking->execute();
    $allUserBookings = $user_booking->fetchAll(PDO::FETCH_OBJ);
} else {
    header("location: " . APPURL . "");
}


?>

<div class="container ">
    <div class="row justify-content-center">

        <table class="table col-12 table-dark" style="margin-top: 110px; margin-bottom: 65px;">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Number of Guests</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Checkin Date</th>
                    <th scope="col">Destination</th>
                    <th scope="col">Status</th>
                    <!-- <th scope="col">Payment</th> -->
                </tr>
            </thead>
            <tbody>
                <?php $counter = 1 ?>
                <?php foreach ($allUserBookings as $booking) : ?>
                    <tr>
                        <th scope="row"><?php echo $counter++; ?></th>
                        <td scope="col"><?php echo $booking->name; ?></td>
                        <td scope="col"><?php echo $booking->num_of_guests; ?></td>
                        <td scope="col"><?php echo $booking->phone_number; ?></td>
                        <td scope="col"><?php echo $booking->checkin_date; ?></td>
                        <td scope="col"><?php echo $booking->destination; ?></td>
                        <td scope="col"><?php echo $booking->status; ?></td>
                        <!-- <td scope="col"><?php echo $booking->payment; ?></td> -->
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>







<?php require "../includes/footer.php"; ?>