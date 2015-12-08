<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//cdn.ckeditor.com/4.5.5/standard/ckeditor.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.3.min.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>


<script>
$(function () {

	
$('[id="surbtn"]').click(function () {
		
		//alert($(this).val()); //시퀀스
		$('#num').val($(this).val());
				$.ajax({
			        url: "selectonepopup", //"testAjax.jsp", 
			        type: "POST",
			        data:{
			        	num : $(this).val()
			        },
			        success: function(msg) { //데이터 받는 부분.response
			        alert('aaaa');
	        		alert(msg);
	
			        var json=JSON.parse(msg);
			        
			        CKEDITOR.instances.content.setData(json[0].content);

			        $('#sub').val(json[0].sub);
			        $('#sub1').val(json[0].sub1);
			        $('#sub2').val(json[0].sub2);
			        $('#sub3').val(json[0].sub3);

			        },
			        error: function(a, b) {
			            alert("Request: " + JSON.stringify(a));
			            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        }
			   
			});
	});	
	
	
	
	$.ajax({
        url: "surveyChart", //"testAjax.jsp", 
        type: "POST",
        success: function(msg) { //데이터 받는 부분.response
        var json=JSON.parse(msg);
        $('#container').highcharts({
	        chart: {
	            type: 'column'
	        },
	        title: {
	            text: '설문 조사'
	        },
	        xAxis: {
	            categories: ['동물등록제', '멸종위기동물', '캣맘', 'TNR']
	        },
	        yAxis: {
	            min: 0,
	            title: {
	                text: 'total num'
	            },
	            stackLabels: {
	                enabled: true,
	                style: {
	                    fontWeight: 'bold',
	                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
	                }
	            }
	        },
	        legend: {
	            align: 'right',
	            x: -30,
	            verticalAlign: 'top',
	            y: 25,
	            floating: true,
	            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
	            borderColor: '#CCC',
	            borderWidth: 1,
	            shadow: false
	        },
	        tooltip: {
	            headerFormat: '<b>{point.x}</b><br/>',
	            pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
	        },
	        plotOptions: {
	            column: {
	                stacking: 'normal',
	                dataLabels: {
	                    enabled: true,
	                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
	                    style: {
	                        textShadow: '0 0 3px black'
	                    }
	                }
	            }
	        },
	        series: json
	    });
	
        
        },
        error: function(a, b) {
            alert("Request: " + JSON.stringify(a));
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
   	
});
	 
	
	
	
});


</script>

<style>
 #sub, #sub1, #sub2, #sub3 {
  width: 400px; 
}
 #survey{
 width:100%;
 }
 #form{
 width:50%;
 }
 #container{
 width:45%;
 margin-left: 50px;
 }
</style>

<div id="survey" class="form-inline">

		<!--content -->
		<div id="form" class="form-group">
		<form action="updateSurvey" method="post">
		<input type="hidden" id="num" name="num">
		<textarea id="content" class="ckeditor" name="content"></textarea>
		<table>
			<tr>
			<td><!-- sub -->
		주&nbsp; 제<input type="text" id="sub" name="sub"></td>
			</tr>
			
			<tr>
			<td><!-- sub1 -->
		보기1<input type="text" id="sub1" name="sub1"></td>
			</tr>
			
			<tr>
			<td><!-- sub2 -->
		보기2<input type="text"  id="sub2" name="sub2"></td>
			</tr>
			
			<tr>
			<td><!-- sub3 -->
		보기3<input type="text" id="sub3" name="sub3"></td>
			</tr>
			
			<tr>
			<td><input type="submit" value="수정 완료!"></td>
			</tr>
		</table>
		</form>	
		</div>

	   <div id="container" class="form-group"></div>
	</div>  
	   
	   <table class="table table-striped">
	   		<thead class="table table-striped">
	   			<tr><td><h4>설문 조사</h4></td></tr>
	   			<tr>
	   			<td>num</td>
	   			<td>sub</td>
	   			<td>sdate</td>
	   			</tr>
	   			
	   		</thead>
	   		<c:forEach var="listv" items="${list }">
	   		<tr>
	   			<td>${listv.num }</td>
	   			<td>${listv.sub }</td>
	   			<td>${listv.sdate }</td>
	   			<td><button type="button" id="surbtn" value="${listv.num }">불러오기</button>
	   		</tr>
			</c:forEach>
	   </table>
	   
	   
	
