<!doctype html>
<html lang="en" ng-app>
<head>
    <meta charset="utf-8" />
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/smoothness/jquery-ui-1.10.3.custom.min.css" rel="stylesheet"/>
    <script src="js/jquery-2.0.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/angular.min.js"></script>
    <script src="js/registration.js"></script>
    <title>Guest Information</title>
</head>
<body ng-controller="RegistrationCtrl">
<div class="container span9">
<h2>Guest Information</h2>
<div class="form-horizontal" ng-form="registrationForm">
    <fieldset>
        <h4 >Personal Information</h4>
        <hr>
        <div class="control-group">
            <label class="control-label" for="firstname">First Name</label>
            <div class="controls">
                <input placeholder="First Name"
                    type="text"
                    ng-model="firstname" 
                    required/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="lastname">Last Name</label>
            <div class="controls">
                <input type="text" id="lastname" name="lastname" placeholder="Last Name" />
            </div>
        </div>
        <div class="control-group" id="ethnicity">
            <label class="control-label">Ethnicity</label>
            <div class="controls">
                <div class="btn-group" data-toggle="buttons-radio">
	                <button type="button" class="btn">Asian</button>
					<button type="button" class="btn">Black</button>
					<button type="button" class="btn">Latino</button>
					<button type="button" class="btn">White</button>
					<button type="button" class="btn">Other</button>
				</div>
            </div>
        </div>
        <h4>Address</h4>
        <hr>
        <div class="control-group">
            <!-- Should control ZIP Code -->
            <label class="control-label" for="city">City</label>
            <div class="controls">
                <input type="text" id="city" name="city" placeholder="City"/>
            </div>
        </div>
        <div class="control-group" id="state">
            <label class="control-label">State</label>
            <div class="controls">
                <div class="btn-group" data-toggle="buttons-radio">
                    <button type="button" class="btn active">New York</button>
                    <button type="button" class="btn">New Jersey</button>
                    <button type="button" class="btn">Connecticut</button>
                    <button type="button" class="btn">Other</button>
                </div>
            </div>
        </div>
        <div class="control-group">
            <!-- Should control City -->
            <label class="control-label" for="zip">ZIP Code</label>
            <div class="controls">
                <input type="text" id="zip" name="zip" placeholder="ZIP Code"/>
            </div>
        </div>
        <div>
        <h4>Family Information</h4>
        <hr>
        </div>
        <div class="control-group {{childrenError}}">
            <label class="control-label" for="children">Children (age 0-18)</label>
            <div class="controls">
                <input
                    placeholder="Children (age 0-18)"
                    type="number"
                    name="children"
                    ng-model="children"
                    min="0"
                    max="20"
                    required
                    class="text-right" />
                <span class="help-inline">
                    <span ng-show="registrationForm.children.$error.number">Please enter a number.</span>
                    <span ng-show="registrationForm.children.$error.min">Minimum is 0.</span>
                    <span ng-show="registrationForm.children.$error.max">Maximum is 20.</span>
                </span>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="adults">Adults (age 18-65)</label>
            <div class="controls">
                <input
                    placeholder="Adults (age 18-65)"
                    class="text-right"
                    type="number" 
                    name="adults"
                    ng-model="adults"
                    min="0"
                    max="20"
                    required/>
                <span class="help-inline">{{adultsHelpInline}}</span>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="seniors">Seniors (age 65+)</label>
            <div class="controls">
                <input
                    placeholder="Seniors (age 65+)"
                    class="text-right"
                    type="number"
                    name="seniors"
                    ng-model="seniors"
                    min="0"
                    max="20"
                    required/>
                <span class="help-inline">{{seniorsHelpInline}}</span>
            </div>
        </div>
        <div class="control-group">
            <!-- Should be the sum Children Adults and Seniors -->
            <label class="control-label" for="total">Total</label>
            <div class="controls">
                <input
                    class="text-right"
                    type="number"
                    name="total"
                    ng-model="totalInFamily"
                    disabled="disabled"/>
            </div>
        </div>
    </fieldset>
    <div class="form-actions">
	    <a class="btn btn-large" href="#">Cancel <i class="icon-ban-circle"></i></a>
	    <a class="btn btn-large btn-primary" href="#">Submit <i class="icon-chevron-right icon-white"></i></a>
        <tt>{{registrationForm.$valid}}</tt><br/>
        <tt>{{registrationForm.$error}}</tt><br/>
    </div>
</div>
</div>
</body>
</html>