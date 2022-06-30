<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>

<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>

<style>

		.styleaaa{
			font-family: Nanum Pen Script;
			font-size: 15pt;
			margin-top: 100px;
			line-height: 1.6
		}
		.stylebbb{
			width: 800px;
			margin: 0 auto;
		}

		ul.tabs{
			margin: 0px;
			padding: 0px;
			list-style: none;
		}
		ul.tabs li{
			background: none;
			color: #222;
			display: inline-block;
			padding: 10px 15px;
			cursor: pointer;
		}

		ul.tabs li.current{
			background: #ededed;
			color: #222;
		}

		.tab-content{
			display: none;

			padding: 15px;
		}

		.tab-content.current{
			display: inherit;
		}

</style>

<br><br>
<div class="styleaaa stylebbb">

	<div class="container" style="font:font-family;">
	    <ul class="tabs">
	        <li class="tab-link current" data-tab="tab-1">분별 차트</li>
	        <li class="tab-link" data-tab="tab-2">일별 차트</li>
	        <li class="tab-link" data-tab="tab-3">한국 증시 현황</li>
	    </ul>


		<!------------ tab1 start ---------------->
	    <div id="tab-2" class="tab-content">
			<select name="selectbox" id="selectbox" style="font-family: Nanum Pen Script;">
					<c:forEach var="i" items="${eqdata}">
						<option value="${i.eqId}">${i.eqNm}</option>
					</c:forEach>
			</select><br>
			<div id="space" style="height: 350px;">
				<canvas id="chart">
			</div>

	    </div>

	    <!------------ tab2 start ---------------->
	    <div id="tab-3" class="tab-content">
	        <div id="space" style="height: 350px;">
	            <canvas id="chart2">
	        </div>
	    </div>

	    <!------------ tab3 start ---------------->
	    <div id="tab-1" class="tab-content current">
	    	<select name="selectbox2" id="selectbox2" style="font-family: Nanum Pen Script;">
				<c:forEach var="i" items="${eqdata}">
					<option value="${i.eqId}">${i.eqNm}</option>
				</c:forEach>
			</select><br>
	        <div id="space" style="height: 350px;">
	            <canvas id="chart3">
	        </div>
	    </div>

	</div>
</div>

<br><br>

<script>
//am4chart
am4core.ready(function() {

am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.XYChart);

var data = [];
var value = 50;
for(var i = 0; i < 5; i++){
  var date = new Date();
  date.setHours(0,0,0,0);
  date.setDate(i);
  value -= Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);
  data.push({date:date, value: value});
}

chart.data = data;

// Create axes
var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.minGridDistance = 60;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

// Create series
var series = chart.series.push(new am4charts.LineSeries());
series.dataFields.valueY = "value";
series.dataFields.dateX = "date";
series.tooltipText = "{value}"

series.tooltip.pointerOrientation = "vertical";

chart.cursor = new am4charts.XYCursor();
chart.cursor.snapToSeries = series;
chart.cursor.xAxis = dateAxis;

//chart.scrollbarY = new am4core.Scrollbar();
chart.scrollbarX = new am4core.Scrollbar();

}); // end am4core.ready()
</script>

<!------------------ tab bar ------------------>
<script type="text/javascript">

$(document).ready(function(){
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
});

</script>

<!------------------ tab1 chart ------------------>
<script type="text/javascript">

	var userId = $('#userId');

	var color = Chart.helpers.color;
	var ctx = document.getElementById('chart').getContext('2d');
	//var ctx = document.getElementById('chart2').getContext('2d');

	var config = {
		type: 'line',
		data: {
			labels: ['data1','data2'],
			datasets:[{
				label: '',
				data:[
					1,2
				],
				fill: false
			}]
		},
		options: {
			scales: {
				yAxes: [{
					ticks: {
//					    userCallback: function(value, index, values) {
//					        value = value.toString();
//					        value = value.split(/(?=(?:...)*$)/);
//					        value = value.join(',');
//					        return value;
//					    }
						userCallback: function(value){
							return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						}
					}
				}],
				labels: {
					fontFamily: "'Nanum Pen Script'"
				}
			},
			legend: {
				labels: {
					fontSize: 20,
					fontFamily: "'Nanum Pen Script'"
				}
			}
	    }
	};

	var chart = new Chart(ctx, config);

	$('#selectbox').on('change', changed);

	function changed() {
		var r1 = Math.floor(Math.random() * 255);
		var r2 = Math.floor(Math.random() * 255);
		var r3 = Math.floor(Math.random() * 200);
		var eqId = $('#selectbox').val();
		$.ajax({
            type: 'post'
           ,data:{'eqId' : eqId}/*$("#afrm").serialize()*/
           ,url: '/system/chart.co'
               ,beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                       xhr.setRequestHeader(header, token);
               }
           ,dataType:'json'
           ,error: function(data, status, err){
               alert("err");
           }
           ,success: function(data){

               //alert("성공");

				config.data.datasets[0].label = $('#selectbox option:checked').text();
				config.data.labels = [];
				config.data.datasets[0].data = [];
				for(var i = 0; i< data.list.length; i++){
					config.data.labels.push(data.list[i].reTime);
					config.data.datasets[0].data.push(data.list[i].eqVal);
				}

				// style
				config.data.datasets[0].backgroundColor= "rgba("+r1+","+r2+","+r3+",0.5)";
				config.data.datasets[0].borderColor= "rgba("+r1+","+r2+","+r3+",0.5)";

				chart.update();

			}
		});
	}

	$(document).ready(function(){
		changed();
	});
</script>

<!------------------ tab2 chart ------------------>
<script type="text/javascript">
	var ctx2 = document.getElementById('chart2').getContext('2d');
	//var ctx = document.getElementById('chart2').getContext('2d');

	function cos(){
		var r1 = Math.floor(Math.random() * 255);
		var r2 = Math.floor(Math.random() * 255);
		var r3 = Math.floor(Math.random() * 200);
		$.ajax({
            type: 'post'
           ,data:{}/*$("#afrm").serialize()*/
           ,url: '/system/cos.co'
               ,beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                       xhr.setRequestHeader(header, token);
               }
           ,dataType:'json'
           ,error: function(data, status, err){
               alert("cos err");
           }
           ,success: function(data){
        	   config2.data.datasets[0].label = "코스피";
        	   config2.data.datasets[1].label = "코스닥";

        	   for(var i = 0; i< data.cospdata.length; i++){
        			config2.data.labels.push(data.cospdata[i].reTime);

        			config2.data.datasets[0].data.push(data.cospdata[i].eqVal);
        			config2.data.datasets[1].data.push(data.cosddata[i].eqVal);
        		}

				config2.data

        	   	config2.data.datasets[0].backgroundColor= "rgba("+r1+","+r2+","+r3+",0.5)";
				config2.data.datasets[0].borderColor= "rgba("+r1+","+r2+","+r3+",0.5)";
				config2.data.datasets[1].backgroundColor= "rgba("+r2+","+r3+","+r1+",0.5)";
				config2.data.datasets[1].borderColor= "rgba("+r2+","+r3+","+r1+",0.5)";
           }
		});
	}

	var config2 = {
		type: 'line',
		data: {
			labels: ['data1','data2'],
			datasets:[{
				label: '',
				data:[
					1,2
				],
				yAxisId: 'y1',
				fill: false
			},{
				label: '',
				data:[
					2,3
				],
				yAxisId: 'y1',
				fill: false
			}]
		},
		options: {
			scales: {
				yAxes: [{
					position: 'left',
					id: 'y1',
					ticks: {
						userCallback: function(value){
							return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						}
					}
				},{
					position: 'left',
					id: 'y1',
					ticks: {
						userCallback: function(value){
							return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						}
					}
				}],
				labels: {
					fontFamily: "'Nanum Pen Script'"
				}
			},
			legend: {
				labels: {
					fontSize: 20,
					fontFamily: "'Nanum Pen Script'"
				}
			}
	    }
	};

	var chart2 = new Chart(ctx2, config2);

	config2.data.labels = [];
	config2.data.datasets[0].data = [];
	config2.data.datasets[1].data = [];

	$(document).ready(function(){
		cos();
	});


</script>


<!------------------ tab3 chart ------------------>
<script type="text/javascript">

	var ctx3 = document.getElementById('chart3').getContext('2d');


	var config3 = {
		type: 'line',
		data: {
			labels: ['data1','data2'],
			datasets:[{
				label: '',
				data:[
					1,2
				],
				fill: false
			}]
		},
		options: {
			scales: {
				yAxes: [{
					ticks: {
						userCallback: function(value){
							return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						}
					}
				}],
				labels: {
					fontFamily: "'Nanum Pen Script'"
				}
			},
			legend: {
				labels: {
					fontSize: 20,
					fontFamily: "'Nanum Pen Script'"
				}
			}
	    }
	};
	var chart3 = new Chart(ctx3, config3);
	$('#selectbox2').on('change', changed2);

	function changed2() {
		var r1 = Math.floor(Math.random() * 255);
		var r2 = Math.floor(Math.random() * 255);
		var r3 = Math.floor(Math.random() * 200);
		var eqId = $('#selectbox2').val();
		console.log(eqId);
		$.ajax({
	        type: 'post'
	       ,data:{'eqId' : eqId}/*$("#afrm").serialize()*/
	       ,url: '/system/todaydata.co'
	           ,beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                   xhr.setRequestHeader(header, token);
	           }
	       ,dataType:'json'
	       ,error: function(data, status, err){
	           alert("tab3 err");
	       }
	       ,success: function(data){

	           //alert("성공");

				config3.data.datasets[0].label = $('#selectbox2 option:checked').text();
				config3.data.labels = [];
				config3.data.datasets[0].data = [];
				for(var i = 0; i< data.todaydata.length; i++){
					config3.data.labels.push(data.todaydata[i].reTime);
					config3.data.datasets[0].data.push(data.todaydata[i].eqVal);
				}

				// style
				config3.data.datasets[0].backgroundColor= "rgba("+r1+","+r2+","+r3+",0.5)";
				config3.data.datasets[0].borderColor= "rgba("+r1+","+r2+","+r3+",0.5)";

				chart3.update();

			}
		});
		chart3.update();
	}

	$(document).ready(function(){
		changed2();
	});

</script>















