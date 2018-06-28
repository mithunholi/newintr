function Chart() {
	// always initialize all instance properties
	// this.bar = bar;
	// this.baz = 'baz'; // default value

}
// class methods
Chart.prototype.getPieChart = function(argArr, offsetArr, id) {
	console.log(google);
	if (google) {
		console.log(google.visualization);
		if (!google.visualization) {
			console.log('MNB');
			google.load("visualization", "1", {
				packages : [ "corechart", "bar" ]
			});
			console.log(drawChart);
			google.setOnLoadCallback(drawChart);
		} else {
			drawChart();
		}

	}
	function drawChart() {
		console.log('MNBmnbyu');
		console.log(google.visualization);
		var data2 = google.visualization.arrayToDataTable(argArr);
		/*
		 * var offset = []; offsetArr.forEach(function(entry) {
		 * console.log(entry); });
		 */
		var options2 = {
			title : 'm-app',
			legend : 'none',
			pieSliceText : 'label',
			slices : offsetArr,
		};
		console.log(document.getElementById(id))
		document.getElementById(id).innerHtml = "";
		var chart2 = new google.visualization.PieChart(document
				.getElementById(id));
		chart2.draw(data2, options2);
	}
};
