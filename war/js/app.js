'use strict';

angular.module('food-pantry', []).config(
		[ '$routeProvider', function($routeProvider) {
			$routeProvider.when('/registration', {
				templateUrl : 'partials/registration.jsp',
				controller : RegistrationCtrl,
				title : "New Guest Registration",
				linkUrl : "/registration"
			}).when('/order', {
				templateUrl : 'partials/order.jsp',
				controller : OrderCtrl,
				title : "Order Entry",
				linkUrl : "/order"
			}).when('/reporting', {
				templateUrl : 'partials/reporting.jsp',
				controller : ReportingCtrl,
				title : "Reporting",
				linkUrl : "/reporting"
			}).when('/admin', {
				templateUrl : 'partials/admin.jsp',
				controller : AdminCtrl,
				title : "Admin",
				linkUrl : "/admin"
			}).when('/volunteer', {
				templateUrl : 'partials/volunteer.jsp',
				controller : VolunteerCtrl,
				title : "New Volunteer",
				linkUrl : "/volunteer"
			}).when('/schedule', {
				templateUrl : 'partials/schedule.jsp',
				controller : ScheduleCtrl,
				title : "Schedule",
				linkUrl : "/schedule"
			}).when('/documents', {
				templateUrl : 'partials/documents.jsp',
				controller : DocumentsCtrl,
				title: "Documents",
				linkUrl : "/documents"
			}).otherwise({
				redirectTo : '/order'
			});
		} ]);

function ifnull(obj1, obj2) {
	return obj1 == null ? obj2 : obj1;
}