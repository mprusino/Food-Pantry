<div
    class="container"
    id="orderContainer">
    <div class="input-append">
        <input
            id="guestSearch"
            placeholder="Search for a guest by last name..."
            class="input-xlarge"
            ng-model="query"
            type="text" />
        <button
            class="btn"
            type="button"
            ng-click="guestSearch()">
            Search <i class="icon-search"></i>
        </button>
        <button
            type="button"
            class="btn btn-primary"
            data-toggle="modal"
            data-backdrop="static"
            data-target="#newGuestModal">
            New Guest <i class="icon-user icon-white"></i>
        </button>
    </div>
</div>

<%--New & Edit Guest Modal Dialog Windows --%>
<jsp:include page="../partials/newGuest.jsp" />
<jsp:include page="../partials/editGuest.jsp" />

<div
    class="row-fluid"
    ng-init="loadedGuest = 0">
    <div class="span3">
        <ul
            id="guestSearchResults"
            class="nav nav-pills nav-stacked">
            <li
                ng-repeat="guest in guestsFromSearch"
                id="guestFromSearch{{guest.id}}"><a
                href="#"
                ng-click="loadGuest({{guest}})">{{guest.firstName}} {{guest.lastName}} <i class="icon-chevron-right icon-white"></i></a></li>
        </ul>
    </div>
    <div
        class="span9"
        ng-show="loadedGuest">
        <div class="row-fluid">
            <h4>Guest Information</h4>
        </div>
        <div class="row-fluid">
            <article class="span6">
                <h6>
                    <i class="icon-home"></i> Address
                </h6>
                <address>
                    <strong>{{loadedGuest.firstName}} {{loadedGuest.lastName}}</strong><br>
                    {{loadedGuest.address}} <br>
                    <span ng-repeat="z in zipCodes | filter:loadedGuest.zipCode">
                        {{z.city}}, {{z.state}} {{z.zipCode}}
                    </span>
                </address>
            </article>
            <div class="span6">
                <h6>
                    <i class="icon-user"></i> Family
                </h6>
                {{loadedGuest.adults}} Adults <br> {{loadedGuest.children}} Children <br>
                {{loadedGuest.seniors}} Seniors
            </div>
        </div>
        <div class="row-fluid">
            <button
                type="button"
                class="btn btn-small"
                data-toggle="modal"
                data-backdrop="static"
                data-target="#editGuestModal"
                ng-click="editGuestClicked();">
                <i class="icon-user"></i> Edit Guest Info
            </button>
        </div>
        <div class="row-fluid">
            <h4 class="spacer">Order History</h4>
        </div>
        <div class="row-fluid">
            <div class="span6">
                <h6>
                    <i class="icon-shopping-cart"></i> Food Order History
                </h6>
                <ul class="unstyled">
                    <li ng-repeat="order in loadedGuestFoodOrders | limitTo:3">{{order.orderDateAsString}}</li>
                    <li ng-hide="loadedGuestFoodOrders">(No history)</li>
                </ul>
            </div>
            <div class="span6">
                <h6>
                    <i class="icon-gift"></i> Clothing Order History
                </h6>
                <ul class="unstyled">
                    <li ng-repeat="order in loadedGuestClothingOrders | limitTo:3">{{order.orderDateAsString}}</li>
                    <li ng-hide="loadedGuestClothingOrders">(No history)</li>
                </ul>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span6">
                <button
                    type="button"
                    class="btn btn-small"
                    ng-click="createFoodOrder()"
                    ng-show="allowFoodOrder">
                    <i class="icon-shopping-cart"></i> Create Today's Food Order
                </button>
            </div>
            <div class="span6">
                <button
                    type="button"
                    class="btn btn-small"
                    ng-click="createClothingOrder()"
                    ng-show="allowClothingOrder">
                    <i class="icon-gift"></i> Create Today's Clothing Order
                </button>
            </div>
        </div>
    </div>
</div>
