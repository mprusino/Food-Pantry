'use strict';

var app = angular.module('food-pantry', ['ui.bootstrap']).config(
		[ '$routeProvider', function($routeProvider) {
			$routeProvider
			.when('/guests', {
				templateUrl : 'templates/guests.jsp',
				controller : GuestsCtrl,
				title : "Guests",
				linkUrl : "/guests"
			})
			.when('/reporting', {
				templateUrl : 'templates/reporting.jsp',
				controller : ReportingCtrl,
				title : "Reporting",
				linkUrl : "/reporting"
			})
			.when('/admin', {
				templateUrl : 'templates/admin.jsp',
				controller : AdminCtrl,
				title : "Admin",
				linkUrl : "/admin"
			})
			.when('/landing', {
				templateUrl : 'templates/landing.jsp',
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

// Prevent the default action when clicking on certain anchor tags.
app.directive('a', function() {
    return {
        restrict: 'E',
        link: function(scope, elem, attrs) {
            if(attrs.ngClick || attrs.href === '' || attrs.href === '#'){
                elem.on('click', function(e){
                    e.preventDefault();
                    if(attrs.ngClick){
                        scope.$eval(attrs.ngClick);
                    }
                });
            }
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