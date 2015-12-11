<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" 
href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" 
src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>


 
<script>


$(document).ready(function(){
    $('#memberTable1').dataTable();
    $('#memberTable2').dataTable();
    $('#memberTable3').dataTable();
    $('#memberTable10').dataTable();
});



function popup(){
	var specs = "left=10,top=10,width=465,height=350, location=no, realzable=no, scrollbars=no";
	window.open("formWrite", "popup", specs);
}

</script>

<style>
#adminboard_wrap{
	width:100%;
	
}

#t1, #t2, #t3, #t4{
	width:45%;
	
	margin-left: 50px;
}

#t2{
	
}

#t3, #t4{
	margin-top: 50px;
}

.form-inline .form-group{
	vertical-align: top
}
</style>
<body onLoad="opener.location.href=opener.location.href; window.close();">
<div id="adminboard_wrap" class="form-inline">

<div id="t1" class="form-group">
<h2>공지 사항</h2>
<table class="table table-striped" id="memberTable1" >
   <thead class="table table-striped">
   		<tr>
   		<th>bno</th>
   		<th>btitle</th>
   		<th>mid</th>
   		<th>bdate</th>
   		<th></th>
   		</tr>
   </thead>
   <tbody>
   <c:forEach var="listv1" items="${list1 }">
    <tr>
        <td>${listv1.bno }</td>
        <td>${listv1.btitle }</td>
        <td>${listv1.mid }</td>
        <td>${listv1.bdate }</td>
        <td><button type="button" id="btn1" value="${listv1.bno }" onclick="location='deleteBoard?bno=${listv1.bno}'">삭제</button></td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<button type="button" id="write" onclick="popup()">글 쓰기</button>
</div>

<div id="t2" class="form-group">
<h2>자유 게시판</h2>
<table class="table table-striped" id="memberTable2" >
   <thead class="table table-striped">
   		<tr>
   		<th>bno</th>
   		<th>btitle</th>
   		<th>mid</th>
   		<th>bdate</th>
   		<th></th>
   		</tr>
   </thead>
   <tbody>
    <c:forEach var="listv2" items="${list2 }">
    <tr>
        <td>${listv2.bno }</td>
        <td>${listv2.btitle }</td>
        <td>${listv2.mid }</td>
        <td>${listv2.bdate }</td>
        <td><button type="button" id="btn2" value="${listv2.bno }" onclick="location='deleteBoard?bno=${listv2.bno}'">삭제</button></td>
    </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</div>



<div class="form-inline" style="margin-bottom: 10px">

<div id="t3" class="form-group">
<h2>질문 게시판</h2>
<table class="table table-striped" id="memberTable3" >
   <thead class="table table-striped">
   		<tr>
   		<th>bno</th>
   		<th>btitle</th>
   		<th>mid</th>
   		<th>bdate</th>
   		<th></th>
   		</tr>
   </thead>
   <tbody>
    <c:forEach var="listv3" items="${list3}">
    <tr>
        <td>${listv3.bno }</td>
        <td>${listv3.btitle }</td>
        <td>${listv3.mid }</td>
        <td>${listv3.bdate }</td>
        <td><button type="button" id="btn3" value="${listv3.bno }" onclick="location='deleteBoard?bno=${listv3.bno}'">삭제</button></td>
    </tr>
    </c:forEach>
    </tbody>
</table>
</div>

<div id="t4" class="form-group">
<h2>신고 글</h2>
<table class="table table-striped" id="memberTable10" >
   <thead class="table table-striped">
   		<tr>
   		<th>bno</th>
   		<th>btitle</th>
   		<th>mid</th>
   		<th>bdate</th>
   		<th></th>
   		</tr>
   </thead>
   <tbody>
    <c:forEach var="listv10" items="${list10 }">
    <tr>
        <td>${listv10.bno }</td>
        <td>${listv10.btitle }</td>
        <td>${listv10.mid }</td>
        <td>${listv10.bdate }</td>
        <td><button type="button" id="btn10" value="${listv10.bno }" onclick="location='updateBoard?bno=${listv10.bno}&boricode=${listv10.boricode}'">복구</button></td>
    </tr>
    </c:forEach>
    </tbody>
</table>
</div>

</div> 
</body>