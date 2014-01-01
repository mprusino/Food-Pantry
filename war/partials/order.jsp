<!-- data-backdrop="static" prevents the modal from closing when clicking outside the modal -->
<div
    class="container"
    id="orderContainer">
    <div class="input-append">
        <input
            id="guestSearch"
            placeholder="Search for a guest by last name..."
            class="input-xlarge"
            type="text" />
        <button
            class="btn"
            type="button">
            Search <i class="icon-search"></i>
        </button>
        <button
            type="button"
            class="btn btn-primary"
            data-toggle="modal"
            data-backdrop="static"
            data-target="#guestModal">
            New Guest <i class="icon-user icon-white"></i>
        </button>
    </div>
</div>

<div class="row-fluid">
    <div class="span3">
        <ul
            id="guestSearchResults"
            class="nav nav-pills nav-stacked">
            <li class="active"><a href="#"><i class="icon-chevron-right icon-white pull-right"></i>Jeffrey
                    Mezic</a></li>
            <li><a href="#">John Doe </a></li>
            <li><a href="#">Jessie Smith</a></li>
        </ul>
    </div>
    <div class="span9">
        <div class="row-fluid">
            <article class="span6">
                <h6>
                    <i class="icon-home"></i> Address
                </h6>
                <address>
                    <strong>Jeffrey Mezic</strong> (Latino)<br> 25-66 42nd St <br> Astoria, NY 11103
                </address>
            </article>
            <div class="span6">
                <h6>
                    <i class="icon-user"></i> Family
                </h6>
                2 Adults <br> 2 Children <br> 2 Seniors
            </div>
        </div>
        <div class="row-fluid">
            <div class="span6">
                <h6>
                    <i class="icon-briefcase"></i> Food Orders
                </h6>
                <ul class="unstyled">
                    <li>Saturday November 30, 2013</li>
                    <li>Saturday November 23, 2013</li>
                    <li>Saturday November 16, 2013</li>
                </ul>

            </div>
            <div class="span6">
                <h6>
                    <i class="icon-gift"></i> Clothing Orders
                </h6>
                <ul class="unstyled">
                    <li>(No history)</li>
                </ul>
            </div>
        </div>
        <hr />
        <div class="row-fluid">
            <button class="btn btn-small">
                <i class="icon-user"></i> Edit Guest Info
            </button>
            <button
                type="button"
                class="btn btn-small"
                data-toggle="modal"
                data-backdrop="static"
                data-target="#foodModal">
                <i class="icon-briefcase"></i> New Food Order
            </button>
            <button
                type="button"
                class="btn btn-small"
                data-toggle="modal"
                data-backdrop="static"
                data-target="#clothingModal">
                <i class="icon-gift"></i> New Clothing Order
            </button>
        </div>
    </div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('.datepicker').datepicker({
			daysOfWeekDisabled : "0,1,3,4,5"
		});
	});
</script>