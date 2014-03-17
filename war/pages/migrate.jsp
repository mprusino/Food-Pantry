<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script src="js/third-party/jquery-2.0.2.min.js"></script>
<script src="js/third-party/jquery-ui-1.10.3.custom.min.js"></script>
<script src="js/third-party/jquery.slimscroll.min.js"></script>
<script src="js/third-party/bootstrap.min.js"></script>
<script src="js/third-party/CSVToArray.js"></script>
<script src="js/migrate.js"></script>
<title>Food and Clothing Pantry | New Life Community Development Center</title>
</head>
<%--Look at app.js --%>
<body>
    <div>Migrate your data!</div>
    <div>Copy in the entire CSV file, including the header:</div>
    <textarea rows="11" cols="450" id="data"></textarea>
    <br/>
    <button onclick="parse();">Parse!</button>
    <table id="parsed"  class="table table-bordered table-condensed" style="display:none">
        <thead>
            <tr>
                <th>FamID</th>
                <th>Last</th>
                <th>First</th>
                <th>Street_Address</th>
                <th>Ethnic</th>
                <th>Town</th>
                <th>Zip</th>
                <th>Total in Famly</th>
                <th>Above 65</th>
                <th>Adult Under 65</th>
                <th>Children Under 18</th>
                <th>Comments</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <table id="transformed" class="table table-bordered table-condensed" style="display:none">
        <thead>
            <tr>
                <th>lastName</th>
                <th>firstName</th>
                <th>address</th>
                <th>ethnicity</th>
                <th>zipCode</th>
                <th>seniors</th>
                <th>adults</th>
                <th>children</th>
                <th>phone</th>
                <th>lang</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <button onclick="post();">Post!</button>
</body>
</html>