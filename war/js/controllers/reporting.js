'use strict';

function ReportingCtrl($scope, $http) {
	$scope.runReport = function() {
		//alert('run report clicked!');
		$http.get('/report?year=' + $scope.year).success(function(data) {
			console.log(data);
			$scope.reportYear = $scope.year;
			$scope.reportData = data;
		});
	}
	
	$scope.year = new Date().getFullYear();
	$scope.runReport();
}