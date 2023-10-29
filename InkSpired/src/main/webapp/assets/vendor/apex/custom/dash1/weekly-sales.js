var options = {
	chart: {
		height: 250,
		type: "area",
		toolbar: {
			show: false,
		},
	},
	dataLabels: {
		enabled: false,
	},
	stroke: {
		curve: "smooth",
		width: 3,
	},
	series: [
		{
			name: "Visitors",
			data: [10, 40, 15, 40, 35, 96, 69],
		},
	],
	grid: {
		borderColor: "#dfd6ff",
		strokeDashArray: 5,
		xaxis: {
			lines: {
				show: true,
			},
		},
		yaxis: {
			lines: {
				show: false,
			},
		},
		padding: {
			top: 0,
			right: 20,
			bottom: 10,
			left: 20,
		},
	},
	xaxis: {
		categories: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
	},
	yaxis: {
		labels: {
			show: false,
		},
	},
	colors: ["#00368e", "#bad5f8", "#e8f1fd"],
	markers: {
		size: 0,
		opacity: 0.3,
		colors: ["#00368e", "#bad5f8", "#e8f1fd"],
		strokeColor: "#ffffff",
		strokeWidth: 2,
		hover: {
			size: 7,
		},
	},
	tooltip: {
		y: {
			formatter: function (val) {
				return +val + "k";
			},
		},
	},
};

var chart = new ApexCharts(document.querySelector("#weekly-sales"), options);

chart.render();
