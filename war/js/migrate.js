var parsed = [];
var transformed = [];

$("#myCarousel").carousel('pause');

function parse() {
	var data = $("#data").val();
	data = CSVToArray(data);
	
	parsed = [];
	transformed = [];
	for (var i = 1; i < data.length; i++) {
		if ("" != data[i]) {
			var p = parseLineToJson(data[i])
			parsed.push(p);
			addParsedLineToTable(p);
			
			var t = transformData(data[i]);
			transformed.push(t);
			addTransformedLineToTable(t);
		}
	}
	
	$("#myCarousel, #data, #parseButton, #postButton, #paragraph, #progress").toggle();
}

function parseLineToJson(line) {
	var fields = line;
	var i = 0;
	
	var parsedLine = {};
	parsedLine["FamID"] = fields[i++];
	parsedLine["Last"] = fields[i++];
	parsedLine["First"] = fields[i++];
	parsedLine["Address"] = fields[i++];
	parsedLine["Ethnic"] = fields[i++];
	parsedLine["Town"] = fields[i++];
	parsedLine["Zip"] = fields[i++];
	parsedLine["Total"] = fields[i++];
	parsedLine["Seniors"] = fields[i++];
	parsedLine["Adults"] = fields[i++];
	parsedLine["Children"] = fields[i++];
	parsedLine["Comments"] = fields[i++];
	return parsedLine;
}

function addParsedLineToTable(p) {
	var row = "<tr>";
	row += "<td>" + p.FamID + "</td>";
	row += "<td>" + p.Last + "</td>";
	row += "<td>" + p.First + "</td>";
	row += "<td>" + p.Address + "</td>";
	row += "<td>" + p.Ethnic + "</td>";
	row += "<td>" + p.Town + "</td>";
	row += "<td>" + p.Zip + "</td>";
	row += "<td>" + p.Total + "</td>";
	row += "<td>" + p.Seniors + "</td>";
	row += "<td>" + p.Adults + "</td>";
	row += "<td>" + p.Children + "</td>";
	row += "<td>" + p.Comments + "</td>";
	row += "</tr>";
	$("#parsed tbody").append(row);
}

function transformData(line) {
	var fields = line;
	var i = 0;
	
	var data = {};
	
	i++; // skip FamID
	data["lastName"] = fields[i++];
	data["firstName"] = fields[i++];
	data["address"] = fields[i++];
	data["ethnicity"] = fields[i++];
	
	i++; // skip Town
	data["zipCode"] = fields[i++];
	
	i++; // skip Total
	data["seniors"] = zeroIfEmpty(fields[i++]);
	data["adults"] = zeroIfEmpty(fields[i++]);
	data["children"] = zeroIfEmpty(fields[i++]);
	
	data["lang"] = "";
	data["phone"] = "";
	return data;
}

function addTransformedLineToTable(t) {
	var row = "<tr>";
	row += "<td>" + t.lastName + "</td>";
	row += "<td>" + t.firstName + "</td>";
	row += "<td>" + t.address + "</td>";
	row += "<td>" + t.ethnicity + "</td>";
	row += "<td>" + t.zipCode + "</td>";
	row += "<td>" + t.seniors + "</td>";
	row += "<td>" + t.adults + "</td>";
	row += "<td>" + t.children + "</td>";
	row += "<td>" + t.phone + "</td>";
	row += "<td>" + t.lang + "</td>";
	row += "</tr>";
	$("#transformed tbody").append(row);
}

function zeroIfEmpty(str) {
	if (str == "") {
		return 0;
	} else {
		return parseInt(str);
	}
}


function post() {
	var totalNumber = transformed.length;
	
	for (var i = 0; i < transformed.length; i++) {
		$.post("/guest", JSON.stringify(transformed[i]))
		$("#progress .bar").css("width", (i / totalNumber * 100) + "%");
	}
	
	$("#progress .bar").css("width", "100%");
	$("#postButton, #done").toggle();
}