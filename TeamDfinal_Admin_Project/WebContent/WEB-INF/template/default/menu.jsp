<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>

<style>
li { list-style: none}
.faq {
 width: 80%;
 margin: auto;
 height: 100%;
 margin-top: 40px
}

.faq h4 {
 border-top: 1px solid #ddd
}

.faq h4 a {
  display: inline-block;
 padding: 15px;
 font-size: 14px;
 color: white;
 text-decoration: none
}

.faq h4 a:hover {
 color: white;
}

.faq div {
  padding: 0 15px 15px;
 	line-height: 20px
}
.subtabmenu{
	width: 110px
}
.subtabmenu>a{
	text-decoration:none;
	color: white;
}
.subtabmenu>a:hover{
	color: white;
	font-weight: bold;
	background-color: red;border-radius: 5px; width: 100px;
}

#clock{
	background-color: black;
}
/*.on{ background: pink}*/
</style>
<script type="text/javascript">
 	$(function() {
		//var $trigger2 = $(".faq > h4 > a"); //faq자식 중 h4 의 a 선택
		var $trigger2 = $(".faq > h4 > a"); //faq자식 중 h4 의 a 선택
		
		var $content2 = $(".faq > div");
		var $content3 = $(".faq > div > a");
		$content2.hide();
		$trigger2.parent().first().css("borderTop","none");
				  //a의 부모 h4
		var $tr=$(".faq");
				  
		$trigger2.mouseover(function() {
			var $this= $(this).parent(); //a의 부모 h4
			if($this.next().is(":hidden")){ //hidden일 때만.
				$trigger2.each(function(i){
					$this.addClass("on");
					$this.next().eq(i).slideDown(300);
				});
			}
			/* else{ //no hidden
				$trigger2.click(function() {
					var $this= $(this).parent(); //a의 부모 h4
					$trigger2.parent().removeClass("on");
					$content2.slideUp(300);
				});
			} */
		})
		
		
		var $trigger3 = $(".faq > div");
		$trigger3.mouseleave(function(){
			$content2.slideUp(300);
		});
		
		
				
	});
 	
 	
 	$(function () {

 	    /**
 	     * Get the current time
 	     */
 	    function getNow() {
 	        var now = new Date();

 	        return {
 	            hours: now.getHours() + now.getMinutes() / 60,
 	            minutes: now.getMinutes() * 12 / 60 + now.getSeconds() * 12 / 3600,
 	            seconds: now.getSeconds() * 12 / 60
 	        };
 	    }

 	    /**
 	     * Pad numbers
 	     */
 	    function pad(number, length) {
 	        // Create an array of the remaining length + 1 and join it with 0's
 	        return new Array((length || 2) + 1 - String(number).length).join(0) + number;
 	    }

 	    var now = getNow();

 	    // Create the chart
 	    $('#clock').highcharts({

 	        chart: {
 	            type: 'gauge',
 	            plotBackgroundColor: null,
 	            plotBackgroundImage: null,
 	            plotBorderWidth: 0,
 	            plotShadow: false,
 	            height: 200
 	        },

 	        credits: {
 	            enabled: false
 	        },

 	        title: {
 	            text: ' '
 	        },

 	        pane: {
 	            background: [{
 	                // default background
 	            }, {
 	                // reflex for supported browsers
 	                backgroundColor: Highcharts.svg ? {
 	                    radialGradient: {
 	                        cx: 0.5,
 	                        cy: -0.4,
 	                        r: 1.9
 	                    },
 	                    stops: [
 	                        [0.5, 'rgba(255, 255, 255, 0.2)'],
 	                        [0.5, 'rgba(200, 200, 200, 0.2)']
 	                    ]
 	                } : null
 	            }]
 	        },

 	        yAxis: {
 	            labels: {
 	                distance: -20
 	            },
 	            min: 0,
 	            max: 12,
 	            lineWidth: 0,
 	            showFirstLabel: false,

 	            minorTickInterval: 'auto',
 	            minorTickWidth: 1,
 	            minorTickLength: 5,
 	            minorTickPosition: 'inside',
 	            minorGridLineWidth: 0,
 	            minorTickColor: '#666',

 	            tickInterval: 1,
 	            tickWidth: 2,
 	            tickPosition: 'inside',
 	            tickLength: 10,
 	            tickColor: '#666',
 	            title: {
 	                text: 'Powered by<br/>Highcharts',
 	                style: {
 	                    color: '#BBB',
 	                    fontWeight: 'normal',
 	                    fontSize: '8px',
 	                    lineHeight: '10px'
 	                },
 	                y: 10
 	            }
 	        },

 	        tooltip: {
 	            formatter: function () {
 	                return this.series.chart.tooltipText;
 	            }
 	        },

 	        series: [{
 	            data: [{
 	                id: 'hour',
 	                y: now.hours,
 	                dial: {
 	                    radius: '60%',
 	                    baseWidth: 4,
 	                    baseLength: '95%',
 	                    rearLength: 0
 	                }
 	            }, {
 	                id: 'minute',
 	                y: now.minutes,
 	                dial: {
 	                    baseLength: '95%',
 	                    rearLength: 0
 	                }
 	            }, {
 	                id: 'second',
 	                y: now.seconds,
 	                dial: {
 	                    radius: '100%',
 	                    baseWidth: 1,
 	                    rearLength: '20%'
 	                }
 	            }],
 	            animation: false,
 	            dataLabels: {
 	                enabled: false
 	            }
 	        }]
 	    },

 	        // Move
 	        function (chart) {
 	            setInterval(function () {

 	                now = getNow();

 	                var hour = chart.get('hour'),
 	                    minute = chart.get('minute'),
 	                    second = chart.get('second'),
 	                    // run animation unless we're wrapping around from 59 to 0
 	                    animation = now.seconds === 0 ?
 	                        false :
 	                        {
 	                            easing: 'easeOutElastic'
 	                        };

 	                // Cache the tooltip text
 	                chart.tooltipText =
 	                    pad(Math.floor(now.hours), 2) + ':' +
 	                    pad(Math.floor(now.minutes * 5), 2) + ':' +
 	                    pad(now.seconds * 5, 2);

 	                hour.update(now.hours, true, animation);
 	                minute.update(now.minutes, true, animation);
 	                second.update(now.seconds, true, animation);

 	            }, 1000);

 	        });
 	});

 	// Extend jQuery with some easing (copied from jQuery UI)
 	$.extend($.easing, {
 	    /* eslint-disable */
 	    easeOutElastic: function (x, t, b, c, d) {
 	        var s=1.70158;var p=0;var a=c;
 	        if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
 	        if (a < Math.abs(c)) { a=c; var s=p/4; }
 	        else var s = p/(2*Math.PI) * Math.asin (c/a);
 	        return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
 	    }
 	    /* eslint-enable */
 	});
 	
</script>

<div id="clock"></div>
 <div class="faq">

  <h4>
   <a href="formMember">회원 관리</a>
  </h4>

<!--   <div class="subtabmenu"> -->
<!--   	 <a href="formMember">강제 탈퇴</a><br />  -->
<!--   </div> -->


  <h4>
   <a href="formBoard">게시물 관리</a>
  </h4>
<!--     <div class="subtabmenu"> -->
<!-- 	  	 <a href="">블록 게시물</a><br /> -->
<!-- 	  	 <a href="">게시물 복구</a><br />  -->
<!-- 	  	 <a href="">강제 삭제</a><br />  -->
<!-- 	  	 <a href="">강제 이동</a><br />  -->
<!--  	 </div> -->
  
  <h4>
   <a href="selectallAdopt">입양 신청 관리</a>
  </h4>
<!--     <div> -->
<!--   	 <a href="selectallAdopt">입양 신청자</a><br /> -->
<!--   	 <a href="formCal">봉사 신청자</a><br />  -->
<!--   </div> -->

  
  <h4>
   <a href="formCal">봉사 신청 관리</a>
  </h4>

<!--     <div> -->
<!--   	 <a href="selectallAdopt">입양 신청자</a><br /> -->
<!--   	 <a href="formCal">봉사 신청자</a><br />  -->
<!--   </div> -->

  
  <h4>
   <a href="formCenter">센터 관리</a>
  </h4>

<!--     <div> -->
<!--   	 <a href="formCenter">센터 입력</a><br /> -->
<!--   	 <a href="">센터 수정</a><br /> -->
<!--   	 <a href="">센터 삭제</a><br />   -->
<!--   </div> -->



	<h4>
   <a href="testani">동물 관리</a>
  </h4>

<!--     <div> -->
<!--   	 <a href="testani">animal</a><br />   -->
<!--   </div> -->
  

  	<h4>
   <a href="formEmployee">직원 관리</a>
  </h4>

<!--     <div> -->
<!--   	 <a href="selectallEmployee">직원 관리</a><br />   -->
<!--   </div> -->

  
  
	<h4>
   <a href="formSurvey">설문조사 관리</a>
  </h4>


  
  	<h4>
  	
<c:if test="${pageContext.request.userPrincipal.name == null}">
		<a href="#">동물관리 현황</a>
</c:if>
					
<c:if test="${pageContext.request.userPrincipal.name != null}">
<c:if test="${pageContext.request.userPrincipal.name=='admin'}">
<a href="selectallAdminam">동물관리 현황</a>
</c:if>
<c:if test="${pageContext.request.userPrincipal.name!='admin'}">
<a href="selectallanimalmanage?mid=${pageContext.request.userPrincipal.name }">동물관리 현황</a>
</c:if>
</c:if>
   
  </h4>
  


<!--     <div> -->
<!--   	 <a href="selectallEmployee">직원 관리</a><br />   -->
<!--   </div> -->

 </div>

