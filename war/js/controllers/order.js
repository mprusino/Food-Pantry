'use strict';

function OrderCtrl($scope, $http) {
//	$http.get('/zipCode').success(function(data) {
//		$scope.zipCodes = data;
//	});
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
	
	$scope.saveNewGuest = function() {
		alert('save clicked!');
		//console.debug($scope.guest);
		//$http.post('/guest', $scope.guest);
	}
}