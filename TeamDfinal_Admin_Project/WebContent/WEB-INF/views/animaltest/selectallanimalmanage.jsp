<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrap">
<table class="table table-striped">
	<thead class="table table-striped">
		<tr>
		<th colspan="6"> 동물 관리 현황</th>
		</tr>
		<tr>
			<td>AMNO</td>
			<td>MID</td>
			<td>ANINO</td>
			<td>AMRICE</td>
			<td>AMSPO</td>
			<td>AMBATH</td>
		</tr>
	</thead>
	
	<!-- 리스트 받아서 td안에 뽑으믄 됩니다. -->
	<tbody>
		<c:forEach var="listamv" items="${listam }">
		<tr>
			<td>${listamv.amno }</td>
			<td>${listamv.mid }</td>
			<td>${listamv.anino }</td>
			<td>${listamv.amrice }</td>
			<td>${listamv.amspo }</td>
			<td>${listamv.ambath }</td>
		</tr>
		</c:forEach>
	
	</tbody>
	
	<tfoot>
		<tr>
			<td colspan="6"><input type="button" value="무슨버튼!"/></td>
		</tr>
	</tfoot>
</table>
</div>