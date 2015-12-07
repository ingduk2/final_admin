<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	※ 변경 사항 ※
	- 메뉴바와 로그인 폼 사이 공간 띄움
 -->

<style>
	#my_container {
	  -webkit-font-smoothing: antialiased;
	  font: normal 14px Roboto,arial,sans-serif;
	}
	.form-login {
	    background-color: #FFCCCE;
	    padding-top: 10px;
	    padding-bottom: 20px;
	    padding-left: 20px;
	    padding-right: 20px;
	    border-radius: 15px;
	    border-color:#d2d2d2;
	    border-width: 5px;
	    box-shadow:0 1px 0 #cfcfcf;
	    margin-bottom: 200px
	}
	
	h1 { 
	 border:0 solid #fff; 
	 border-bottom-width:1px;
	 padding-bottom:10px;
	 text-align: center;
	}
	
	.form-control {
	    border-radius: 10px;
	}
	
	.wrapper {
	    text-align: center;
	}
	.form-login{
		background-color: #FFCCCE;
		
	}
	
/* 	Modal용 style */
	.modal-dialog{
		width: 600px
	}
	.modal-content{
		background-color:#FFCCCE
	}
	
	.col-md-offset-4 {
		margin-top: 50px;
	}
	
	
	
	.col-md-offset-4{
		padding-top: 60px
	}
	
</style>

<script>
// 회원 아이디 찾기
$(function() {
	$('#findmid').click(function() {
		$.ajax({
			url: "findmid",
			type: "GET",
			data: {
				mname: $('#midmname').val(),
				memail: $('#midmemail').val(),
				mtel: $('#midmtel').val()
			},
			dataType: "text",
			
			success: function(res) {
				if (res == "값을 모두 입력해주세요.") {
					alert(res);
				}
				else {
					$('#demo').html(res);
				}
			},
			error: function(a, b) {
				alert("Request: " + JSON.stringify(a));
			}
		});
	});
});
// 회원 아이디 찾기

// 회원 비밀번호 찾기 _ 비밀번호 찾기 질문 가져오기
$(function() {
	$('#findmpwdkey').click(function() {
		$.ajax({
			url: "findmpwdkey",
			type: "GET",
			data: {
				mid: $('#mpwdmid').val(),
				memail: $('#mpwdmemail').val()
			},
			dataType: "text",
			
			success: function(res) {
				if (res == "값을 모두 입력해주세요.") {
					alert(res);
				}
				else if (res == "해당하는 정보가 존재하지 않습니다.") {
					alert(res);
				}
				else {
					$('#mpwdkey').html(res);
				}
			},
			error: function(a, b) {
				alert("Request: " + JSON.stringify(a));
			}
		});
	});
});
//회원 비밀번호 찾기 _ 비밀번호 찾기 질문 가져오기

// 회원 비밀번호 찾기
$(function() {
	$('#findmpwd').click(function() {
		$.ajax({
			url: "findmpwd",
			type: "GET",
			data: {
				mid: $('#mpwdmid').val(),
				memail: $('#mpwdmemail').val(),
				mpwdval: $('#mpwdmpwdval').val()
			},
			dataType: "text",
			
			success: function(res) {
				alert(res);
			},
			error: function(a, b) {
				alert("Request: " + JSON.stringify(a));
			}
		});
	});
});
//회원 비밀번호 찾기

$(document).ready(function(){
	$("#close1").click(function(){
		closereset1();
	});
	$("#close2").click(function(){
		closereset1();
	});
	$("#close3").click(function(){
		closereset2();
	});
	$("#close4").click(function(){
		closereset2();
	});
});
function closereset1(){
	document.getElementById("midmname").value="";
	document.getElementById("midmemail").value="";
	document.getElementById("midmtel").value="";
	$('#demo').empty();
}
function closereset2(){
	document.getElementById("mpwdmid").value="";
	document.getElementById("mpwdmemail").value="";
	document.getElementById("mpwdmpwdval").value="";
	$('#mpwdkey').empty();
}

</script>

<c:url var="loginUrl" value="/j_spring_security_check"></c:url>

<div id="my_container">

	<form action="${loginUrl }" method="post">

    <div class="col-md-offset-4 col-md-3" style="width: 450px">
        <div class="form-login">
        <h1 class="text-center">Login</h1>
         
        <input type="text" id="loginemail" name="mid" class="form-control input-lg chat-input" placeholder="아이디" /></br>
         
        <input type="password" id="loginpwd" name="mpwd" class="form-control input-lg chat-input" placeholder="비밀번호" /></br>
         
        <div class="wrapper">
         <span class="group-btn">     
<!--              <a href="#" class="btn btn-success btn-lg btn-block">login <i class="fa fa-sign-in"></i></a> -->
			<input type="submit" class="btn btn-danger btn-lg btn-block" value="로그인">
         </span>
        </div>
         
        <hr>
         <!-- autocomplete: HTML5 속성, 자동완성 꺼주는 기능 -->
        <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#findIdModal" autocomplete="off">
        	<span class="glyphicon glyphicon-tag"> 아이디찾기&nbsp;</span>
        </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#findPwdModal" autocomplete="off">
        	<span class="glyphicon glyphicon-tags"> 비밀번호찾기&nbsp;</span>
        </button>
       </div>
    </div>
    </form>
    
    <!-- Modal Start -->   
 <div class="modal fade" id="findIdModal" role="dialog">
 <div class="modal-dialog">
 
   <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" id="close1" data-dismiss="modal">&times;</button>
        <h2 class="modal-title">Forget your ID?</h2>
      </div>
      <div class="modal-body">
        <p>		
        	<input type="text" id="midmname" class="form-control input-xs chat-input" placeholder="가입하신 이름을 입력하세요" /><br/>
        	<input type="text" id="midmemail" class="form-control input-xs chat-input" placeholder="가입하신 메일주소를 입력하세요" /><br/>
        	<input type="text" id="midmtel" class="form-control input-xs chat-input" placeholder="가입하신 전화번호를 입력하세요" /><br/>
        </p>
<!--         <button id="findmid" type="button" class="btn btn-success" data-toggle="collapse" data-target="#demo">찾　　　기</button><p> -->
        <button id="findmid" type="button" class="btn btn-danger">찾　　　기</button><p><p>
<!--         <div id="demo" class="collapse alert alert-success"> -->
        <div id="demo">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="close2" class="btn btn-danger input-sm" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>     



<div class="modal fade" id="findPwdModal" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
   <div class="modal-content">
     <div class="modal-header">
       <button type="button" class="close" id="close3" data-dismiss="modal">&times;</button>
       <h2 class="modal-title">Forget your Password?</h2>
     </div>
     <div class="modal-body">
       	<input type="text" id="mpwdmid" class="form-control input-xs chat-input" placeholder="가입하신 아이디를 입력하세요" /></br>
       	<input type="text" id="mpwdmemail" class="form-control input-xs chat-input" placeholder="가입하신 메일주소를 입력하세요" /></br>
       	
       	<button type="button" class="btn btn-danger" id="findmpwdkey">입　　　력</button>
       	
       	<div style="text-align: left; color: #006600;">
       		<!-- 비밀번호 찾기 질문은 이곳에 나와야 합니당.  -->
        		<span>&nbsp;&nbsp;비밀번호 찾기 질문 : <span id="mpwdkey"></span></span>
        	</div>
        	<input type="text" id="mpwdmpwdval" class="form-control input-xs chat-input" placeholder="질문에 답을 입력하세요" /></br>
        <button type="button" class="btn btn-danger" id="findmpwd">찾　　　기</button>
      </div>
      <div class="modal-footer">
        <button type="button" id="close4" class="btn btn-danger input-sm" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
<!-- Modal End --> 
  
   
</div>