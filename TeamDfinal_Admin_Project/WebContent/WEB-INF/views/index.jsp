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
<!-- <script src="//code.jquery.com/jquery-1.11.3.min.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
<script
	src='http://fullcalendar.io/js/fullcalendar-2.3.1/fullcalendar.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.3.1/lang-all.js'></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<style>
#cal_detail{width:300px; height:300px; }
.animated { 
    -webkit-animation-duration: 1s; 
    animation-duration: 1s; 
    -webkit-animation-fill-mode: both; 
    animation-fill-mode: both; 
    -webkit-animation-timing-function: ease-in; 
    animation-timing-function: ease-in; 
} 
@-webkit-keyframes fadeInUp { 
    0% { 
        opacity: 0; 
        -webkit-transform: translateY(20px); 
    } 
    100% { 
        opacity: 1; 
        -webkit-transform: translateY(0); 
    } 
} 
@keyframes fadeInUp { 
    0% { 
        opacity: 0; 
        transform: translateY(20px); 
    } 
    100% { 
        opacity: 1; 
        transform: translateY(0); 
    } 
} 
.fadeInUp { 
    -webkit-animation-name: fadeInUp; 
    animation-name: fadeInUp; 
}
</style>
<script>
$(function () {
	
	$.ajax({
        url: "selectallam", //"testAjax.jsp", 
        type: "POST",
        success: function(msg1) { //데이터 받는 부분.response
        	//alert(msg1);
            var json1=JSON.parse(msg1);
        	//alert(json1);
            $('#container').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: '동물 배정 현황'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        },
                         events:{
                          click: function (event, i) {
                            // alert(event.point.name);
                             location.href='testani'
                          }
                      }
                    }
                },
                series: [{
                    name: 'Brands',
                    colorByPoint: true,
                    data: json1
                }]
            });
        	
        	
        },
        error: function(a, b) {
           // alert("Request: " + JSON.stringify(a));
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
	
    
});




$(function () {
	
	$.ajax({
        url: "monthajax", //"testAjax.jsp", 
        type: "POST",
        success: function(json) { //데이터 받는 부분.response 
          
       // alert(json);
     	var a=json.split("/");
        var month0=JSON.parse(a[0]);
        var month3=JSON.parse(a[1]);
        //alert('aa');
        var month4=JSON.parse(a[2]);
        var month5=JSON.parse(a[3]);
//         alert(month0);
//         alert(month3);
//         alert(month4);
//         alert(month5);
        
        
        $('#chart1').highcharts({
            chart: {
                type: 'column'
            },

            title: {
               	text : " ",
                align: 'right',
                x: -100,
                verticalAlign: 'bottom',
                y: -120
            },
    	    legend: {
    	            align: 'right',
    	            verticalAlign: 'top',
    	            layout: 'vertical',
    	            x: 0,
    	            y: 30
            },
            xAxis: {
                categories: [
                    'Jan',
                    'Feb',
                    'Mar',
                    'Apr',
                    'May',
                    'Jun',
                    'Jul',
                    'Aug',
                    'Sep',
                    'Oct',
                    'Nov',
                    'Dec'
                ],
                crosshair: true
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Rainfall (mm)'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [{
                name: '보호',
//                 data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
    			data: month0
            }, {
                name: '실종',
//                 data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]
                data: month3
            }, {
                name: '목격',
//                 data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]
                data: month4
            }, {
                name: '개인보호',
//                 data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]
                data: month5
            }]
        });
        
        
        },
        error: function(a, b) {
           // alert("Request: " + JSON.stringify(a));
            
        }
    });
	

});




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
            //alert("Request: " + JSON.stringify(a));
            
        }
    });
	 
	 
	 
});

function callendar(){
		
		var currentLangCode = 'ko';
		$('#cal_detail').fullCalendar('destroy');
		$('#cal_detail').fullCalendar({
					
					//lang: currentLangCode,
					dragable : false, //드래그앤 드랍 옵션
					timeFormat : 'hh:mm', //시간 포멧
					// lang: 'ko',  //언어타입
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month'
					},
					
					
					// 클릭이벤트 - 삭제
					//관리자용+사용자용
					eventClick : function(calEvent, jsEvent, view) {
						
						
						
						
					},
					
					
					
					//관리자 기능.
					//인서트
					defaultView : 'month',//기본 뷰 - 옵션   //첫 페이지 기본 뷰 옵션
					editable : false, //에디터 가능 옵션
					selectable : true,
					selectHelper : true,
					select : function(start, end, event) {// 캘린더 셀렉트 된 값을 컬럼에 표시...
					
					},
					
					//둘다 필요한 부분.
					//처음에 디비에서 끌어오는 부분
				  
					eventLimit : true,
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

<style>
#chart1{
	width: 100%;
	height: 200px
}
</style>


<div style="width: 100%; margin-top: 50px;"> <!-- 전ㅊㅔdiv-->
	<div style="width: 100%; text-align: center;">	<!-- 첫단div -->
		<div style="width: 50%; float: left;">
			<div style="width: 100%; margin:auto;" class="form-inline">
				<div id="animated-example" class="form-group animated fadeInUp">
					<img src="img/alrams.png" width="170px"><p>
					<span class="label label-danger">New!</span>&nbsp;${mainmembercnt}
				</div>
				<div id="animated-example" class="form-group animated fadeInUp">
					<img src="img/newcontents.png" width="170px"><p>
					<span class="label label-danger">New!</span>&nbsp;${mainboardcnt}
				</div>
				<div id="animated-example" class="form-group animated fadeInUp">
					<img src="img/newmember.png" width="170px"><p>
					<span class="label label-danger">New!</span>&nbsp;${mainanimalcnt}
				</div>
			</div>
		</div>
		<div style="width: 50%; float: left;">
			<div class="chart" id="chart1"></div>
		</div>
	</div>
	<div style="width: 100%; padding-left: 15px;"><!-- 두번째단 DIV  아마도 지우겠지...-->
		<div style="width: 25%; float: left; margin-top:40px; margin-bottom: 20px">
			<a href="selectallAdopt"><img src="img/adoption.png" width="100%"></a>
		</div>
		<div style="width: 25%; float: left; margin-top:40px; margin-bottom: 20px">
			<a href="#"><img src="img/blacklist.png" width="100%"></a>
		</div>
		<div style="width: 25%;  float: left; margin-top:40px; margin-bottom: 20px">
			<a href="formEmployee"><img src="img/employee.png" width="100%"></a>
		</div>
		<div style="width: 25%;  float: left; margin-top:40px; margin-bottom: 20px">
			<a href="testani"><img src="img/animalcare.png" width="100%"></a>
		</div>
	</div> <!-- 두번째단 DIV -->
	<div style="width: 100%;"><!-- 세번째 DIV -->
		<div style="width: 34%; float: left; padding: 3px">
		    <table class="table table-hover">
		        <thead>
		        	<tr><td><h2>신입 직원</h2></td></tr>
		            <tr>
		                <th>ID</th>
		                <th>Name</th>
		                <th>Email</th>
		            </tr>
		        </thead>
		        <tbody>
		        <c:forEach var="listv" items="${list }">
		            <tr>
		                <td>${listv.mid }</td>
		                <td>${listv.mname }</td>
		                <td>${listv.memail }</td>      
		            </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</div>
		<div style="width: 35%; float: left;">
			<div class="chart form-group" id="container" ></div>
		</div>
		<div style="width: 22%; float: left; margin: auto">
<!-- 			<img src="img/puppy2.png" width="100%"> -->
			<div id='cal_detail' ></div>
		</div>
	</div> <!-- 세번째 DIV -->
</div><!-- 전ㅊㅔdiv-->




<!-- <div id="wrap" class="form-inline" style="clear: both;">

<div class="chart form-group" id="container1"></div> -->

</div>
