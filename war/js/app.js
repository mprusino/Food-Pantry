'use strict';

var app = angular.module('food-pantry', ['ui.bootstrap']).config(
		[ '$routeProvider', function($routeProvider) {
			$routeProvider
			/*.when('/registration', {
				templateUrl : 'partials/registration.jsp',
				controller : RegistrationCtrl,
				title : "New Guest Registration",
				linkUrl : "/registration"
			})*/
			.when('/order', {
				templateUrl : 'partials/order.jsp',
				controller : OrderCtrl,
				title : "Guests",
				linkUrl : "/order"
			})
			.when('/reporting', {
				templateUrl : 'partials/reporting.jsp',
				controller : ReportingCtrl,
				title : "Reporting",
				linkUrl : "/reporting"
			})
			.when('/admin', {
				templateUrl : 'partials/admin.jsp',
				controller : AdminCtrl,
				title : "Admin",
				linkUrl : "/admin"
			})
			.when('/volunteer', {
				templateUrl : 'partials/volunteer.jsp',
				controller : VolunteerCtrl
			})
			/*.when('/schedule', {
				templateUrl : 'partials/schedule.jsp',
				controller : ScheduleCtrl,
				title : "Schedule",
				linkUrl : "/schedule"
			})*/
			/*.when('/documents', {
				templateUrl : 'partials/documents.jsp',
				controller : DocumentsCtrl,
				title: "Documents",
				linkUrl : "/documents"
			})*/
			.when('/landing', {
				templateUrl : 'partials/landing.jsp',
				controller : LandingCtrl
			})
			.otherwise({
				redirectTo : '/landing'
			});
		} ]);

// Copied from Angular's custom validation example, the following directive can be added
// to an element to make sure the value is an integer.
// Ex: <input type="number" name="seniors" ng-model="guest.seniors" placeholder="Seniors" value="0" required integer/>
var INTEGER_REGEXP = /^\-?\d*$/;
app.directive('integer', function() {
	return {
		require : 'ngModel',
		link : function(scope, elm, attrs, ctrl) {
			ctrl.$parsers.unshift(function(viewValue) {
				if (INTEGER_REGEXP.test(viewValue)) {
					// it is valid
					ctrl.$setValidity('integer', true);
					return viewValue;
				} else {
					// it is invalid, return undefined (no model update)
					ctrl.$setValidity('integer', false);
					return undefined;
				}
			});
		}
	};
});

function ifnull(obj1, obj2) {
	return obj1 == null ? obj2 : obj1;
}

function toTitleCase(str)
{
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}