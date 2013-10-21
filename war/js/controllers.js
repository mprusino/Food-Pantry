'use strict';

function OrderCtrl($scope, $http) {
	$http.get('/zipCode').success(function(data) {
		$scope.zipCodes = data;
	});
	$http.get('/guest').success(function(data) {
		$scope.guests = data;
		angular.forEach($scope.guests, function(value, key) {
			value.fullName = (
				ifnull(value.firstName, '')
				+ " "
				+ ifnull(value.lastName, '')
			).trim();
			value.entireAddress = (
				ifnull(value.address, '')
				+ " "
				+ ifnull(value.zipCode, '')
			).trim();
		});
	});
	$scope.guestSelected = false;
	$scope.loadGuest = function(guestId) {
		$http.get('/guest?guestId=' + guestId).success(function (data) {
			$scope.guest = data;
			$scope.guestSelected = true;
		});
	}
	$scope.postOrder = function() {
		var order = {};
		$($("#orderForm").serializeArray()).each(function(indexInArray, valueOfElement) {
			order[valueOfElement.name] = valueOfElement.value;
		});
		order['forFood'] = $('#forFood').hasClass('active');
		order['forClothing'] = $('#forClothing').hasClass('active');
		$http.post('/order', order);
	}
}

function AdminCtrl($scope, $route, $routeParams, $location) {
	$scope.location = $location;
}

function RegistrationCtrl($scope, $http) {
	$http.get('/zipCode').success(function(data) {
		angular.forEach(data, function(value, key) {
			$("#zipCode").append("<option value='" + value.zipCode + "'>"
				+ value.city + ", " + value.state + " " + value.zipCode
				+ "</option>");
		});
		$('#zipCode').combobox();
	});
	$scope.postForm = function() {
		var guest = {};
		$($("form").serializeArray()).each(function(indexInArray, valueOfElement) {
			guest[valueOfElement.name] = valueOfElement.value;
		});
		$http.post('/guest', guest);
	}
}

function ReportingCtrl($scope) {
	
}

function VolunteerCtrl($scope, $http) {
	$scope.postForm = function() {
		var volunteer = {};
		$($("form").serializeArray()).each(function(indexInArray, valueOfElement) {
			volunteer[valueOfElement.name] = valueOfElement.value;
		});
		$http.post('/volunteer', volunteer);
	}
}

function ScheduleCtrl($scope) {
	
}

function DocumentsCtrl($scope) {
	
}

function NavbarCtrl($scope, $route, $location) {
	$scope.routes = $route.routes;
	
	$scope.setActiveTab = function() {
		var navbarLinks = [];
		angular.forEach($scope.routes, function(route) {
			if (route.title != null && route.linkUrl != null) {
				if (route.linkUrl == $location.path()) {
					route.active = "active";
				} else {
					route.active = "";
				}
				navbarLinks.push(route);
			}
		});
		$scope.navbarLinks = navbarLinks;
	}
	
	$scope.setActiveTab();
	$scope.$on('$routeChangeStart', function(next, current) { 
		$scope.setActiveTab();
	});
}
