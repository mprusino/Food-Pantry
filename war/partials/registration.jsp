<div id="myCarousel" class="span4">
    <fieldset ng-form="mainform">
        <legend>New Guest</legend>
        <div class="progress">
            <div class="bar" style="width: 12.5%;"
                ng-show="name.firstName.$valid"></div>
            <div class="bar" style="width: 12.5%;"
                ng-show="name.lastName.$valid"></div>
            <div class="bar" style="width: 12.5%;"
                ng-show="race.ethnicitytext.$valid"></div>
            <div class="bar" style="width: 12.5%;"
                ng-show="address.address.$valid"></div>
            <div class="bar" style="width: 12.5%;"
                ng-show="address.zipCode.$valid"></div>
            <div class="bar" style="width: 12.5%;"
                ng-show="family.adults.$valid"></div>
            <div class="bar" style="width: 12.5%;"
                ng-show="family.seniors.$valid"></div>
            <div class="bar" style="width: 12.5%;"
                ng-show="family.children.$valid"></div>
        </div>
        <div class="carousel-inner">
            <div class="active item span4">
                <fieldset class="newguest-carousel" ng-form="name">
                    <div class="input-prepend">
                        <span class="add-on" style="width: 5em;">First
                            Name</span> <input type="text" class="input-medium"
                            name="firstName" ng-model="guest.firstName"
                            required />
                    </div>
                    <div class="input-prepend">
                        <span class="add-on" style="width: 5em;">Last
                            Name</span> <input type="text" class="input-medium"
                            name="lastName" ng-model="guest.lastName"
                            required />
                    </div>
                </fieldset>
                <div class="well text-right">
                    <button class="btn btn-primary" onclick="next();">
                        Next <i class="icon-chevron-right icon-white"></i>
                    </button>
                </div>
            </div>
            <div class="item span4">
                <fieldset class="newguest-carousel" ng-form="race">
                    <input type="hidden" name="ethnicitytext" required
                        value="{{guest.ethnicity}}"
                        ng-model="guest.ethnicity" /> <label
                        class="radio"> <input type="radio"
                        name="ethnicity" ng-model="guest.ethnicity"
                        value="A">Asian
                    </label> <label class="radio"> <input type="radio"
                        name="ethnicity" ng-model="guest.ethnicity"
                        value="B">Black
                    </label> <label class="radio"> <input type="radio"
                        name="ethnicity" ng-model="guest.ethnicity"
                        value="L">Latino
                    </label> <label class="radio"> <input type="radio"
                        name="ethnicity" ng-model="guest.ethnicity"
                        value="W">White
                    </label> <label class="radio"> <input type="radio"
                        name="ethnicity" ng-model="guest.ethnicity"
                        value="O">Other
                    </label>
                </fieldset>
                <div class="well text-right">
                    <button class="btn btn-primary" onclick="next();">
                        Next <i class="icon-chevron-right icon-white"></i>
                    </button>
                </div>
            </div>
            <div class="item span4">
                <fieldset class="newguest-carousel" ng-form="address">
                    <label for="zipCode" class="label-muted">Address</label>
                    <input type="text" required name="address"
                        ng-model="guest.address" /> <label
                        for="zipCode" class="label-muted">Zip
                        Code</label> <select class="combobox" id="zipCode"
                        name="zipCode" required ng-model="guest.zipCode">
                        <option value="">City, State Zip Code</option>
                    </select>
                </fieldset>
                <div class="well text-right">
                    <button class="btn btn-primary" onclick="next(); initFamily();">
                        Next <i class="icon-chevron-right icon-white"></i>
                    </button>
                </div>
            </div>
            <div class="item span4">
                <fieldset class="newguest-carousel" ng-form="family">
                    <div class="input-prepend">
                        <span class="add-on" style="width: 5em;">Adults</span>
                        <input type="number" required integer min="1"
                            max="20" name="adults"
                            ng-model="guest.adults" class="input-mini" />
                    </div>
                    <div class="input-prepend">
                        <span class="add-on" style="width: 5em;">Seniors</span>
                        <input type="number" required integer min="0"
                            max="20" name="seniors"
                            ng-model="guest.seniors" class="input-mini" />
                    </div>
                    <div class="input-prepend">
                        <span class="add-on" style="width: 5em;">Children</span>
                        <input type="number" required integer min="0"
                            max="20" name="children"
                            ng-model="guest.children" class="input-mini" />
                    </div>
                </fieldset>
                <div class="well text-right">
                    <button class="btn btn-primary"
                        ng-click="postForm()"
                        ng-disabled="form.$invalid">
                        Submit <i class="icon-chevron-right icon-white"></i>
                    </button>
                </div>
            </div>

        </div>
    </fieldset>
</div>

<script>
	function next() {
		$('#myCarousel').carousel('next');
		$('#myCarousel').carousel('pause');
	}
	function initFamily() {
		
		if ($('input[name="adults"]').val() == "") {
		    $('input[name="adults"]').val("1");
		}
	}
</script>
