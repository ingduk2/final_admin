<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#wrap{
		width:500px;
		margin:auto;
	}

table{
	width: 100%;
}
</style>


<div id="wrap">
<table class="table table-striped">
	<thead>
		<tr>
		<th colspan="4"> 블록 게시물 !</th>
		</tr>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
	</thead>
	
	<!-- 리스트 받아서 td안에 뽑으믄 됩니다. -->
	<tbody>
		<c:forEach var="listv" items="${list }">
		<tr>
			<td>${list.num }</td> <!-- 이런식으로 -->
			<td></td>
			<td></td>
		</tr>
		</c:forEach>
	</tbody>
	
	<tfoot>
		<tr>
			<td colspan="4"><input type="button" value="무슨버튼!"/></td>
		</tr>
	</tfoot>
</table>
</div>
