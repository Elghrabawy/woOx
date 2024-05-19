<?php require "includes/header.php"; ?>
<?php require "config/connect.php"; ?>

<div class="container ">
    <!-- Replace "test" with your own sandbox Business account app client ID -->
    <script src="https://www.paypal.com/sdk/js?client-id=AU_NG2eBB4E6TZvYd7HhLvWGPJZLsINc9ph6DyGjauE5oPtJ-2MfSZu7YpQoxvm6nKBsggcFVteinlFY&currency=USD"></script>
    <div class="row justify-content-center">
        <!-- Set up a container element for the button -->
        <div class = "col-7" style = "margin-top: 100px; text-align: center;" id="paypal-button-container"></div>

    </div>
    <script>
        paypal.Buttons({
            // Sets up the transaction when a payment button is clicked
            createOrder: (data, actions) => {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '<?php echo $_SESSION['payment'] ?>' // Can also reference a variable or function
                        }
                    }]
                });
            },
            // Finalize the transaction after payer approval
            onApprove: (data, actions) => {
                return actions.order.capture().then(function(orderData) {

                    window.location.href = 'index.php';
                });
            }
        }).render('#paypal-button-container');
    </script>

</div>
</div>
</div>

<?php require "includes/footer.php"; ?>