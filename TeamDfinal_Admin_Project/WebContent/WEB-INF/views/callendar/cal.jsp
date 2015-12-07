<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel='stylesheet'
	href='http://fullcalendar.io/js/fullcalendar-2.3.1/lib/cupertino/jquery-ui.min.css' />
<link
	href='http://fullcalendar.io/js/fullcalendar-2.3.1/fullcalendar.css'
	rel='stylesheet' />
<link
	href='http://fullcalendar.io/js/fullcalendar-2.3.1/fullcalendar.print.css'
	rel='stylesheet' media='print' />
<script
	src='http://fullcalendar.io/js/fullcalendar-2.3.1/lib/moment.min.js'></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src='http://fullcalendar.io/js/fullcalendar-2.3.1/fullcalendar.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.3.1/lang-all.js'></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<style>
#cal_detail{width:400px; height:400px; float:left;}
#cal_table{margin-left:20px; width:500px; height: 400px; float:left;}

</style>
<script>





var caljson;
var last_seq;
$(function(){
	//관리자 사용자 공통
	//사용자 추가사항해야할것 - 로드하면서 신청한거 빨간색으로 바꿔주기?
	 $.ajax({
        url: "selectallCal", //"testAjax.jsp", 
        type: "POST",
        success: function(json) { //데이터 받는 부분.response 
          
     		//alert(json);
     		caljson=JSON.parse(json);
     		//alert(caljson);
     		callendar();
        },
        error: function(a, b) {
            alert("Request: " + JSON.stringify(a));
        }
    });
	 
	 
	 
});

function callendar(){
		
		var currentLangCode = 'ko';
		$('#cal_detail').fullCalendar('destroy');
		$('#cal_detail').fullCalendar({
					
					//lang: currentLangCode,
					theme: true,
					
					timeFormat : 'hh:mm', //시간 포멧
					// lang: 'ko',  //언어타입
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month'
					},
					
					
					defaultView : 'month',//기본 뷰 - 옵션   //첫 페이지 기본 뷰 옵션
					editable : false, //에디터 가능 옵션
					selectable : true,
					selectHelper : true,
					editable : true,
					eventLimit : true,
					
					// 클릭이벤트 - 삭제
					//관리자용+사용자용
					eventClick : function(calEvent, jsEvent, view) {
						
						var username=$('#name').val();
						alert("username -- "+username);
						
						if(username=='admin'){
							
							
							var r = confirm("Delete " + calEvent.title + ":"
									+ calEvent._id);//삭제 안내말
							
							
							
							if (r === true) {//확인 버튼
								
								//삭제 ajax
								 $.ajax({
								        url: "deleteCal", //"testAjax.jsp", 
								        type: "POST",
								        data: { //파라미터로 q
							                 //volunteertitle : calEvent.title,
							                 seq : calEvent.title.split(".")[0]
							                 //title start end 
							              },
								        success: function(msg) { //데이터 받는 부분.response 
								     		alert(msg);
								        },
								        error: function(a, b) {
								            alert("Request: " + JSON.stringify(a));
								        }
								    });
								
								
								$('#cal_detail').fullCalendar('removeEvents',
										calEvent._id);
							}
						//사용자 나중에 분리할것임
						//사용자 서비스임! 지우고 인서트하고 한번에 함
						}else{
							//신청했는지 아닌지 구분 한 후에 자바에서 구분하자.
// 							$.ajax({
// 								        url: "insertdeleteCal", //"testAjax.jsp", 
// 								        type: "POST",
// 								        data: { //파라미터로 q
// 							                 memid : username,
// 							                 volunteerno : calEvent.title.split(".")[0]
// 							                 //title start end 
							                 
// 							              },
// 								        success: function(msg) { //데이터 받는 부분.response 
// 								     		alert("--"+msg+"--");
// 								        	if(msg=='delete'){
// 								        		alert("detetetete");
								 
// 								        		$(this).css('background-color', 'green');
// 								        	}else{
// 								        		$(this).css('background-color', 'red');
// 								        	}
								        
// 								        },
// 								        error: function(a, b) {
// 								            alert("Request: " + JSON.stringify(a));
// 								        }
// 								    });
							
							
							
// 							$(this).css('background-color', 'red');
						}
						
						
					},
					
					
					
					
					eventDrop: function(event, delta, revertFunc) {

				        alert(event.title + " was dropped on " + event.start.format());
						//드래그 하면 원래 것 지워버리고.. 새롭게 집어넣으면 됨.
						//지울 때 파라미터. seq
						 $.ajax({
								        url: "deleteCal", //"testAjax.jsp", 
								        type: "POST",
								        data: { //파라미터로 q
							                 //volunteertitle : calEvent.title,
							                 seq : event.title.split(".")[0]
							                 //title start end 
							              },
								        success: function(msg) { //데이터 받는 부분.response 
								     		alert(msg);
								        },
								        error: function(a, b) {
								            alert("Request: " + JSON.stringify(a));
								        }
								    });
						
						 $.ajax({
				              url: "insertCal", //"testAjax.jsp", 
				              type: "POST",
				              data: { //파라미터로 q
				            	  
				                  volunteertitle : event.title,
				                  volunteerstart : event.start.format(),
				                  volunteerend : event.end.format()
				                 //title start end 
				              },
				              dataType: "html",
				              success: function(msg) { //데이터 받는 부분.response
				                  alert(msg);
				                  if (title) {
										eventData = {
											title : msg+'.'+title,
											start : start,
											end : end,
											backgroundColor : 'green'
										};

										$('#cal_detail').fullCalendar('renderEvent',
												eventData, true); // stick? = true
									}
				              },
				              error: function(a, b) {
				                  alert("Request: " + JSON.stringify(a));
				              }
				          });
						
						
				        if (!confirm("Are you sure about this change?")) {
				            revertFunc();
				        }

				    },
					
// 					eventMouseover: function( calEvent, jsEvent, view ) { 
// 						alert('Event: ' + calEvent.title);
// 					},
					
					
					//사용자
					//사용자 색 바꾸기.
// 					 eventClick: function(calEvent, jsEvent, view) {

// 					        alert('Event: ' + calEvent.title);
// 					        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
// 					        alert('View: ' + view.name);

// 					        // change the border color just for fun
// 					        $(this).css('background-color', 'red');

// 					    },
					
					
					//관리자 기능.
					//인서트
				
					select : function(start, end, event) {// 캘린더 셀렉트 된 값을 컬럼에 표시...
					
						var name= $('#name').val();
						if(name=='admin'){
						var title = prompt('Event Title:'); //값 입력.
						var eventData;
// 						alert("selected from: " + start.format() + ", to: "
// 								+ end.format()); 
						 $.ajax({
				              url: "insertCal", //"testAjax.jsp", 
				              type: "POST",
				              data: { //파라미터로 q
				            	  
				                  volunteertitle : title,
				                  volunteerstart : start.format(),
				                  volunteerend : end.format()
				                 //title start end 
				              },
				              dataType: "html",
				              success: function(msg) { //데이터 받는 부분.response
				                  alert(msg);
				                  if (title) {
										eventData = {
											title : msg+'.'+title,
											start : start,
											end : end,
											backgroundColor : 'green'
										};

										$('#cal_detail').fullCalendar('renderEvent',
												eventData, true); // stick? = true
									}
				              },
				              error: function(a, b) {
				                  alert("Request: " + JSON.stringify(a));
				              }
				          });
						 $('#cal_detail').fullCalendar('unselect');
						}
						
					},
					
//					날짜 클릭
// 					dayClick: function(date, jsEvent, view) {
// 				        alert('Clicked on: ' + date.format());
// 				        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
// 				        alert('Current view: ' + view.name);
// 				        // change the day's background color just for fun
// 				        $(this).css('background-color', 'red');
// 				        alert("json"+array);

// 				    },
				    
				
					
					
					//둘다 필요한 부분.
					//처음에 디비에서 끌어오는 부분
				   
					//load 하는 부분 ! , db에서 읽어오면 된다.
// 					events : [
// 					{
// 						title : 'All Day Event',
// 						start : '2015-11-16',
// 						end : '2015-11-17'

// 					} ]
					
					events : caljson
				})
	//});
}
</script>
<div>
	<div id='cal_detail' >
	<input type="hidden" id="name" name="name" value="admin">
<%-- 	<input type="hidden" id="name" name="name" value="${pageContext.request.userPrincipal.name}"> --%>
	</div>
<!-- 	<div class="chart" id="container" ></div> -->
<!-- 		<div class="chart" id="container1"></div> -->
<!-- 		<div class="chart" id="container2"></div> -->
	
<table id='cal_table' class="table table-striped">
	<thead class="table table-striped">
		<tr>
		<th colspan="5"> 봉사 신청자 !</th>
		</tr>
		<tr>
			<td>신청 번호</td>
			<td>ID</td>
			<td>봉사 번호</td>
			<td>봉사 이름</td>
			<td>신청일</td>
		</tr>
	</thead>
	
	<!-- 리스트 받아서 td안에 뽑으믄 됩니다. -->
	<tbody>
		<c:forEach var="listv" items="${list }">
		<tr>
			<td>${listv.vapplyno }</td> 
			<td>${listv.memid }</td>
			<td>${listv.volunteerno }</td>
			<td>${listv.volunteertitle}</td>
			<td>${listv.vapplydate }</td>
		</tr>
		</c:forEach>
	</tbody>
	
	<tfoot>
		<tr>
			<td colspan="4"><input type="button" value="무슨버튼!"/></td>
		</tr>
	</tfoot>
</table>
</div>