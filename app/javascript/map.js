document.addEventListener("turbolinks:load", function(){
    google.charts.load('current', {
        'packages':['geochart'],
      });
      google.charts.setOnLoadCallback(drawRegionsMap);
});

document.addEventListener("turbolinks:load", function(){

});

function drawRegionsMap() {
    var data = google.visualization.arrayToDataTable([
    ['Country'],
    ['Germany'],
    ['United States'],
    ['Brazil'],
    ['Canada'],
    ['France'],
    ['RU'],
    ['Japan'],
    ['South Korea']
]);

var options = {};

var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

chart.draw(data, options);
}