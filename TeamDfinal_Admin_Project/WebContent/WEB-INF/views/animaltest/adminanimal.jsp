<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<script>
$(function () {
	
	//selectanimalpay
	
		$.ajax({
		        url: "selectanimalpay", //"testAjax.jsp", 
		        type: "POST",
		        
		        success: function(msg) { //데이터 받는 부분.response
		        //yes
		       // alert(msg);
		        var json=JSON.parse(msg);
		       // alert(json);
		        $('#container').highcharts({
		            chart: {
		                plotBackgroundColor: null,
		                plotBorderWidth: 0,
		                plotShadow: false
		            },
		            title: {
		                text: '동물<br>식 비<br>',
		                align: 'center',
		                verticalAlign: 'middle',
		                y: 40
		            },
		            tooltip: {
		                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		            },
		            plotOptions: {
		                pie: {
		                    dataLabels: {
		                        enabled: true,
		                        distance: -50,
		                        style: {
		                            fontWeight: 'bold',
		                            color: 'white',
		                            textShadow: '0px 1px 2px black'
		                        }
		                    },
		                    startAngle: -90,
		                    endAngle: 90,
		                    center: ['50%', '75%']
		                }
		            },
		            series: [{
		                type: 'pie',
		                name: 'Browser share',
		                innerSize: '50%',
		                data: json
		            }]
		        });
		        
		        	
		        },
		        error: function(a, b) {
		            //alert("Request: " + JSON.stringify(a));
		            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
		   
		});
	
   
});

</script>

<div id="container" ></div>


<div>
	<table class="table table-striped">
		<thead class="table table-striped">
			<tr>
				<th>Anino</th>
				<th>anispecies</th>
				<th>anibreed</th>
				<th>aniname</th>
				<th>anisex</th>
				<th>MID</th>
				<th>AMRICE</th>
				<th>AMSPO</th>
				<th>AMBATH</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="listv" items="${list }">
				<tr>
					<td>${listv.anino }</td>
					<td>${listv.anispecies }</td>
					<td>${listv.anibreed }</td>
					<td>${listv.aniname }</td>
					<td>${listv.anisex }</td>
					<td>${listv.mid }</td>
					<td>${listv.amrice }</td>
					<td>${listv.amspo }</td>
					<td>${listv.ambath }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>