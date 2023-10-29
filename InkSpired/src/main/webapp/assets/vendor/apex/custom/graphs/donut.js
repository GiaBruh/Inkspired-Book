var options = {
	chart: {
		width: 300,
		type: "donut",
	},
	labels: ["Team A", "Team B", "Team C", "Team D", "Team E"],
	series: [20, 20, 20, 20, 20],
	legend: {
		position: "bottom",
	},
	dataLabels: {
		enabled: false,
	},
	stroke: {
		width: 0,
	},
	colors: ["#155cba", "#00368e", "#5f9def", "#8db9f4", "#bad5f8", "#e8f1fd"],
};
var chart = new ApexCharts(document.querySelector("#donut"), options);
chart.render();
