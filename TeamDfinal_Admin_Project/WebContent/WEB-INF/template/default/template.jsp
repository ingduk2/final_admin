<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TeamD_Admin</title>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  
  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!-- 	Css  -->
	
<style>
	a{
		text-decoration: none
	}
	body{
		margin: 0px;
		padding : 0px;
		height : 100%;
		width: 100%;
		background-color: black	;
		/* overflow: hidden; */
	}
	.page{ min-height : 100%; }/* position: relative; */
	.header{ width:100%; text-align:center;}
	.content{width: 100%}/* overflow: hidden; */

	
	.footer{width:100%; background: black; color: white; clear: both;}
	.body{width:100%;}
	
	#head_image{
		height:200px;
		width:300px;
	}
	
	/*메인 wrap */	
	/* #wrap{
		
		padding: 20px 30px 0 20px;
		
	} */
	/*메인 차트테이블 padding*/
/* 	#chart_table tr td{
		padding: 20px 20px 20px 20px;
	} */
	
	/*메인 테이블*/
/* 	#list_table{
	margin-top: 30px;
	} */
	/*메인 테이블*/
/*  	#list_table tr td{
 	padding: 0px 0px 0px 0px; 
	}  */
	
	/*메인 차트 사이즈!*/
/* 	.chart{
		width:18%;
		height:40%;
	} */
	h4>a:Hover{
		color: white;
		font-weight:bold;
		background-color: red;
		border-radius: 8px;
		width: 150px;
		height: 45px
	}
</style>	
</head>
<body>
	
	<div class="page">
		<tiles:insertAttribute name="header" flush="true"/>
		<div id="content" style="clear: both;">
			<div style="width: 15%; float: left;">
				<tiles:insertAttribute name="menu" flush="true"/>
			</div>
			<div style="width: 85%; float:right; background-color: white;">
				<tiles:insertAttribute name="body" flush="true"/>
			</div>
		</div>		
		<tiles:insertAttribute name="footer" flush="true"/>
	</div>
</body>
</html>