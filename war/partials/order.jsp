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

<script type="text/javascript">
	$(document).ready(function() {
		$('.datepicker').datepicker({
			daysOfWeekDisabled : "0,1,3,4,5"
		});
	});
</script>