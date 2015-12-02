<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

    
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>


 <script> 

    var anispecies;
    var anibreed;
    		$(function () {
    		    $.ajax({
    		    	url: "animalcnt",
    		    	type: "GET",
    		    	success:function(res){
    		    		//alert(res);
    		    		var sp = res.split("/");
    		    		anispecies = JSON.parse(sp[0]);
    		    		anibreed = JSON.parse(sp[1]);
    		    		//alert(sp)    		    		
    		    		//alert(sp.length);
    		    		//alert(anispecies)
    		    		//alert(anibreed);
    		    		
    		    		
    		    		  $('#container').highcharts({
    		    		        chart: {
    		    		            type: 'pie',
    		    		            	events: {
    		    		                    drillup: function (e) {
    		    		                        //alert('drill Up');
    		    		                        console.log(this);
    		    		                        console.log(this.options.series[0].name);
    		    		                        console.log(this.options.series[0].data[0].name);
    		    		                        $("#print").empty();
    		    		                    }
    		    		                }      
    		    		        },
    		    		        title: {
    		    		            text: 'Browser market shares. January, 2015 to May, 2015'
    		    		        },
    		    		        subtitle: {
    		    		            text: 'Click the slices to view versions. Source: netmarketshare.com.'
    		    		        },
    		    		        plotOptions: {
    		    		            series: {
    		    		                dataLabels: {
    		    		                    enabled: true,
    		    		                    format: '{point.name}: {point.y:.1f}%'
    		    		                },
    		    		                cursor: 'pointer',
    		    		                events:{
    		    		                	click: function (event, i){
    		    		                		var print="";
    		    		                		//alert(event.point.name);	
    		    		                		$.each(anibreed,function(idx,item){
    	    		    	                    	if(item.name==event.point.name){
    	    		    	                    
    	    		    	             			print +="<h1>["+item.name+"]</h1></br><table><thead><tr><th>품종</th><th>수량</th></tr></thead><tbody>";
    	    		    	             			$.each(item.data, function(key, state){
    	    		    	             				//alert('key : '+key+'----'+state[0]+'----'+state[1]);
    	    		    	             				print += "<tr><td>"+state[0]+"</td><td align=\"right\">"+state[1]+"</td></tr>";
    	    		    	             			});
    	    		    	             			print += "</tbody></table>";
    	    		    	                    	 }
    	    		    	             		});
    	    		    	                    	 $('#print').html(print);
    		    		                	},
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
    		    		            data: 
    		    		            	anispecies
    		    		        }],
    		    		        drilldown: {
    		    		            series: 
    		    		            	anibreed
    		    		        }
    		    		  	
    		    		  });
    		    	}
    		    });
    		});
    		
    		$(".highcharts-button").click(function(){
    			alert("테스트");
    			$("#print").removeClass();
    		});
    		
$(function () {
	$("[id='anistate']").change(function () {
		alert($(this).val()); // 0/1
		var v=$(this).val();
		var datav=v.split("/");
		//$(this option:selected).val();
		//$('this option:selected').val()
		$.ajax({
	        url: "updateAniState", //"testAjax.jsp", 
	        type: "POST",
	        data:{
	        	anino : datav[1],
	        	anistate : datav[0]
	        },
	        success: function(msg) { //데이터 받는 부분.response
	        //yes
	        alert(msg);
	        	
	        	
	        },
	        error: function(a, b) {
	            alert("Request: " + JSON.stringify(a));
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	   
	});
	});
});

$(function() {
	$("[id='mid']").change(function() {
		alert($(this).val());
		var vv=$(this).val();
		var datavv=vv.split("/");
		$.ajax({
	        url: "insertAnimalManage", //"testAjax.jsp", 
	        type: "POST",
	        data:{
	        	anino : datavv[1],
	        	mid : datavv[0]
	        },
	        success: function(msg) { //데이터 받는 부분.response
	        //yes
	        alert(msg);
	        	
	        	
	        },
	        error: function(a, b) {
	            alert("Request: " + JSON.stringify(a));
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	   
	});
	});
});

// $(function () {
// 	$.ajax({
//         url: "selectpossibleEmployee", //"testAjax.jsp", 
//         type: "POST",
//         success: function(msg) { //데이터 받는 부분.response
//         //yes
//         alert(msg);
//         $("#employee").html(msg);
        	
//         },
//         error: function(a, b) {
//             alert("Request: " + JSON.stringify(a));
//             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//         }
   
// });
// });
  
</script>    

<style>
	#container{
		width:50%;
		height:50%;
		float:left;
	}
	
	#animal_table{
		width:50%;
		height:50%;
		margin:auto;
	}
	
	#print{
		
	}
</style>


<div id="container"  ></div>
<div id="print"></div>

<div id="animal_table">
<table id='cal_table' class="table table-striped">
	<thead class="table table-striped">
<tr>
<th colspan="11">대분류</th>
</tr>
<tr>
<td>count</td>
<td>no</td>
<td>species</td>
<td>breed</td>
<td>name</td>
<td>age</td>
<td>sex</td>
<td>state</td>
</tr>
</thead>

<tbody>
<%-- <c:forEach items="${anisvo}" var="anisvo"> --%>
<!-- <tr> -->
<%-- <td>${anisvo.anispecies }</td> --%>
<%-- <td>${anisvo.cnt }</td> --%>
<!-- </tr> -->
<%-- </c:forEach> --%>

<c:forEach items="${ablilst }" var="anilist"  varStatus="i">
<tr>
	<td>${i.count }</td>
	<td>${anilist.anino }</td> 
	<td><input type="hidden" id="anino+${i.count}" value="${anilist.anino }"/></td>
	<td>${anilist.anispecies }</td>
	<td>${anilist.anibreed }</td>
	<td>${anilist.aniname }</td>
	<td>${anilist.aniage }</td>
	<td>${anilist.anisex }</td>
	<td>${anilist.anistate }</td>
	<td>
	
		<select disabled="disabled">
			<c:if test="${anilist.anistate==0 }"><option selected="selected">보호중</option></c:if>
			<c:if test="${anilist.anistate==1 }"><option selected="selected">입양대기</option></c:if>
			<c:if test="${anilist.anistate==2 }"><option selected="selected">입양완료</option></c:if>
			<c:if test="${anilist.anistate==3 }"><option selected="selected">실종</option></c:if>
			<c:if test="${anilist.anistate==4 }"><option selected="selected">발견</option></c:if>
			<c:if test="${anilist.anistate==5 }"><option selected="selected">개인 보호중</option></c:if>
		</select>
	</td>
	<td>
		<!-- 셀렉트 -->
		<select name="anistate" id="anistate">
			<option>--변경--</option>
			<option value="0/${anilist.anino }">보호중</option>
			<option value="1/${anilist.anino }">입양대기</option>
			<option value="2/${anilist.anino }">입양완료</option>
		</select>
		
	</td>
	<td>
		<select id="mid" name="mid">
			<option>--선택--</option>
			<c:forEach var="listyv" items="${listy }">
			<option value="${listyv.mid}/${anilist.anino}">${listyv.mid}</option>
			</c:forEach>
		</select>
	</td>
	<!-- 기타 등등 -->
</tr>
</c:forEach>
</tbody>

<tfoot>
		<tr>
			<td><input type="button" value="무슨버튼!"/></td>
		</tr>
</tfoot>

</table>
</div>
