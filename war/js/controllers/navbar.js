'use strict';

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
	
	$scope.currentDate = new Date().toDateString();
}