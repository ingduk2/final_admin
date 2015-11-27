<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=cafcd4fae4be10d7ffdde1bc7cadf004"></script>
<style>
	#map{
	margin : auto;
	width:600px;
	height:400px;
	}
</style>
<script>
$(document).ready(function() {
	
	geoFindMe();
});

function loadMap(a,b){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
		//검색하면 시작위치 잡아줘야 중간으로 오게 됨!
		//아니면 기본 이사람의 위치를 찍어주어야 함.
        center: new daum.maps.LatLng(a,b), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

//마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(a,b); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);


var sv=$('#sv').val();
var st=$('#st').val();

var array= new Array();
$.ajax({
// 	url:"/zdaum_map/json",
	url:"selectalljsonCenter",
	type:"GET",
	 data: { //파라미터로 q
         //volunteertitle : calEvent.title,
        searchValue : sv,
        searchType : st
      },
	success: function(json) {
		alert("ajax");
		alert(json);
		var data=JSON.parse(json);
		//data=json.aa;
		
		//$('#res').html(data);
		//alert(data.aa[0].title);
		
		$.each(data.aa,function(idx,item){
			//alert(item.title);
			print +="<h1>["+item.title+"]</h1><p> name:"+item.latlng+"</p>";
			
			var split=item.latlng.split(',');
			item.latlng=new daum.maps.LatLng(split[0],split[1]);
			
		});
		
		$('#res1').html(print);
		
		var positions=data.aa;
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new daum.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
		
	}
	
});


//var lat=new daum.maps.LatLng(33.450705, 126.570677);
// 마커를 표시할 위치와 title 객체 배열입니다 
//이 부분을 동적으로 바꿔서 굴려야 한다. ...
//음.. JsON 형식과 비슷하기 때문에 아..
//string형을 var로 받는데 모양을 이렇게 받아서 
//var jsonInfo = JSON.parse(jsonStr);
//json.parse를 사용하거ㅏㄴ
//eval을 사용해서 넣어주면 될 것 같다. ㅋㅋㅋㅋ
//이거 말고 그냥 리스트에 또 뷰를 뿌리는거는 어떻게 해야하나
//걔를 Ajax로 사용하면 존나 귀찮은데

//음 제이슨 데이터를 만들어서 !!
	
}

function geoFindMe() {
	  var output = document.getElementById("out");

	  if (!navigator.geolocation){
	    output.innerHTML = "<p>사용자의 브라우저는 지오로케이션을 지원하지 않습니다.</p>";
	    return;
	  }

	  navigator.geolocation.getCurrentPosition(function(position) {
		  do_something(position.coords.latitude, position.coords.longitude);
		});
	  
	  function success(position) {
	    var latitude  = position.coords.latitude;
	    var longitude = position.coords.longitude;

	    output.innerHTML = '<p>위도 : ' + latitude + '° <br>경도 : ' + longitude + '°</p>';
	    var a=latitude;
	    var b=longitude;
	    loadMap(a, b);
// 	    var img = new Image();
// 	    img.src = "http://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";

// 	    output.appendChild(img);
	  };

	  function error() {
	    output.innerHTML = "사용자의 위치를 찾을 수 없습니다.";
	  };

	  output.innerHTML = "<p>Locating…</p>";

	  navigator.geolocation.getCurrentPosition(success, error);
	}



</script>

<input type="hidden" id="v" value="33.450705,126.570677"><%-- <input type="text" id="v" value="${json}"> --%>
<input type="text" id="sv" value="${ sv}">
<input type="text" id="st" value="${ st}">
<!--리스트를 ${araymap} 형식으로 받아서. 하묜 안되내...
스크립트니 ajax로 db에서 빼올지.. 데이터 만들어서 노가다로 해올지..  -->
<div id="map"></div>
<!-- <input type="text" id="mapmap"> -->
<!-- <div id="res1"></div> -->
<!-- <p><button onclick="geoFindMe()">현 위치</button></p> -->
<div id="out"></div>
<div>
	<table>
		<thead>
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
		<form action="" method="post">
	<table><!-- 넘버링이랑, 검색, 글쓰기버튼,  --> 
		<thead> 
			<tr> <td colspan="5"> <!-- 페이징작업부분입니다. --> Numbering  </td> </tr>
		</thead>
		<tbody>
			<tr>  
				<td> &nbsp;
						<!--  다이나믹쿼리로 검색기능 추가할 부분 -->
				      <select name="searchType" class="form-control input-sm" id="sel1">
					        <option value="1">센터 이름</option>
					        <option value="2">센터 주소</option>
					        
				      </select>&nbsp;
				</td>
				<td>&nbsp;
					<input class="form-control input-sm" type="text" name="searchValue" />&nbsp;
				</td>
				<td>&nbsp;
				 <!--  검색버튼, 파라미터값넘길부분  -->
					<button type="submit" class="btn btn-default btn-sm">검색</button> &nbsp;
				</td>  
			</tr>
		</tbody>
	</table>
	</form>
	
</div>





</body>
</html>