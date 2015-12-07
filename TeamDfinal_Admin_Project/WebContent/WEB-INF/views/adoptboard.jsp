
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<style>
#wrap {
	width: 100%;
	margin: auto;
	border: 1px;
}

table {
	width: 40%;
}
</style>

<script>
	$(function() {
		$('[id="adoptbtn"]').click(function() {
			alert($(this).val());
			$('#down').prop('href', 'downloadExcel?adopno='+$(this).val());
			//버튼 클릭하면 위의 양식으로 옮겨주기!
			//ado1, adov1
			//alert($(this).parent().parent().html());
			console.log($(this).parent().parent().html());
			//alert($(this).parent().parent().find("td").eq(5).html());
			for(var i=0; i<15; i++){
				$('#ado'+i).html($(this).parent().parent().find("td").eq(i+4).html());
			}
		});
	});
</script>

<div id="wrap">
	<table class="table table-striped">
		<thead class="table table-striped">
			<tr>
				<th>설문 조사 양식.</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td></td>
				<td>Age</td>
				<td id="ado0"></td>
			</tr>
			<tr>
				<td></td>
				<td>Score</td>
				<td id="ado1"></td>
			</tr>
			<tr>
				<td>Q1</td>
				<td>${vo.q1 }</td>
				<td id="ado2"></td>
			</tr>
			<tr>
				<td>Q1-1</td>
				<td>${vo.q1_1 }</td>
				<td id="ado3"></td>
			</tr>
			<tr>
				<td>Q2</td>
				<td>${vo.q2}</td>
				<td id="ado4"></td>
			</tr>
			<tr>
				<td>Q2-1</td>
				<td>${vo.q2_1}</td>
				<td id="ado5"></td>
			</tr>
			<tr>
				<td>Q3</td>
				<td>${vo.q3}</td>
				<td id="ado6"></td>
			</tr>
			<tr>
				<td>Q4</td>
				<td>${vo.q4}</td>
				<td id="ado7"></td>
			</tr>
			<tr>
				<td>Q5</td>
				<td>${vo.q5}</td>
				<td id="ado8"></td>
			</tr>
			<tr>
				<td>Q6</td>
				<td>${vo.q6}</td>
				<td id="ado9"></td>
			</tr>
			<tr>
				<td>Q6-1</td>
				<td>${vo.q6_1}</td>
				<td id="ado10"></td>
			</tr>
			<tr>
				<td>Q7</td>
				<td>${vo.q7}</td>
				<td id="ado11"></td>
			</tr>
			<tr>
				<td>Q8</td>
				<td>${vo.q8}</td>
				<td id="ado12"></td>
			</tr>
			<tr>
				<td>Q9</td>
				<td>${vo.q9}</td>
				<td id="ado13"></td>
			</tr>
			<tr>
				<td>Q10</td>
				<td>${vo.q10}</td>
				<td id="ado14"></td>
			</tr>
		</tbody>
		
		<tfoot>
			<tr>
			<td><a href="" id="down" >다운 로드!</a></td>
			</tr>
		</tfoot>
	</table>


	<table class="table table-striped">
		<thead class="table table-striped">
			<tr>
				<th colspan="19">입양 신청자 !</th>
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
					<td>${listv.adopno }</td>
					<td>${listv.mid }</td>
					<td>${listv.anino }</td>
					<td>${listv.eid }</td>
					<td id="adov1">${listv.memage }</td>
					<td id="adov2">${listv.score }</td>
					<td id="adov3">${listv.qus1 }</td>
					<td id="adov4">${listv.qus1sup1 }</td>
					<td id="adov5">${listv.qus2 }</td>
					<td id="adov6">${listv.qus2sup1 }</td>
					<td id="adov7">${listv.qus3 }</td>
					<td id="adov8">${listv.qus4 }</td>
					<td id="adov9">${listv.qus5 }</td>
					<td id="adov10">${listv.qus6 }</td>
					<td id="adov11">${listv.qus6sup1 }</td>
					<td id="adov12">${listv.qus7 }</td>
					<td id="adov13">${listv.qus8 }</td>
					<td id="adov14">${listv.qus9 }</td>
					<td id="adov15">${listv.qus10 }</td>
					<td><button type="button" id="adoptbtn" value="${listv.adopno }">오왕</button>
				</tr>
			</c:forEach>

		</tbody>

		<tfoot>
			<tr>
				<td colspan="19"><input type="button" value="무슨버튼!" /></td>
			</tr>
		</tfoot>
	</table>
</div>
