<?php
// Include the database configuration file from the config folder
include 'config/database.php';
// Prepare the SQL query to fetch products
$sql = "SELECT * FROM products";
$result = $conn->query($sql);
$products = array();
// Check if there are any results
if ($result->num_rows > 0) {
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        array_push($products, $row);
    }
} else {
    echo "0 results";
}
$conn->close();

// Include the header template
include 'template/header.php';
?>

<div class="container mt-2">
  <div class="row">
    <?php foreach ($products as $product): ?>
    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 mt-3">
      <div class="card h-100">
        <img width=250 height=250
          src="<?php echo htmlspecialchars($product['image_url']); ?>"
          alt="<?php echo htmlspecialchars($product['name']); ?>"
          class="image-fluid"
          data-bs-toggle="modal"
          data-bs-target="#imageModal"
          onclick="showImageinModal(this.src)"
        />
        <div class="card-body">
          <h5 class="card-title"><?php echo htmlspecialchars($product['name']); ?></h5>
          <p class="card-text">
            <b>Price:</b> <?php echo htmlspecialchars($product['price_per_unit']); ?> | 
            <b>Unit:</b> <?php echo htmlspecialchars($product['unit']); ?>
          </p>
          <button

            type="button"
            class="btn btn-primary order-item"
            data-bs-toggle="modal"
            data-bs-target="#orderModal"
            data-id="<?php echo htmlspecialchars($product['product_id']); ?>"
            data-name="<?php echo htmlspecialchars($product['name']); ?>"
            data-price="<?php echo htmlspecialchars($product['price_per_unit']); ?>"
            data-unit="<?php echo htmlspecialchars($product['unit']); ?>"
            data-image="<?php echo htmlspecialchars($product['image_url']); ?>"
            onclick="setupModal(this)"
            >
            Order Now
          </button>
         
        </div>
      </div>
    </div>
    <?php endforeach; ?>
  </div>
  <!-- Modals should be here -->
  <?php include 'modals/order_modal.php' ;?>
  <?php include 'modals/image_modal.php' ;?>
  <div class="text-end mt-4">
    
  </div>
</div>
<?php
// Include the footer template
include 'template/footer.php';
?>
