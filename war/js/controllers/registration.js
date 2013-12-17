'use strict';

function RegistrationCtrl($scope, $http) {
	
	$http.get('/zipCode').success(function(data) {
		angular.forEach(data, function(value, key) {
			$("#zipCode").append("<option value='" + value.zipCode + "'>"
				+ value.city + ", " + value.state + " " + value.zipCode
				+ "</option>");
		});
		//$('#zipCode').combobox();
	});
	$scope.postForm = function() {
		var guest = {};
		$($("form").serializeArray()).each(function(indexInArray, valueOfElement) {
			guest[valueOfElement.name] = valueOfElement.value;
		});
		$http.post('/guest', guest);
	}
	
	$scope.resetForm = function() {
		$scope.guest = {};
		$scope.guest.firstName = "";
		$scope.guest.lastName = "";
		$scope.guest.ethnicity = "";
		$scope.guest.address = "";
		$scope.guest.zipCode = "";
		$scope.guest.adults = "";
		$scope.guest.seniors = "";
		$scope.guest.children = "";
	}
	
	$scope.resetForm();
}