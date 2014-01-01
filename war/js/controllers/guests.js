'use strict';

function GuestsCtrl($scope, $route, $routeParams, $location, $http) {
	$scope.query = "";
	
	$scope.guestSearch = function() {
		//alert('search clicked!');
		$http.get('/guest').success(function(data) {
			//console.log(data);
			$scope.guestsFromSearch = data;
		});
	}
	
	$scope.loadGuest = function(guest) {
		$scope.loadedGuest = guest;
	};
}

function NewGuestCtrl($scope, $route, $routeParams, $location, $http) {
	$scope.guest = dummy();
	
	$scope.saveNewGuest = function() {
		//alert('save clicked!');
		//console.debug($scope.guest);
		
		$http.post('/guest', $scope.guest).success(function(data, status, headers, config) {
			//console.log(status);
			if (status == 200) { // success
				data = data.trim();
				$scope.guest.id = data;
				
				// hide the dialog
				$("#newGuestModal").modal('hide');
				
				// copy over each field
				// too bad this doesn't work: $scope.loadedGuest = $scope.guest
				angular.forEach($scope.guest, function(value, key) {
					$scope.loadedGuest[key] = value;
				});
				
				if ($scope.guestsFromSearch != null) {
					// clear out the list of searched guests
					// too bad this doesn't work: $scope.guestsFromSearch = []
					for (var i = $scope.guestsFromSearch.length; i--; i > 0) {
						$scope.guestsFromSearch.pop();
					}
					
					// append the saved guest to the list of searched guests
					$scope.guestsFromSearch.push($scope.guest);
				}
			}
		});
	}
	
	$http.get('/zipCode').success(function(data) {
		angular.forEach(data, function(value, key) {
			$("#newGuestZipCode").append("<option value='" + value.zipCode + "'>"
				+ value.city + ", " + value.state + " " + value.zipCode
				+ "</option>");
		});
	});
}

function EditGuestCtrl($scope, $route, $routeParams, $location) {
	
}

function emptyGuest() {
	var guest = {};
	guest.firstName = "";
	guest.lastName = "";
	guest.address = "";
	guest.zipCode = "";
	guest.phone = "";
	guest.adults = 0;
	guest.seniors = 0;
	guest.children = 0;
	guest.ethnicity = "";
	guest.lang = "";
	return guest;
}

function dummy() {
	var guest = {};
	guest.firstName = "John";
	guest.lastName = "Smith";
	guest.address = "25-66 42nd St";
	guest.zipCode = "";
	guest.phone = "212-555-1234";
	guest.adults = 1;
	guest.seniors = 0;
	guest.children = 0;
	guest.ethnicity = "W";
	guest.lang = "E";
	return guest;
}