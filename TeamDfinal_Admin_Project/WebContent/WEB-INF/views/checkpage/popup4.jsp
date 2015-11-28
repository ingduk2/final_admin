<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TeamD</title>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style type="text/css">
	#allbg{
		background-image: url('http://cfile25.uf.tistory.com/image/203F8F335021021C1996EB');
		background-repeat: no-repeat;
		width: 100%;
		height: 100%;
		background-size:100% 100%;
	}
	.jumbotron{
		margin: 10px;
		border-radius: 5px;
		background-color: rgba( 208, 210, 208, 0.9 );
		padding: 30px;
		font-size:12px;
	}
	.h1, .h2, .h3, h1, h2, h3{
		margin-top: 3px;
		margin-bottom: 3px;
	}
	hr{
		margin-top: 0px;
		margin-bottom: 3px;
		border: 0;
		border-top: 1px solid #eee;
	}
	.table {
		width: 80%;
		max-width: 100%;
		margin-bottom: 5px;
	}
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
		padding: 3px;
	}
	ol, ul{
		margin-bottom: 1px
	}
</style>
</head>
<body>
<div id="allbg">
	<div class="jumbotron">
	   <h3>TNR<small>여러분의 소중한 의견을 기다립니다.</small></h3>
	   <hr>
	   <font size="3px">&nbsp;
	  TNR(Trap-Neuter-Release) 이란 길고양이를 포획한 후 중성화 수술을 시켜 포획한 장소에 다시 방사하는 것으로, 인도적인 차원에서 길고양이의 개체 수를 조절할 수 있는 방법이다</font>
	   <table class="table">
	   	<tr>
<!-- 	   		<td>구분</td><td>내장형</td><td>외장형, 인식표형</td> -->
	   	</tr>
	   	<tr>
	   		<td>장점</td>
	   		<td>
	   			<ul>
	   				<li>중성화가 된 길고양이는 발정음 소리를 내지 않아 소음이 줄어든다</li>
	   				<li>타지역 고양이의 유입을 막아준다</li>
	   				<li>적절한 길고양이의 개체수 유지는 쥐의 과도한 번식도 예방한다</li>
	   			</ul>
	   		</td>
<!-- 	   		<td> -->
<!-- 	   			<ul> -->
<!-- 	   				<li>부작용 없음</li> -->
<!-- 	   				<li>처치 간단</li> -->
<!-- 	   			</ul> -->
<!-- 	   		</td> -->
	   	</tr>
	   	<tr>
	   		<td>단점</td>
	   		<td>
	   			<ul>
	   				<li>중성화 수술 비용이 마리당 14만원이 발생한다</li>
	   				<li>인위적인 개체수 조절은 생태계 교란을 야기한다</li>
	   			</ul>
	   		</td>
<!-- 	   		<td> -->
<!-- 	   			<ul> -->
<!-- 	   				<li>의도적, 우발적 파손 용이</li> -->
<!-- 	   				<li>제거 후 유기 시 소유자 확인 불가</li> -->
<!-- 	   			</ul> -->
<!-- 	   		</td> -->
	   	</tr>
	   </table>
	   
	   <p>
	   <font size="3px">&nbsp;. 현재 서울에만 20만 마리의 길고양이가 있는 것으로 추정됩니다. 중성화 수술 비용도 마리당 14만 원 정도로 적지 않은데요. 늘어나는 길고양이, 어떻게 해결해야 할까요?</font>
	   <p><p><p>
	   
	    <div class="radio">
	      <label><input type="radio" name="optradio">일정 개체수를 넘어설 경우 포획해서 안락사시킨다</label>
	    </div>
	    <div class="radio">
	      <label><input type="radio" name="optradio">중성화 수술을 통해 장기적으로 개체수를 조절한다</label>
	    </div>
	    <div class="radio">
	      <label><input type="radio" name="optradio">기타</label>
	    </div>
	    
	    <span style="color: red">
	    	<strong>※ 본 설문조사는 로그인이 필요없는 열린방식으로 진행하고,<br>
	    	동일IP에서 중복투표를 방지하여 유의성을 제고합니다.</strong> 
	    </span>
	    <button type="button" class="btn btn-default btn-sm" style="margin-bottom: -15px; margin-left: 90%">투표하기</button>
	    
	 </div>
</div>
</body>
</html>