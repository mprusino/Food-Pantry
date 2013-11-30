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

<div
    id="guestModal"
    class="modal hide fade"
    tabindex="-1"
    role="dialog"
    aria-labelledby="guestModalLabel"
    aria-hidden="true">
    <div class="modal-header">
        <button
            type="button"
            class="close"
            data-dismiss="modal"
            aria-hidden="true">&times;</button>
        <h3 id="myModalLabel">New Guest</h3>
    </div>
    <div class="modal-body">
        <div class="input-prepend">
            <label
                for="firstName"
                class="add-on em5">First Name</label>
            <input
                type="text"
                class="input-medium"
                name="firstName"
                ng-model="guest.firstName" />
        </div>
        <div class="input-prepend">
            <label
                for="lastName"
                class="add-on em5">Last Name</label>
            <input
                type="text"
                class="input-medium"
                name="lastName"
                ng-model="guest.lastName" />
        </div>
        <div class="input-prepend">
            <label
                for="address"
                class="add-on em5">Address</label>
            <input
                type="text"
                class="input-medium"
                name="address"
                ng-model="guest.address" />
        </div>
        <div class="input-prepend">
            <label
                for="zipCode"
                class="add-on em5">Zip Code</label>
            <select
                class="px150"
                id="zipCode"
                name="zipCode"
                ng-model="guest.zipCode">
            </select>
        </div>
        <div>
            <div class="input-prepend">
                <label
                    for="adults"
                    class="add-on"
                    style="width: 5em;">Adults</label>
                <input
                    type="number"
                    integer
                    min="1"
                    max="20"
                    name="adults"
                    ng-model="guest.adults"
                    class="input-mini" />
            </div>
            <div class="input-prepend">
                <label
                    for="seniors"
                    class="add-on"
                    style="width: 5em;">Seniors</label>
                <input
                    type="number"
                    integer
                    min="0"
                    max="20"
                    name="seniors"
                    ng-model="guest.seniors"
                    class="input-mini" />
            </div>
            <div class="input-prepend">
                <label
                    for="children"
                    class="add-on"
                    style="width: 5em;">Children</label>
                <input
                    type="number"
                    integer
                    min="0"
                    max="20"
                    name="children"
                    ng-model="guest.children"
                    class="input-mini" />
            </div>
        </div>
        <div
            class="btn-group text-center"
            data-toggle="buttons-radio">
            <button class="btn">Asian</button>
            <button class="btn">Black</button>
            <button class="btn">Latino</button>
            <button class="btn">White</button>
            <button class="btn">Other</button>
        </div>
    </div>
    <div class="modal-footer">
        <div
            class="progress span5"
            style="margin-top: 2px;">
            <div
                class="bar"
                style="width: 60%;"></div>
        </div>
        <button class="btn btn-primary">
            Save <i class="icon-chevron-right icon-white"></i>
        </button>
    </div>
</div>
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
<div
    id="clothingModal"
    class="modal hide fade"
    tabindex="-1"
    role="dialog"
    aria-labelledby="clothingModalLabel"
    aria-hidden="true">
    <div class="modal-header">
        <button
            type="button"
            class="close"
            data-dismiss="modal"
            aria-hidden="true">&times;</button>
        <h3 id="myModalLabel">New Clothing Order</h3>
    </div>
    <div class="modal-body">
        <input
            type="text"
            name="orderDate"
            id="orderDate"
            class="datepicker input-small"
            value="11/30/2013" />
    </div>
    <div class="modal-footer">
        <button class="btn btn-primary">
            Save <i class="icon-chevron-right icon-white"></i>
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

<!--
<div class="container-fluid pad-top">
    <div class="row-fluid">
        <div class="span3">
            <div class="well">
                <form class="form-search">
                    <input ng-model="search.fullName" placeholder="Search by name">
                    <div class="spacer"></div>
                    <input ng-model="search.entireAddress" placeholder="Search by address">
                    <div class="spacer"></div>
                    <ul id="guest-panel" class="nav nav-list">
                        <li ng-repeat="guest in guests | filter:search">
                            <a href="" ng-click="loadGuest(guest.id)">
                                {{guest.fullName}}<br/>
                                {{guest.address}}<br/>
                                {{guest.zipCode}}
                            </a>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
        <div class="span5 pad-left" ng-show="guestSelected">
            <div class="row">
                <form>
                    <fieldset>
                        <legend>Guest</legend>
                        <div class="offset1 span11">
                            {{guest.firstName}} {{guest.lastName}}
                            <p>{{guest.ethnicity}}
                            <p>{{guest.address}}
                            <p>{{guest.zipCode}}
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="row">
                <form class="form-inline" id="orderForm">
                    <fieldset>
                        <legend>New Order</legend>
                        <input type="hidden" name="guestId" value="{{guest.id}}"/>
                        <div class="btn-group" data-toggle="buttons-checkbox">
                            <button type="button" class="btn" id="forFood">Food</button>
                            <button type="button" class="btn" id="forClothing">Clothing</button>
                        </div>
                        <input type="text" name="orderDate" id="orderDate" class="datepicker input-small" placeholder="Order Date"/>
                        <button class="btn" ng-click="postOrder()">
                            Submit <i class="icon-chevron-right"></i>
                        </button>
                    </fieldset>
                </form>
            </div>
            <div class="row">
                <fieldset>
                    <legend>Past Orders</legend>
                </fieldset>
            </div>
        </div>
    </div>
</div>

 -->

<script type="text/javascript">
	$(document).ready(function() {
		$('.datepicker').datepicker({
			daysOfWeekDisabled : "0,1,3,4,5"
		});
	});
</script>