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
    $('#container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'a'
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
                     alert(event.point.name);
                     location.href='chart1.jsp'
                  }
              }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [{
                name: 'M',
                y: 56.33
            }, {
                name: 'C',
                y: 24.03,
                sliced: true,
                selected: true
            }, {
                name: 'F',
                y: 10.38
            }, {
                name: 'S',
                y: 4.77
            }, {
                name: 'O',
                y: 0.91
            }, {
                name: 'z',
                y: 0.2
            }]
        }]
    });
});

$(function () {
    $('#container1').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'b'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Browser share',
            data: [
                ['Firefox', 45.0],
                ['IE', 26.8],
                {
                    name: 'Chrome',
                    y: 12.8,
                    sliced: true,
                    selected: true
                },
                ['Safari', 8.5],
                ['Opera', 6.2],
                ['Others', 0.7]
            ]
        }]
    });
});


$(function () {
    $('#chart1').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '이게 무슨 chart일까',
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
            name: 'Tokyo',
            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

        }, {
            name: 'New York',
            data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

        }, {
            name: 'London',
            data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

        }, {
            name: 'Berlin',
            data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

        }]
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
            alert("Request: " + JSON.stringify(a));
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
						right : 'month,agendaWeek,agendaDay'
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
				    editable : true,
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
					<img src="img/alrams.png" width="170px">
				</div>
				<div id="animated-example" class="form-group animated fadeInUp">
					<img src="img/newcontents.png" width="170px">
				</div>
				<div id="animated-example" class="form-group animated fadeInUp">
					<img src="img/newmember.png" width="170px">
				</div>
			</div>
			<div style="text-align: left; margin-left: 80px">
				<span class="label label-danger" style="margin-left: 20px;">New!</span>001/100
				<span class="label label-danger" style="margin-left: 75px;">New!</span>001/100
				<span class="label label-danger" style="margin-left: 75px;">New!</span>001/100
			</div>
		</div>
		<div style="width: 50%; float: left;">
			<div class="chart" id="chart1"></div>
		</div>
	</div>
	<div style="width: 100%; padding-left: 15px;"><!-- 두번째단 DIV  아마도 지우겠지...-->
		<div style="width: 25%; float: left; margin-top:40px; margin-bottom: 20px">
			<img src="img/adoption.png" width="100%">
		</div>
		<div style="width: 25%; float: left; margin-top:40px; margin-bottom: 20px">
			<img src="img/blacklist.png" width="100%">
		</div>
		<div style="width: 25%;  float: left; margin-top:40px; margin-bottom: 20px">
			<img src="img/employee.png" width="100%">
		</div>
		<div style="width: 25%;  float: left; margin-top:40px; margin-bottom: 20px">
			<img src="img/animalcare.png" width="100%">
		</div>
	</div> <!-- 두번째단 DIV -->
	<div style="width: 100%;"><!-- 세번째 DIV -->
		<div style="width: 34%; float: left; padding: 3px">
		    <table class="table table-hover">
		        <thead>
		            <tr>
		                <th>Row</th>
		                <th>First Name</th>
		                <th>Last Name</th>
		                <th>Email</th>
		            </tr>
		        </thead>
		        <tbody>
		            <tr>
		                <td>1</td>
		                <td>John</td>
		                <td>Carter</td>
		                <td>johncarter@mail.com</td>
		            </tr>
		            <tr>
		                <td>2</td>
		                <td>Peter</td>
		                <td>Parker</td>
		                <td>peterparker@mail.com</td>
		            </tr>
		            <tr>
		                <td>3</td>
		                <td>John</td>
		                <td>Rambo</td>
		                <td>johnrambo@mail.com</td>
		            </tr>
		            <tr>
		                <td>4</td>
		                <td>winni</td>
		                <td>Cho</td>
		                <td>whinewinni@mail.com</td>
		            </tr>
		            <tr>
		                <td>5</td>
		                <td>duck</td>
		                <td>park</td>
		                <td>duckduck@mail.com</td>
		            </tr>
		        </tbody>
		    </table>
		</div>
		<div style="width: 42%; float: left;">
			<div class="chart form-group" id="container" ></div>
		</div>
		<div style="width: 24%; float: left; margin: auto">
<!-- 			<img src="img/puppy2.png" width="100%"> -->
			<div id='cal_detail' ></div>
		</div>
	</div> <!-- 세번째 DIV -->
</div><!-- 전ㅊㅔdiv-->




<!-- <div id="wrap" class="form-inline" style="clear: both;">

<div class="chart form-group" id="container1"></div> -->

</div>
