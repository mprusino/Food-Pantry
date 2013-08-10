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
    <title>New Guest Registration</title>
</head>
<body ng-controller="RegistrationCtrl">
<div class="container span9">
<div class="navbar">
    <div class="navbar-inner">
    <a class="brand" href="#">Food Pantry</a>
    <ul class="nav">
        <li class="active"><a href="#">New Guest Registration</a></li>
        <li><a href="#">New Order</a></li>
        <li><a href="#">Reports</a></li>
    </ul>
    </div>
</div>
<form name="registrationForm" id="registrationForm" class="form-horizontal" action="/services/guest">
    <fieldset>
        <h4 >Personal Information</h4>
        <hr>
        <div class="control-group">
            <label class="control-label" for="firstname">First Name</label>
            <div class="controls">
                <input
                    placeholder="First Name"
                    name="firstName"
                    type="text"
                    ng-model="firstName"
                    required/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="lastname">Last Name</label>
            <div class="controls">
                <input
                    placeholder="Last Name"
                    name="lastName"
                    type="text"
                    ng-model="lastName"
                    required/>
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
            <%-- Should control City & State --%>
            <label class="control-label" for="zip">ZIP Code</label>
            <div class="controls">
                <input
                    placeholder="ZIP Code"
                    name="zip"
                    id="zip"
                    type="text" />
                <span class="help-inline">
                    <span>Ahh... {{neighborhood}}</span>
                </span>
            </div>
        </div>
        <div>
        <h4>Family Information</h4>
        <hr>
        </div>
        <div class="control-group {{childrenError}}">
            <label class="control-label" for="children">Number of Children<br/>(age 0-18)</label>
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
        <div class="control-group {{adultsError}}">
            <label class="control-label" for="adults">Number of Adults<br/>(age 18-65)</label>
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
                <span class="help-inline">
                    <span ng-show="registrationForm.adults.$error.number">Please enter a number.</span>
                    <span ng-show="registrationForm.adults.$error.min">Minimum is 0.</span>
                    <span ng-show="registrationForm.adults.$error.max">Maximum is 20.</span>
                </span>
            </div>
        </div>
        <div class="control-group {{seniorsError}}">
            <label class="control-label" for="seniors">Number of Seniors<br/>(age 65+)</label>
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
                <span class="help-inline">
                    <span ng-show="registrationForm.seniors.$error.number">Please enter a number.</span>
                    <span ng-show="registrationForm.seniors.$error.min">Minimum is 0.</span>
                    <span ng-show="registrationForm.seniors.$error.max">Maximum is 20.</span>
                </span>
            </div>
        </div>
        <div class="control-group">
            <!-- Should be the sum Children Adults and Seniors -->
            <label class="control-label" for="total">Total Family Members</label>
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
	    <a class="btn btn-large" href="#" id="cancel">Cancel <i class="icon-ban-circle"></i></a>
	    <a class="btn btn-large btn-primary" href="#" id="submit">Submit <i class="icon-chevron-right icon-white"></i></a>
        <tt>{{registrationForm.$valid}}</tt><br/>
        <tt>{{registrationForm.$error}}</tt><br/>
    </div>
</form>
</div>
</body>
</html>