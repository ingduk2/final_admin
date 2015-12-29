
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
<!-- <script src="https://code.highcharts.com/highcharts.js"></script> -->
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>



<script>
	$(function() {
		$.ajax({
	        url: "adoptScore", //"testAjax.jsp", 
	        type: "POST",
	        success: function(msg1) { //데이터 받는 부분.response
	        	//alert(msg1);
	            var json1=JSON.parse(msg1);
	        	//alert(json1);
	        	
	        	 $('#score_chart').highcharts({
	        	        chart: {
	        	            type: 'column'
	        	        },
	        	        title: {
	        	            text: '회원 점수대별'
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
	        	                    
	        	                }
	        	            }
	        	        },

	        	        tooltip: {
	        	            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
	        	            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
	        	        },

	        	        series: [{
	        	            name: 'Brands',
	        	            colorByPoint: true,
	        	            data: json1
	        	        }],
	        	       
	        	    });
	        	
	        
	        	
	        },
	        error: function(a, b) {
	           // alert("Request: " + JSON.stringify(a));
	           // alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	    });
	});


	$(function() {
		$('[id="adoptbtn"]').click(function() {
			//alert($(this).val());
			$('#down').prop('href', 'downloadExcel?adoptno='+$(this).val());
			//버튼 클릭하면 위의 양식으로 옮겨주기!
			//ado1, adov1
			//alert($(this).parent().parent().html());
			console.log($(this).parent().parent().html());
			//alert($(this).parent().parent().find("td").eq(5).html());
			for(var i=0; i<15; i++){
				$('#ado'+i).html($(this).parent().parent().find("td").eq(i+2).html());
			}
		});
	});
</script>

<style>
#wrap {
	width: 100%;
	margin: auto;
	border: 1px;
}

#adopt_excel{
	width:45%;
}
#score_chart{
	margin-left : 50px;
	width:45%
	
}



</style>


<div id="wrap" class="form-inline">

	<div id="adopt_excel" class="form-group">
	<table class="table table-striped">
		<thead class="table table-striped">
			<tr>
				<th>입양 양식</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td></td>
				<td>Age</td>
				<td id="ado0"></td>
			</tr>
			<tr>
				<td></td>
				<td>Score</td>
				<td id="ado1"></td>
			</tr>
			<tr>
				<td>Q1</td>
				<td>${vo.q1 }</td>
				<td id="ado2"></td>
			</tr>
			<tr>
				<td>Q1-1</td>
				<td>${vo.q1_1 }</td>
				<td id="ado3"></td>
			</tr>
			<tr>
				<td>Q2</td>
				<td>${vo.q2}</td>
				<td id="ado4"></td>
			</tr>
			<tr>
				<td>Q2-1</td>
				<td>${vo.q2_1}</td>
				<td id="ado5"></td>
			</tr>
			<tr>
				<td>Q3</td>
				<td>${vo.q3}</td>
				<td id="ado6"></td>
			</tr>
			<tr>
				<td>Q4</td>
				<td>${vo.q4}</td>
				<td id="ado7"></td>
			</tr>
			<tr>
				<td>Q5</td>
				<td>${vo.q5}</td>
				<td id="ado8"></td>
			</tr>
			<tr>
				<td>Q6</td>
				<td>${vo.q6}</td>
				<td id="ado9"></td>
			</tr>
			<tr>
				<td>Q6-1</td>
				<td>${vo.q6_1}</td>
				<td id="ado10"></td>
			</tr>
			<tr>
				<td>Q7</td>
				<td>${vo.q7}</td>
				<td id="ado11"></td>
			</tr>
			<tr>
				<td>Q8</td>
				<td>${vo.q8}</td>
				<td id="ado12"></td>
			</tr>
			<tr>
				<td>Q9</td>
				<td>${vo.q9}</td>
				<td id="ado13"></td>
			</tr>
			<tr>
				<td>Q10</td>
				<td>${vo.q10}</td>
				<td id="ado14"></td>
			</tr>
		</tbody>
		
		<tfoot>
			<tr>
			<td><a href="" id="down" >다운 로드!</a></td>
			</tr>
		</tfoot>
	</table>
	</div>
	
	
	<div id="score_chart" class="form-group"></div>
</div>

	<table class="table table-striped">
		<thead class="table table-striped">
			<tr>
				<th colspan="19">입양 신청자 !</th>
			</tr>
			<tr>
				<td>ID</td>
				<td>Anino</td>
				<td>Age</td>
				<td>Score</td>
				<td>q1</td>
				<td>q1-1</td>
				<td>q2</td>
				<td>q2-1</td>
				<td>q3</td>
				<td>q4</td>
				<td>q5</td>
				<td>q6</td>
				<td>q6-1</td>
				<td>q7</td>
				<td>q8</td>
				<td>q9</td>
				<td>q10</td>
			</tr>
		</thead>

		<!-- 리스트 받아서 td안에 뽑으믄 됩니다. -->
		<tbody>
			<c:forEach var="listv" items="${list }">
				<tr>
<%-- 					<td>${listv.adopno }</td> --%>
					<td>${listv.mid }</td>
					<td>${listv.anino }</td>
<%-- 					<td>${listv.eid }</td> --%>
					<td id="adov1">${listv.memage }</td>
					<td id="adov2">${listv.score }</td>
					<td id="adov3">${listv.qus1 }</td>
					<td id="adov4">${listv.qus1sup1 }</td>
					<td id="adov5">${listv.qus2 }</td>
					<td id="adov6">${listv.qus2sup1 }</td>
					<td id="adov7">${listv.qus3 }</td>
					<td id="adov8">${listv.qus4 }</td>
					<td id="adov9">${listv.qus5 }</td>
					<td id="adov10">${listv.qus6 }</td>
					<td id="adov11">${listv.qus6sup1 }</td>
					<td id="adov12">${listv.qus7 }</td>
					<td id="adov13">${listv.qus8 }</td>
					<td id="adov14">${listv.qus9 }</td>
					<td id="adov15">${listv.qus10 }</td>
					<td><button type="button" id="adoptbtn" value="${listv.adoptno }">불러오기</button>
				</tr>
			</c:forEach>

		</tbody>

		<tfoot>
			
		</tfoot>
	</table>

