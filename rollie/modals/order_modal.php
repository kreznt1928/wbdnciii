<div
  class="modal fade"
  id="orderModal"
  tabindex="-1"
  aria-labelledby="orderModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="orderModalLabel">Yours Order</h5>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <div class="modal-body">
        <img
          id="productImage"
          src=""
          class="card-img-top product-image"
          alt="Product Image"
        />
        <form id="orderForm" action="modals/submit_order.php" method="post">
          <input type="hidden" id="productId" name="productId" />
          <div class="mb-3">
            <label for="customerName" class="form-label">Customer Name</label>
            <input
              type="text"
              class="form-control"
              id="customerName"
              name="customerName"
            />
          </div>
          <div class="mb-3">
            <label for="productName" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="productName" readonly />
          </div>
          <div class="mb-3">
            <label for="quantity" class="form-label">Quantity</label>
            <input
              type="number"
              class="form-control"
              id="quantity"
              min="1"
              step="1"
              value="1"
              name="quantity"
            />
          </div>
          <div class="mb-3">
            <label for="totalPrice" class="form-label">Total Price</label>
            <input
              type="text"
              class="form-control"
              id="totalPrice"
              name="totalPrice"
              readonly
            />
          </div>
          
          <button type="submit" class="btn btn-primary mt-3">Submit</button>
        </form>
      </div>
    </div>
  </div>
</div>
