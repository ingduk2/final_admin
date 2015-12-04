<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//cdn.ckeditor.com/4.5.5/standard/ckeditor.js"></script>

<script>

$(function() {
	$('[id="surbtn"]').click(function () {
		
		//alert($(this).val()); //시퀀스
		$('#num').val($(this).val());
				$.ajax({
			        url: "selectonepopup", //"testAjax.jsp", 
			        type: "POST",
			        data:{
			        	num : $(this).val()
			        },
			        success: function(msg) { //데이터 받는 부분.response
			        //yes
			        //json으로 받을까?
			        //alert(msg);
			        
// 			        	CKEDITOR.instances.content.setData("");
// //	 			        $('#content').html(json[0].content);
// 				        $('#sub').val("");
// 				        $('#sub1').val("");
// 				        $('#sub2').val("");
// 				        $('#sub3').val("");
			        
			        
			        var json=JSON.parse(msg);
			        //alert(json);
			        //alert(json[0].content);
			        //alert(json[0].sub);
			        //alert(json[0].sub1);
			        //alert(json[0].sub2);
			        //alert(json[0].sub3);
			        
			        CKEDITOR.instances.content.setData(json[0].content);
// 			        $('#content').html(json[0].content);
			        $('#sub').val(json[0].sub);
			        $('#sub1').val(json[0].sub1);
			        $('#sub2').val(json[0].sub2);
			        $('#sub3').val(json[0].sub3);
// 			        CKEDITOR.replace('content');
			        },
			        error: function(a, b) {
			            alert("Request: " + JSON.stringify(a));
			            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        }
			   
			});
		
		
		
		
	});
});
		
		

</script>

<style>
 #sub, #sub1, #sub2, #sub3 { width: 500px }
</style>

<div>
<form action="updateSurvey" method="post">
		<!--content -->
		<input type="hidden" id="num" name="num">
		<textarea id="content" class="ckeditor" name="content"></textarea>
		<table>
			<tr>
			<td><!-- sub -->
		주&nbsp; 제<input type="text" id="sub" name="sub"></td>
			</tr>
			
			<tr>
			<td><!-- sub1 -->
		보기1<input type="text" id="sub1" name="sub1"></td>
			</tr>
			
			<tr>
			<td><!-- sub2 -->
		보기2<input type="text"  id="sub2" name="sub2"></td>
			</tr>
			
			<tr>
			<td><!-- sub3 -->
		보기3<input type="text" id="sub3" name="sub3"></td>
			</tr>
			
			<tr>
			<td><input type="submit" value="수정 완료!"></td>
			</tr>
		</table>
</form>	
	   
	   <table class="table table-striped">
	   		<thead class="table table-striped">
	   			<tr><td><h4>설문 조사</h4></td></tr>
	   			<tr>
	   			<td>num</td>
	   			<td>sub</td>
	   			<td>sdate</td>
	   			</tr>
	   			
	   		</thead>
	   		<c:forEach var="listv" items="${list }">
	   		<tr>
	   			<td>${listv.num }</td>
	   			<td>${listv.sub }</td>
	   			<td>${listv.sdate }</td>
	   			<td><button type="button" id="surbtn" value="${listv.num }">불러오기</button>
	   		</tr>
			</c:forEach>
	   </table>
	   
	   
	
</div>