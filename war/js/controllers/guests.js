'use strict';

function GuestsCtrl($scope, $rootScope, $http, $cacheFactory, $timeout) {
	if ($cacheFactory.get('guestIndex') == undefined) {
		// Initialize caches just once.
		$cacheFactory('guestStore');
		$cacheFactory('guestIndex');
		$cacheFactory.get('guestIndex').put("byId", {});
	}
	
	var guestStore = $cacheFactory.get('guestStore');
	var guestIndex = $cacheFactory.get('guestIndex').get("byId");
	
	// Stores an array of guest objects into the guestStore.
	$rootScope.storeGuests = function(guests) {
		angular.forEach(guests, function(guest) {
			$rootScope.storeGuest(guest);
		});
	}
	
	// Stores a single guest object into the guestStore.
	$rootScope.storeGuest = function(guest) {
		var guestIdAsString = "" + guest.id;
		guestStore.put(guestIdAsString, guest);
		guestIndex[guestIdAsString] = true;
	}
	
	// Loads all guests from the guestStore for display in the search results section.
	$rootScope.loadGuests = function() {
		$rootScope.guestsFromSearch = [];
		
		angular.forEach(guestIndex, function (value, key) {
			var guestIdAsString = key;
			var guest = guestStore.get(guestIdAsString);
			$rootScope.guestsFromSearch.push(guest);
		});
	}
	
	// Load a single guest from the guestStore for display in the read only guest information section.
	$rootScope.loadGuest = function(guestId) {
		$("#guestSearchResults li").removeClass("active"); // Remove the active class on all guest search results.
		$("#guestFromSearch" + guestId).addClass("active"); // But add it back for the selected guest.
		
		var guestIdAsString = "" + guestId;
		$rootScope.readOnlyGuest = angular.copy(guestStore.get(guestId));
		$rootScope.reloadFoodOrders();
		$rootScope.reloadClothingOrders();
	};
	
	// Save a new guest.
	$rootScope.saveNewGuest = function() {
		$http.post('/guest', $rootScope.newGuest).success(function(data, status, headers, config) {
			if (status == 200) { // HTTP Status Code of 200 = success.
				$("#newGuestModal").modal('hide'); // Hide the popup dialog box.
				$rootScope.newGuest.id = parseInt(data.trim()); // The new guest now has an id from the server.
				$rootScope.lastModifiedGuestId = $rootScope.newGuest.id;
				$rootScope.storeGuest(angular.copy($rootScope.newGuest)); // Store the guest into the guest store.
				$rootScope.loadGuests(); // Load all guests in the guestStore for display in the search results section.
				$rootScope.loadGuest($rootScope.newGuest.id); // Load the new guest in the read only guest information section.
			}
		});
	};
	
	// Save an existing guest.
	$rootScope.saveEditGuest = function() {
		$http.put('/guest?guestId=' + $rootScope.editGuest.id, $rootScope.editGuest).success(function(data, status, headers, config) {
			if (status == 200) { // HTTP Status Code of 200 = success.
				$("#editGuestModal").modal('hide'); // Hide the popup dialog box.
				$rootScope.lastModifiedGuestId = $rootScope.editGuest.id;
				$rootScope.storeGuest(angular.copy($rootScope.editGuest));
				$rootScope.readOnlyGuest = angular.copy($rootScope.editGuest);
				$("#guestSearchResults li[class~='active'] a").text($rootScope.editGuest.firstName + " " + $rootScope.editGuest.lastName);
			}
		});
	}
	
	// If the user returns to this page and the cache is already populated then load all guests from the guestStore for
	// display in the search results section.
	if (guestStore.info().size > 0) {
		$rootScope.loadGuests();
	}
	
	// Perform a guest search.
	$rootScope.guestSearch = function() {
		// Determine if we need to search by last name.
		var url = '/guest';
		if ($rootScope.query != undefined && $rootScope.query != "") {
			url += '?lastName=' + $rootScope.query;
		}
		
		$http.get(url).success(function(guests) {
			$rootScope.storeGuests(guests);
			$rootScope.loadGuests();
		});
	}
	
	$rootScope.loadedGuestFoodOrders = [];
	$rootScope.loadedGuestClothingOrders = [];
	
	$rootScope.reloadFoodOrders = function() {
		$http.get('/food?guestId=' + $rootScope.readOnlyGuest.id).success(function(data) {
			$rootScope.loadedGuestFoodOrders = data;
			$rootScope.allowFoodOrder = true;
			for (var i = 0; i < data.length; i++) {
				if (data[i].today == true) {
					$rootScope.allowFoodOrder = false;
				}
			}
		});
	};
	
	$rootScope.reloadClothingOrders = function() {
		$http.get('/clothing?guestId=' + $rootScope.readOnlyGuest.id).success(function(data) {
			//console.log(data);
			$rootScope.loadedGuestClothingOrders = data;
			$rootScope.allowClothingOrder = true;
			for (var i = 0; i < data.length; i++) {
				if (data[i].today == true) {
					$rootScope.allowClothingOrder = false;
				}
			}
		});
	};
	
	$rootScope.createFoodOrder = function() {
		$("#noHistoryFoodOrder").hide();
		$http.post('/food', $rootScope.readOnlyGuest.id).success(function(data) {
			var newOrder = {};
			newOrder["orderDateAsString"] = new Date().toDateString();
			newOrder["today"] = true;
			$rootScope.loadedGuestFoodOrders.splice(0, 0, newOrder);
			$rootScope.allowFoodOrder = false;
		});
	}
	
	$rootScope.createClothingOrder = function() {
		$("#noHistoryClothingOrder").hide();
		$http.post('/clothing', $rootScope.readOnlyGuest.id).success(function(data) {
			//$scope.allowClothingOrder = false;
			//console.log($scope.loadedGuestClothingOrders);
			var newOrder = {};
			newOrder["orderDateAsString"] = new Date().toDateString();
			newOrder["today"] = true;
			$rootScope.loadedGuestClothingOrders.splice(0, 0, newOrder);
			$rootScope.allowClothingOrder = false;
		});
	}
	
	$rootScope.editGuestClicked = function() {
		$rootScope.editGuest = emptyGuest();
		angular.forEach($rootScope.readOnlyGuest, function(value, key) {
			$rootScope.editGuest[key] = value;
		});
	}
	
	$http.get('/zipCode').success(function(data) {
		$rootScope.zipCodes = data;
	});
	
	$rootScope.newGuest = dummy();
}

function emptyGuest() {
	var guest = {};
	guest.id = 0;
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
	guest.address = "123 Sesame St";
	guest.zipCode = "11102";
	guest.phone = "212-555-1234";
	guest.adults = 1;
	guest.seniors = 0;
	guest.children = 0;
	guest.ethnicity = "W";
	guest.lang = "E";
	return guest;
}