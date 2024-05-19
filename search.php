<?php require "includes/header.php"; ?>
<?php require "config/connect.php"; ?>

<?php
if (isset($_POST['search'])) {
    if (empty($_POST['destination']) or empty($_POST['price'])) {
        echo "<script> alert('there are empty fields'); </script>";
    } else {
        $destination = $_POST['destination'];
        $price = $_POST['price'];

        if ($destination != -1 && $price != -1) {
            $cities = $conn->query("SELECT * FROM cities WHERE country_id = $destination AND price <= $price");
        } else if ($destination == -1 && $price != -1) {

            $cities = $conn->query("SELECT * FROM cities WHERE price <= $price");
        } else if ($destination != -1 && $price == -1) {
            $cities = $conn->query("SELECT * FROM cities WHERE country_id = $destination");
        } else {
            $cities = $conn->query("SELECT * FROM cities");
        }

        $cities->execute();
        $allCities = $cities->fetchAll(PDO::FETCH_OBJ);
    }
}
?>

<div class="page-heading">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h4>Search Results</h4>
                <h2>Amazing Prices &amp; More</h2>
            </div>
        </div>
    </div>
</div>

<div class="amazing-deals">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="section-heading text-center">
                    <h2>Best Weekly Offers In Each City</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                </div>
            </div>
            <?php foreach ($allCities as $city) : ?>
                <div class="col-lg-6 col-sm-6">
                    <div class="item">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="image">
                                    <img src="<?php echo APPURL; ?> /assets/images/<?php echo $city->deal_image; ?>" alt="">
                                </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                                <div class="content">
                                    <span class="info">*Limited Offer Today</span>
                                    <h4><?php echo $city->name; ?></h4>
                                    <div class="row">
                                        <div class="col-6">
                                            <i class="fa fa-clock"></i>
                                            <span class="list"><?php echo $city->trip_days; ?> Days</span>
                                        </div>
                                        <div class="col-6">
                                            <i class="fa fa-map"></i>
                                            <span class="list">Daily Places</span>
                                        </div>
                                    </div>
                                    <p>Limited Price: $<?php echo $city->price; ?></p>
                                    <div class="main-button">
                                        <a href="reservation.php?id=<?php echo $city->id ?>">Make a Reservation</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>


<?php require "includes/footer.php"; ?>