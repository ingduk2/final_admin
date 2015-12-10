<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
<!-- <script src="https://code.highcharts.com/highcharts.js"></script> -->
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>



<script>
$(function () {
	$.ajax({
        url: "memberAge", //"testAjax.jsp", 
        type: "POST",
        success: function(msg1) { //데이터 받는 부분.response
        	//alert(msg1);
            var json1=JSON.parse(msg1);
        	//alert(json1);
        	
        	 $('#member_chart_age').highcharts({
        	        chart: {
        	            type: 'column'
        	        },
        	        title: {
        	            text: '회원 연령대별'
        	        },
        	        subtitle: {
        	            text: ''
        	        },
        	        xAxis: {
        	            type: 'category'
        	        },
        	        yAxis: {
        	            title: {
        	                text: 'Total count'
        	            }

        	        },
        	        legend: {
        	            enabled: false
        	        },
        	        plotOptions: {
        	            series: {
        	                borderWidth: 0,
        	                dataLabels: {
        	                    enabled: true,
        	                    //format: '{point.y:.1f}'
        	                }
        	            }
        	        },

        	        tooltip: {
        	            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        	            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> of total<br/>'
        	        },

        	        series: [{
        	            name: 'Brands',
        	            colorByPoint: true,
        	            data: json1
        	        }],
        	       
        	    });
        	
        
        	
        },
        error: function(a, b) {
            alert("Request: " + JSON.stringify(a));
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
    // Create the chart
    memberchart();
});

function memberchart(){
	$.ajax({
        url: "memberChart", //"testAjax.jsp", 
        type: "POST",
        success: function(msg) { //데이터 받는 부분.response
        	//alert(msg);
            var json=JSON.parse(msg);
        	//alert(json);

        	
        	 $('#member_chart2').highcharts({
     	        chart: {
     	            type: 'pie',
     	            options3d: {
     	                enabled: true,
     	                alpha: 45
     	            }
     	        },
     	        title: {
     	            text: '회원 지역별'
     	        },
     	        subtitle: {
     	            text: 'Highcharts'
     	        },
     	        plotOptions: {
     	            pie: {
     	                innerSize: 100,
     	                depth: 45
     	            }
     	        },
     	        series: [{
     	            name: '회원 수',
     	            data: json
     	        }]
     	    });
        	
        },
        error: function(a, b) {
            alert("Request: " + JSON.stringify(a));
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
	
   
}

//강제 탈퇴!
$(function() {
	//귀찮다 동적테일블 ajax안하고 걍 할거임 ㅜㅜ
// 	$.ajax({
// 		url:"ajaxMember",
// 		type:"POST",
		
// 		success: function(msg) {
// 			//확인 메세지
// 			var json=JSON.parse(msg);
			
// 			$.each(json,function(idx,item){
				
// 			});
// 		},
// 		error: function(a, b) {
// 			alert("Request: " + JSON.stringify(a));
//             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 		}
// 	});
	
	
	$('[id="membtn"]').click(function() {
		alert($(this).val());
		var mid=$(this).val();
		location.href='deleteforceMem?mid='+mid;
		
	});
});

</script>


<style>
	#wrap_mem{
		width:100%;
	}
	.member_chart{
		width:45%;
	}
	#member_chart2{
		margin-left: 60px;
	}
	#member_chart_age{
		margin-left: 40px;
	}
</style>

<div id=wrap_mem class="form-inline">

<!-- 1번 째 줄 -->

<div class="member_chart form-group" id="member_chart_age" ></div>
<div class="member_chart form-group"  id="member_chart2" ></div>
</div>
	<table id="member_list" class="table table-striped">
		<thead class="table table-striped">
			<tr>
				<th colspan="8">회원 정보</th>
			</tr>
			<tr>
				<td>ID</td>
				<td>NAME</td>
				<td>EMAIL</td>
				<td>PWD</td>
				<td>BIRTH</td>
				<td>TEL</td>
				<td>ADDR</td>
				<td>SINGO</td>
			</tr>
			
		</thead>
		
		<tbody>
			<c:forEach var="listv" items="${list }">
			<tr>
				<td>${listv.mid }</td>
				<td>${listv.mname }</td>
				<td>${listv.memail }</td>
				<td>${listv.mpwd }</td>
				<td>${listv.mbirth }</td>
				<td>${listv.mtel }</td>
				<td>${listv.mroad }</td>
				<td>${listv.mrpt }</td>
				 
				<td><button type="button" id="membtn" value="${listv.mid}">강제 탈퇴</button> </td>
			</tr>
			</c:forEach>
		</tbody>
		
		<tfoot>
		</tfoot>
	</table>
	
<!-- </div> -->

<!-- 2번째 줄 -->
	
	
	



