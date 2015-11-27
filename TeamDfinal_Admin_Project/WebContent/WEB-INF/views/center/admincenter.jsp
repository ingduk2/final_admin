<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=cafcd4fae4be10d7ffdde1bc7cadf004&libraries=services"></script>
<style>
#center_insert{
	float: left;
}
#center_list{
	float: left;
	margin-left: 30px;
	width : 60%;
}
</style>
<script>

$(function () {
    $('#center_chart').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Browser market shares at a specific website, 2014'
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

$(function() {
	 var mapContainer = document.getElementById('map'), // 지도를 표시할 div
     mapOption = {
         center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
         level: 5 // 지도의 확대 레벨
     };

 //지도를 미리 생성
 var map = new daum.maps.Map(mapContainer, mapOption);
 //주소-좌표 변환 객체를 생성
 var geocoder = new daum.maps.services.Geocoder();
 //마커를 미리 생성
 var marker = new daum.maps.Marker({
     position: new daum.maps.LatLng(37.537187, 127.005476),
     map: map
 });

 $('#button').click(function() {
	 new daum.Postcode({
	        oncomplete: function(data) {
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullAddr = data.address; // 최종 주소 변수
	            var extraAddr = ''; // 조합형 주소 변수

	            // 기본 주소가 도로명 타입일때 조합한다.
	            if(data.addressType === 'R'){
	                //법정동명이 있을 경우 추가한다.
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== ''){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }

	            // 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("caddr").value = fullAddr;
	            // 주소로 좌표를 검색
	            geocoder.addr2coord(data.address, function(status, result) {
	                // 정상적으로 검색이 완료됐으면
	                if (status === daum.maps.services.Status.OK) {
	                    // 해당 주소에 대한 좌표를 받아서
	                    alert(result.addr[0].lat+','+result.addr[0].lng);
	                    $('#code').val(result.addr[0].lat+','+result.addr[0].lng);
	                    var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	                    // 지도를 보여준다.
	                    mapContainer.style.display = "block";
	                    map.relayout();
	                    // 지도 중심을 변경한다.
	                    map.setCenter(coords);
	                    // 마커를 결과값으로 받은 위치로 옮긴다.
	                    marker.setPosition(coords)
	                }
	            });
	        }
	    }).open();
});
 
});

function sample5_execDaumPostcode() {
   
}
</script>

<div id="center_insert">
<form method="post" action="insertCenter">
	<table>
	<tr>
	<td>
	<table>
	
		<thead>
			<tr>
				<td colspan="2">센터 등록!</td>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td colspan="2">센터 이름 : <input type="text" name="cname" id="cname">
			</tr>
			<tr>
				<td>센터 주소 : <input type="text" size="50" name="caddr" id="caddr" placeholder="주소"></td>
				<td><input type="button" id="button" value="주소 검색"><br></td>
			</tr>
		</tbody>
		
		<tfoot>
			<tr>
				<td><input type="text" id="code" name="cxy"></td>
				<td colspan="2"><input type="submit" size="20" value="등록!"></td>
			</tr>
		</tfoot>
		
	</table>
	</td>
	<td>
	<div id="center_chart"></div>
	</td>
	</tr>
	
	</table>
	
	
</form>
</div>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
<div id="center_list">
	<table class="table table-striped">
		<thead class="table table-striped">
			<tr>
				<th colspan="5">List</th>
			</tr>
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>주소</td>
				<td>좌표</td>
				
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="listv" items="${list }">
				<tr>
					<td>${listv.cnum }</td>
					<td>${listv.cname }</td>
					<td>${listv.caddr }</td>
					<td>${listv.cxy }</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
</div>




