function RegistrationCtrl($scope) {
	$scope.children = 0;
	$scope.adults = 0;
	$scope.seniors = 0;
	$scope.totalInFamily = 1;
	$scope.max = 20;
	
	angular.forEach(["children", "adults", "seniors"], function(field) {
		$scope.$watch(field, function() {
			$scope.totalInFamily =
				1 + $scope.children + $scope.adults + $scope.seniors;
		});
	});
	
	$scope.$watch("registrationForm.children.$valid", function(isNowValid) {
		$scope.childrenError = isNowValid ? "" : "error";
	});
	$scope.$watch("registrationForm.adults.$valid", function(isNowValid) {
		$scope.adultsError = isNowValid ? "" : "error";
	});
	$scope.$watch("registrationForm.seniors.$valid", function(isNowValid) {
		$scope.seniorsError = isNowValid ? "" : "error";
	});
}