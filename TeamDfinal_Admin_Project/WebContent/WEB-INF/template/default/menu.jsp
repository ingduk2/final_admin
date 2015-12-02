<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<style>
li { list-style: none}
.faq {
 padding: 20px 30px 0 20px;
 float: left;
}

.faq h4 {
 border-top: 1px solid #ddd
}

.faq h4 a {
/*  display: inline-block; */
 padding: 15px;
 font-size: 14px;
 color: #555;
 text-decoration: none
}

.faq h4 a:hover {
 color: #3273b3
}

.faq div {
 padding: 0 15px 15px;
 line-height: 20px
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
			}else{ //no hidden
				$trigger2.click(function() {
					var $this= $(this).parent(); //a의 부모 h4
					$trigger2.parent().removeClass("on");
					$content2.slideUp(300);
				});
			}
		})
		
				
	});
</script>


 <div class="faq">

  <h4>
   <a href="formMember">회원 관리</a>
  </h4>
  <div>
<!--   	 <a href="formMember">강제 탈퇴</a><br /> -->
<!--   	 <a href="formChart?year=2012">강제 수정</a><br />  -->
  </div>

  <h4>
   <a href="#none">게시물 관리</a>
  </h4>
    <div>
  	 <a href="">블록 게시물</a><br />
  	 <a href="">게시물 복구</a><br /> 
  	 <a href="">강제 삭제</a><br /> 
  	 <a href="">강제 이동</a><br /> 
  </div>
  
  <h4>
   <a href="selectallAdopt">입양 신청 관리</a>
  </h4>
    <div>
<!--   	 <a href="selectallAdopt">입양 신청자</a><br /> -->
<!--   	 <a href="formCal">봉사 신청자</a><br />  -->
  </div>
  
  <h4>
   <a href="formCal">봉사 신청 관리</a>
  </h4>
    <div>
<!--   	 <a href="selectallAdopt">입양 신청자</a><br /> -->
<!--   	 <a href="formCal">봉사 신청자</a><br />  -->
  </div>
  
  <h4>
   <a href="formCenter">센터 관리</a>
  </h4>
    <div>
<!--   	 <a href="formCenter">센터 입력</a><br /> -->
<!--   	 <a href="">센터 수정</a><br /> -->
<!--   	 <a href="">센터 삭제</a><br />   -->
  </div>
  
   <h4>
   <a href="#">밥 주기</a>
  </h4>
    <div>
<!--   	 <a href="drag">밥 주장</a><br />   -->
  </div>

	<h4>
   <a href="testani">동물 관리</a>
  </h4>
    <div>
<!--   	 <a href="testani">animal</a><br />   -->
  </div>
  
  	<h4>
   <a href="formEmployee">직원 관리</a>
  </h4>
    <div>
<!--   	 <a href="selectallEmployee">직원 관리</a><br />   -->
  </div>
  

  
  	<h4>
  	
<c:if test="${pageContext.request.userPrincipal.name == null}">
		<a href="#">동물관리 현황</a>
</c:if>
					
<c:if test="${pageContext.request.userPrincipal.name != null}">
<a href="selectallanimalmanage?mid=${pageContext.request.userPrincipal.name }">동물관리 현황</a>
</c:if>
   
  </h4>
    <div>
<!--   	 <a href="selectallEmployee">직원 관리</a><br />   -->
  </div>

 </div>

