<div
    id="foodModal"
    class="modal hide fade"
    tabindex="-1"
    role="dialog"
    aria-labelledby="foodModalLabel"
    aria-hidden="true">
    <div class="modal-header">
        <button
            type="button"
            class="close"
            data-dismiss="modal"
            aria-hidden="true">&times;</button>
        <h3 id="myModalLabel">New Food Order</h3>
    </div>
    <div class="modal-body">
        <div class="input-prepend">
            <label
                for="orderDate"
                class="add-on em5">Order Date</label>
            <input
                type="text"
                name="orderDate"
                id="orderDate"
                class="datepicker input-small"
                value="11/30/2013" />
        </div>
    </div>
    <div class="modal-footer">
        <button class="btn btn-primary">
            Save <i class="icon-chevron-right icon-white"></i>
        </button>
    </div>
</div>
