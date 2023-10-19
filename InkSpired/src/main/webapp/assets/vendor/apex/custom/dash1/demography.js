var options = {
	series: [40, 45, 50, 55, 35],
	chart: {
		width: 340,
		type: "polarArea",
	},
	labels: ["13-20", "21-30", "31-40", "41-49", "50+"],
	fill: {
		opacity: 1,
	},
	stroke: {
		width: 1,
		colors: undefined,
	},
	colors: ["#155cba", "#00368e", "#5f9def", "#8db9f4", "#bad5f8", "#e8f1fd"],
	yaxis: {
		show: false,
	},
	legend: {
		position: "bottom",
	},
	tooltip: {
		y: {
			formatter: function (val) {
				return val + " Million";
			},
		},
	},
	plotOptions: {
		polarArea: {
			rings: {
				strokeWidth: 0,
			},
			spokes: {
				strokeWidth: 0,
			},
		},
	},
};

var chart = new ApexCharts(document.querySelector("#demography"), options);
chart.render();
