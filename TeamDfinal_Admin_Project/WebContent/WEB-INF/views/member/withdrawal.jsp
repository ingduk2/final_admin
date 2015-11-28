<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
	진짜 탈퇴하실거? <br />
	<input type="button" value="ㅇㅅㅇ ㅂㅂ" onclick="goUrl('deleteMember')">
<%-- 	<c:url var="logout" value="j_spring_security_logout"/> --%>
<%-- 	<a type="button" href="deleteMember" onclick="location.href='${logout}';" target="_blank">ㅇㅅㅇ</a> --%>
	<input type="button" value="사실 아님 데헷" onclick="goUrl('selectoneMember')">
</div>