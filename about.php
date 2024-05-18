<?php require "includes/header.php"; ?>
<?php require "config/connect.php"; ?>


<?php
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $country = $conn->query("SELECT * FROM countries WHERE id = '$id'");
    $country->execute();

    $thisCountry = $country->fetch(PDO::FETCH_OBJ);


    // $cities = $conn->query("SELECT * FROM cities WHERE country_id = '$id'");
    $cities = $conn->query(
        "SELECT cities.id AS id, cities.name as name, cities.image as image, 
        cities.offer_image as offer_image, cities.country_id as country_id, 
        cities.trip_days as trip_days, cities.price as price, count(booking.city_id) as count_bookings 
        from cities left join booking on cities.id = booking.city_id where cities.country_id = '$thisCountry->id' 
        GROUP by cities.id;"
    );
    $cities->execute();
    $allCities = $cities->fetchAll(PDO::FETCH_OBJ);

    $countCities = $conn->query(
        "SELECT COUNT(country_id) as num_cities FROM cities
        WHERE country_id = '$thisCountry->id'"
    );
    $countCities->execute();
    $num_cities = $countCities->fetch(PDO::FETCH_OBJ);

    $countBookings = $conn->query(
        "SELECT COUNT(*) AS num_bookings FROM cities 
        RIGHT JOIN booking ON cities.id = booking.city_id 
        WHERE cities.country_id = '$thisCountry->id' AND TIMESTAMPDIFF(YEAR, booking.checkin_date, now()) < 1"
    );
    $countBookings->execute();
    $num_bookings = $countBookings->fetch(PDO::FETCH_OBJ);
}
else{
    header("location: " . APPURL . "");
}
?>

<!-- ***** Main Banner Area Start ***** -->
<div class="about-main-content">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="content">
                    <div class="blur-bg"></div>
                    <h4>EXPLORE OUR COUNTRY</h4>
                    <div class="line-dec"></div>
                    <h2>Welcome To <?php echo $thisCountry->name ?></h2>
                    <p><?php echo $thisCountry->description ?></p>
                    <div class="main-button">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ***** Main Banner Area End ***** -->

<div class="cities-town">
    <div class="container">
        <div class="row">
            <div class="slider-content">
                <div class="row">
                    <div class="col-lg-12">
                        <h2><?php echo $thisCountry->name ?>’s <em>Cities &amp; Towns</em></h2>
                    </div>
                    <div class="col-lg-12">
                        <div class="owl-cites-town owl-carousel">
                            <?php foreach ($allCities as $city) : ?>
                                <div class="item">
                                    <div class="thumb">
                                        <img src="assets/images/<?php echo $city->image ?>" alt="">
                                        <h4><?php echo $city->name ?></h4>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="weekly-offers">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="section-heading text-center">
                    <h2>Best Weekly Offers In Each City</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="owl-weekly-offers owl-carousel">
                    <?php foreach ($allCities as $city) : ?>
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/images/<?php echo $city->offer_image ?>" alt="">
                                <div class="text">
                                    <h4><?php echo $city->name ?><br><span><i class="fa fa-users"></i> <?php echo $city->count_bookings ?> Check Ins</span></h4>
                                    <h6>$<?php echo $city->price ?><br><span>/person</span></h6>
                                    <div class="line-dec"></div>
                                    <ul>
                                        <li>Deal Includes:</li>
                                        <li><i class="fa fa-taxi"></i> <?php echo $city->trip_days ?> Days Trip > Hotel Included</li>
                                        <li><i class="fa fa-plane"></i> Airplane Bill Included</li>
                                        <li><i class="fa fa-building"></i> Daily Places Visit</li>
                                    </ul>
                                    <div class="main-button">
                                        <a href="reservation.php?id=<?php echo $city->id ?>">Make a Reservation</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>


            </div>
        </div>
    </div>
</div>

<div class="more-about">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 align-self-center">
                <div class="left-image">
                    <img src="assets/images/about-left-image.jpg" alt="">
                </div>
            </div>
            <div class="col-lg-6">
                <div class="section-heading">
                    <h2>Discover More About Our Country</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                </div>
                <div class="row">

                    <div class="col-lg-12">
                        <div class="info-item">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h4><?php echo $num_cities->num_cities ?>+</h4>
                                    <span>Amazing Places</span>
                                </div>
                                <div class="col-lg-6">
                                    <h4><?php echo $num_bookings->num_bookings ?>+</h4>
                                    <span>Different Check-ins Yearly</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>

            </div>
        </div>
    </div>
</div>


<?php require "includes/footer.php"; ?>