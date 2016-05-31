<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
</head>
<body>
	<c:import url="../include/basic.jsp"/> 
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="btn-group" role="group">
 		 <button type="button" class="btn btn-default" id="btn">daily</button>
 		 <button type="button" class="btn btn-default" id="btn">monthly</button>
 		 <button type="button" class="btn btn-default" id="btn">hourly</button>
	</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Line Chart</div>
					<div class="panel-body">
						<div class="canvas-wrapper">
							<canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
	</div>
	<script type="text/javascript">
		
	var lineChartData = {
			labels : ["1","2","3","4","5","6","7"],
			datasets : [
				{
					label: "My First dataset",
					fillColor : "rgba(48, 164, 255, 0.2)",
					strokeColor : "rgba(48, 164, 255, 1)",
					pointColor : "rgba(48, 164, 255, 1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(48, 164, 255, 1)",
					data : [1,2,3,4,5,6,7]
				}
// 				,	//Rent
// 				{
// 					label: "My Second dataset",
// 					fillColor : "rgba(48, 164, 255, 0.2)",
// 					strokeColor : "rgba(48, 164, 255, 1)",
// 					pointColor : "rgba(48, 164, 255, 1)",
// 					pointStrokeColor : "#fff",
// 					pointHighlightFill : "#fff",
// 					pointHighlightStroke : "rgba(48, 164, 255, 1)",
// 					data : [7,6,5,4,3,2,1]
// 				}
			]

		}
	
// 		var chart1 = document.getElementById("line-chart").getContext("2d");
// 		var myChart = new Chart(chart1).Line(lineChartData, {
// 			responsive: true
// 		});
		var idx=0;
		var myChart;
		$(document).on("click","#btn",function(){
			var date = $(this).html();
			var date1="";
				if(date == "hourly")					
				{
					lineChartData.labels = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23];
				}
				else if(date == "monthly")
				{
					date1="2016-01-01"
					lineChartData.labels = ["2016-01","2016-02","2016-03","2016-04","2016-05","2016-06","2016-07"];					
				}
				else if(date == "daily")
				{					
					date1="2016-05-29"
					lineChartData.labels = ["2016-05-21","2016-05-22","2016-05-23","2016-05-24","2016-05-25","2016-05-26","2016-05-27"];	
				}
			var url = "${pageContext.request.contextPath}/admin/sales/"+date+".do";
			$.ajax({
				url:url,
				data:{"date":date1}
			}).done(function(data){
				var json = JSON.parse(data);
				console.dir(json);
				for(var i in lineChartData.datasets[0].data)
				{	
					if(json[i])
						lineChartData.datasets[0].data[i]=json[i].sales;
					else
						lineChartData.datasets[0].data[i]=0;
				}
				
				$("#canvas-wrapper").html("");
				$("#canvas-wrapper").html('<canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>');
				var chart1 = document.getElementById("line-chart").getContext("2d");
				document.getElementById("line-chart").getContext("2d").clearRect(0,0,200,600);
				if(myChart)
					{
					console.log(1)					
					myChart.destroy();
					}
				
				myChart = new Chart(chart1).Line(lineChartData, {
					responsive: true
				});
			});
		})
		
	</script>
</body>
</html>