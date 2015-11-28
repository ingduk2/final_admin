<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!-- 
	※ 변경 사항 ※
	- 상단에 공간 띄우기 추가
 -->

<style>
	table th {
		font-weight: bold;
		color: black;
		background-color: #90ee90;
		opacity: 0.4;
		font: bold;
		text-align: center;
		border-bottom: 1px solid #f0fff0;
		width: 150px;
	}
	/* CSS used here will be applied after bootstrap.css */
	/* bootstrap Navigation Overriding */
	.navbar {
		background: #FFFFFF;
	}
	.navbar .navbar-center {
		display: inline-block;
		float: none;
		vertical-align: top;
		text-align: center;
	}
	#page_footer {
		height: 60px;
		background: #f5f5f5;
	}
	.footer_text {
		margin: 20px 0;
		color: #777;
	}
	
/* 이미지용 Css */
/* 메뉴바용스타일 */
#menubar{
	background-image: url('img/mypagemenu.png');
	background-repeat:no-repeat;
	height: 400px;
	text-align: left;
/* 	 -webkit-text-stroke: 1px black; */
	 -webkit-text-fill-color: white;	
}
.list-group-item-success{
	background-color: transparent;
/* 	font-weight:bold;  */
	font-size: 15px
}
#aa{
	color : white;
	padding-top: 140px;
	margin-left: 50px;	
}
.list-group-item{
	border: 1px solid transparent;
	width: 150px
}
a:link {
    text-decoration: none;
}
#id{
	height: 100px;
	width: 100px;
}
.list-group>li>a{
	color: white;
}
.panel{
	width: 450px
}
.panel-heading{
	height: 130px;
}
.panel-default>.panel-heading, .panel-footer{
	background-color: white;
}
.panel-body{
	padding: 3px;
	background-color: #E0EEEE
}


</style>

<div>
			<!--MenuBar_회원정보보기/수정/탈퇴/내가쓴글-->
	<div id="menubar">
	  <div id="aa">
		<ul class="list-group">
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-info-sign"></span><a href="selectoneMember"> 정보 보기</a>
		  </li>
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-cog"></span><a href="updateformMember"> 정보 수정</a>
		  </li>
		  	
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-user"></span><a href="selectAllMyActivity"> 나의 활동</a>
		  </li>
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-trash"></span><a href="formWithdrawal"> 탈 　　퇴</a>
		  </li>
		</ul>
	  </div>
	</div>

	
	<!-- 공간 띄우기 용 -->
	<table><tr height="50px"><td></td></tr></table>
		
	<div class="row">
	<div class="col-md-4"><!-- 위치조정용 --></div>
	<div class="col-md-6">
	  <div class="panel panel-default">
	    <div class="panel-heading">
			<div style="position: relative; right: -150px"><!-- 이미지넣을 div -->
				<img src="img/${mvo.mimg }" class="img-circle" width="100px" height="100px">
			</div>
			<div style="position:relative; top:-70px; right: 0px"><!-- di/name/birth -->
				<h3>${mvo.mid }</h3>
				<h4>${mvo.mname }<small>${mvo.mbirth }</small></h4>
			</div>
	    </div>
	    <div class="panel-body">
	    	<!-- 인사말들어올위치입니다. -->
	    	${mvo.mintro }
	    </div>
	    <div class="panel-footer">
	    	<!-- 주소와 전화번호가 들어올 위치입니다. -->
	    	${mvo.mroad }<p>
	    	${mvo.mtel }
	    </div>
	  </div>
	</div>
	<div class="col-md-3"><!-- 위치조정용 --></div>
	</div>	
		

		<table><tr height="30px"><td></td></tr></table>
	</div>