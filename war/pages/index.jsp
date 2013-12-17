<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-combobox.css" rel="stylesheet"/>
<link href="css/bootstrap-datepicker.css" rel="stylesheet"/>
<link href="css/select2.css" rel="stylesheet"/>
<link href="css/app.css" rel="stylesheet"/>
<script src="js/third-party/jquery-2.0.2.min.js"></script>
<script src="js/third-party/jquery-ui-1.10.3.custom.min.js"></script>
<script src="js/third-party/jquery.slimscroll.min.js"></script>
<script src="js/third-party/angular.min.js"></script>
<script src="js/third-party/typeahead.min.js"></script>
<script src="js/third-party/bootstrap.min.js"></script>
<script src="js/third-party/bootstrap-combobox.js"></script>
<script src="js/third-party/bootstrap-datepicker.js"></script>
<script src="js/third-party/select2.min.js"></script>
<script src="js/third-party/ui-bootstrap-custom-tpls-0.7.0.min.js"></script>
<script src="js/app.js"></script>
<script src="js/controllers/admin.js"></script>
<script src="js/controllers/documents.js"></script>
<script src="js/controllers/landing.js"></script>
<script src="js/controllers/navbar.js"></script>
<script src="js/controllers/order.js"></script>
<script src="js/controllers/registration.js"></script>
<script src="js/controllers/reporting.js"></script>
<script src="js/controllers/schedule.js"></script>
<script src="js/controllers/volunteer.js"></script>
<title>New Life Fellowship -- Food Pantry</title>
</head>
<body ng-app="food-pantry">
    <div ng-include="'/partials/navbar.jsp'"></div>
    <div ng-view class="container"></div>
</body>
</html>