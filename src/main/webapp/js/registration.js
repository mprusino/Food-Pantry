$(function() {
	// This function runs when the page is ready.
	$("#submit").click(function() {
		submitForm();
	});
});

function form2Object() {
	return {
			firstName : $("input[name='firstName']").val(),
			lastName : $("input[name='lastName']").val(),
			ethnicity : $("input[name='ethnicity']").val(),
			zipCode : $("input[name='zip']").val(),
			numChildren : $("input[name='children']").val(),
			numAdults : $("input[name='adults']").val(),
			numSeniors : $("input[name='seniors']").val()
	};
}

function submitForm() {
	$.ajax({
		url:'/services/guest',
		data: JSON.stringify(form2Object()),
		contentType: 'application/json',
		type: 'POST'
	}).done(function (data, textstatus, jqXHR) {
		if (jqXHR.status == 201) {
			// 201 status is "Created" and this indicates a success!
			var guestId = data;
			alert("Guest created with ID: " + guestId);
		} else if (jqXHR.status == 200) {
			// 200 status is "Accepted" but really it is an error.
			var errorMessage = data;
			alert("Guest not created: " + errorMessage);
		}
	});
}

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
