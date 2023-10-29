var options = {
	chart: {
		height: 300,
		type: "donut",
	},
	labels: ["Desktop", "Tablet", "Mobile"],
	series: [60000, 45000, 15000],
	legend: {
		position: "bottom",
	},
	dataLabels: {
		enabled: false,
	},
	stroke: {
		width: 8,
		colors: ["#ffffff"],
	},
	colors: ["#00368e", "#bad5f8", "#e8f1fd"],
	tooltip: {
		y: {
			formatter: function (val) {
				return "$" + val;
			},
		},
	},
};
var chart = new ApexCharts(document.querySelector("#device"), options);
chart.render();
