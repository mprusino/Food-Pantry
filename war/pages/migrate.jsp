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
<body class="container">
    <p id="paragraph">
        Migrate your data! Be patient!<br/>
        Copy in the entire CSV file, including the header:
    </p>
    <textarea rows="11" cols="450" id="data"></textarea>
    <br/>
    <button id="parseButton" class="btn btn-primary" onclick="parse();">Parse!</button>
    
    <div id="myCarousel" class="carousel slide" style="display:none;">
        <!-- Carousel items -->
        <div class="carousel-inner" style="max-height: 600px; overflow-y: scroll;">
            <div class="active item" style="padding-right: 60px">
                <table id="parsed" class="table table-bordered table-condensed">
                    <thead>
                        <tr>
                            <th>FamID</th>
                            <th>Last</th>
                            <th>First</th>
                            <th>Address</th>
                            <th>Ethnic</th>
                            <th>Town</th>
                            <th>Zip</th>
                            <th>Total</th>
                            <th>Seniors</th>
                            <th>Adults</th>
                            <th>Children</th>
                            <th>Comments</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="item" style="padding-right: 60px">
                <table id="transformed" class="table table-bordered table-condensed">
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
            </div>
        </div>
        <!-- Carousel nav -->
        <a class="carousel-control right" id="left" href="#myCarousel" data-slide="prev" onclick="$('#myCarousel').carousel('pause'); $('#left, #right').toggle();" style="display:none;">&lsaquo;</a>
        <a class="carousel-control right" id="right" href="#myCarousel" data-slide="next" onclick="$('#myCarousel').carousel('pause'); $('#left, #right').toggle();">&rsaquo;</a>
    </div>
    
    <div id="progress" class="progress progress-striped active" style="display:none;">
        <div class="bar" style="width: 0%;"></div>
    </div>
    <button id="postButton" class="btn btn-primary" onclick="post();" style="display:none;">Post!</button>
    <h1 id="done" style="display: none;">Done!</h1>
</body>
</html>