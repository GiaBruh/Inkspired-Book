// Sparkline 1
var options1 = {
	series: [
		{
			name: "Sales",
			data: [1, 3, 2, 3, 2],
		},
	],
	chart: {
		type: "line",
		height: 110,
		width: "50%",
		sparkline: {
			enabled: true,
		},
	},
	colors: ["#00368e"],
	stroke: {
		curve: "smooth",
		width: 5,
	},
	tooltip: {
		fixed: {
			enabled: false,
		},
		x: {
			show: false,
		},
		marker: {
			show: false,
		},
	},
	xaxis: {
		type: "day",
		categories: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
	},
	tooltip: {
		y: {
			formatter: function (val) {
				return val + "K";
			},
		},
	},
};
var chart1 = new ApexCharts(document.querySelector("#sparkline1"), options1);
chart1.render();

// Sparkline 2
var options2 = {
	series: [
		{
			name: "Expenses",
			data: [1, 2, 3, 3, 2],
		},
	],
	chart: {
		type: "area",
		height: 110,
		width: "50%",
		sparkline: {
			enabled: true,
		},
	},
	colors: ["#488fed"],
	stroke: {
		curve: "smooth",
		width: 5,
	},
	tooltip: {
		fixed: {
			enabled: false,
		},
		x: {
			show: false,
		},
		marker: {
			show: false,
		},
	},
	xaxis: {
		type: "day",
		categories: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
	},
	tooltip: {
		y: {
			formatter: function (val) {
				return val + "K";
			},
		},
	},
};
var chart2 = new ApexCharts(document.querySelector("#sparkline2"), options2);
chart2.render();

// Sparkline 3
var options3 = {
	series: [
		{
			name: "Income",
			data: [1, 2, 3, 4, 1, 2, 3],
		},
	],
	chart: {
		type: "bar",
		height: 110,
		width: "50%",
		sparkline: {
			enabled: true,
		},
	},
	plotOptions: {
		bar: {
			columnWidth: "50%",
			distributed: true,
		},
	},
	colors: ["#8db9f4"],
	stroke: {
		curve: "smooth",
		width: 1,
	},
	tooltip: {
		fixed: {
			enabled: false,
		},
		x: {
			show: false,
		},
		marker: {
			show: false,
		},
	},
	xaxis: {
		type: "day",
		categories: [
			"Monday",
			"Tuesday",
			"Wednesday",
			"Thursday",
			"Friday",
			"Saturday",
			"Sunday",
		],
	},
	tooltip: {
		y: {
			formatter: function (val) {
				return val + "K";
			},
		},
	},
};
var chart3 = new ApexCharts(document.querySelector("#sparkline3"), options3);
chart3.render();
