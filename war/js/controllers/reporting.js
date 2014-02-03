'use strict';

function ReportingCtrl($scope, $http) {
	$scope.runReport = function() {
		$http.get('/report?year=' + $scope.year).success(function(data) {
			//console.log(data);
			$scope.reportYear = $scope.year;
			$scope.reportData = data;
			$scope.total = {};
			$scope.total.totalOrder = 0;
			$scope.total.totalFed = 0;
			$scope.total.children = 0;
			$scope.total.adults = 0;
			$scope.total.seniors = 0;
			for (var i = 0; i < data.length; i++) {
				$scope.total.totalOrder += data[i].totalOrder;
				$scope.total.totalFed += data[i].totalFed;
				$scope.total.children += data[i].children;
				$scope.total.adults += data[i].adults;
				$scope.total.seniors += data[i].seniors;
			}
		});
	}
	
	$scope.year = new Date().getFullYear();
	$scope.runReport();
}