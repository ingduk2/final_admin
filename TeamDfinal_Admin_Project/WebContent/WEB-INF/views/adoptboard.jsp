<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#wrap{
		
		margin:auto;
	}

table{
	width: 100%;
}
</style>

<div id="wrap">
<table class="table table-striped">
	<thead class="table table-striped">
		<tr>
		<th colspan="19"> 입양 신청자 !</th>
		</tr>
		<tr>
			<td></td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
	</thead>
	
	<!-- 리스트 받아서 td안에 뽑으믄 됩니다. -->
	<tbody>
		<c:forEach var="listv" items="${list }">
		<tr>
			<td>${listv.adoptno }</td>
			<td>${listv.mid }</td>
			<td>${listv.anino }</td>
			<td>${listv.eid }</td>
			<td>${listv.memage }</td>
			<td>${listv.score }</td>
			<td>${listv.qus1 }</td>
			<td>${listv.qus1sup1 }</td>
			<td>${listv.qus2 }</td>
			<td>${listv.qus2sup1 }</td>
			<td>${listv.qus3 }</td>
			<td>${listv.qus4 }</td>
			<td>${listv.qus5 }</td>
			<td>${listv.qus6 }</td>
			<td>${listv.qus6sup1 }</td>
			<td>${listv.qus7 }</td>
			<td>${listv.qus8 }</td>
			<td>${listv.qus9 }</td>
			<td>${listv.qus10 }</td> 
		</tr>
		</c:forEach>
	
	</tbody>
	
	<tfoot>
		<tr>
			<td colspan="19"><input type="button" value="무슨버튼!"/></td>
		</tr>
	</tfoot>
</table>
</div>
