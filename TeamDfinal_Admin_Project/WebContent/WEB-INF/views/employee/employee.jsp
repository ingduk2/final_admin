<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
// 	$('input#btn').click(function() {
// 		if(this.value==")
// 	});
$(function () {
	//승인
	//0->1
	$("[id='btnn']").click(function() {
		alert($(this).val());
		
			$.ajax({
		        url: "updateyesEmployee", //"testAjax.jsp", 
		        type: "POST",
		        data:{
		        	mid : $(this).val()
		        },
		        success: function(msg) { //데이터 받는 부분.response
		        //yes
		        alert(msg);
		        	
		        	
		        },
		        error: function(a, b) {
		            alert("Request: " + JSON.stringify(a));
		            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
		   
		});
	});
	
	//탈퇴
	//1->0
	$("[id='btny']").click(function() {
		alert($(this).val());
		
		$.ajax({
	        url: "updatenoEmployee", //"testAjax.jsp", 
	        type: "POST",
	        data:{
	        	mid : $(this).val()
	        },
	        success: function(msg) { //데이터 받는 부분.response
	        //no
	        alert(msg);
	        	
	        },
	        error: function(a, b) {
	            alert("Request: " + JSON.stringify(a));
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	   
	});
	});
});
	
</script>


<div class="form-inline">
	<div class="form-group">
	<table class="table table-striped">
		<thead class="table table-striped">
			<tr><td><h1>비승인 직원</h1></td></tr>
		</thead>
			
		<tbody id="no">
			<c:forEach var="listnv" items="${listn }">
				<tr>
					<td>${listnv.mid }</td>
					<td>${listnv.memail }</td>
<%-- 					<td><input type="button"  id="btnn" value="${listnv.mid }" ></td> --%>
					<td><button id="btnn" value="${listnv.mid }">승인..</button></td>
				</tr>
			</c:forEach>
		</tbody>
		
		<tfoot>
		</tfoot>
	</table>
	</div>
	
	<div class="form-group">
	<table class="table table-striped">
		<thead class="table table-striped">
			<tr><td><h1>승인 직원</h1></td></tr>
		</thead>
		
		
		<!-- select m.mid mid, m.mname mname, m.memail memail, e.emzic emzic, e.emsalary emsalary -->
		<tbody id="yes">
			<c:forEach var="listyv" items="${listy }">
			
				<tr>
					<td>${listyv.mid }</td>
					<td>${listyv.mname }</td>
					
					
<%-- 					<td><input type="button" id="btny" value="${listyv.mid }"><td> --%>
					<td><button id="btny" value="${listyv.mid }">탈퇴..</button></td>
					
					
				</tr>
			
			</c:forEach>
		</tbody>
		
		<tfoot>
		</tfoot>
	</table>
	</div>
</div>