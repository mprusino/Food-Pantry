'use strict';

function VolunteerCtrl($scope, $http) {
	$scope.postForm = function() {
		var volunteer = {};
		$($("form").serializeArray()).each(function(indexInArray, valueOfElement) {
			volunteer[valueOfElement.name] = valueOfElement.value;
		});
		$http.post('/volunteer', volunteer);
	}
}