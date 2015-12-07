
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	
	String excelfile="/Users/ingduk2/Downloads/test3.xls";

try{
	POIFSFileSystem fs= new POIFSFileSystem(new FileInputStream(excelfile));
	//워크북 생성
	HSSFWorkbook workbook = new HSSFWorkbook(fs);
	int sheetNum=workbook.getNumberOfSheets();
	
	for(int k=0; k<sheetNum; k++){
		//시트 이름과 시트번호를 추출

	
%>
<br>
<br>
Sheet Number
<%=k %><br>
Sheet Name
<%=workbook.getSheetName(k) %><br>
<table class="table table-striped">
<thead class="table table-striped">입양 양식</thead>

<tbody>
<tr>
<%
	HSSFSheet sheet= workbook.getSheetAt(k);
int rows=sheet.getPhysicalNumberOfRows();

for(int r=0; r<rows; r++){
	//시트에 대한 행을하나씩 추출
	HSSFRow row= sheet.getRow(r);
	if(row!=null){
		int cells=row.getPhysicalNumberOfCells();
%>
Row
<%=row.getRowNum() %>
<%=cells %>




<%
	for(short c=0; c<cells; c++){
		//행에 대한 셀을 하나씩 추출하여 셀 타입에 따라 처리
		HSSFCell cell = row.getCell(c);
		if(cell!=null){
			String value=null;
			
			switch(cell.getCellType()){
			
			case HSSFCell.CELL_TYPE_FORMULA :
				value=" "+cell.getCellFormula();
				break;
			case HSSFCell.CELL_TYPE_NUMERIC:
				value=" "+cell.getNumericCellValue();
				break;
			case HSSFCell.CELL_TYPE_STRING:
				value=cell.getStringCellValue();
				break;
			case HSSFCell.CELL_TYPE_BLANK:
				value=null;
				break;
			case HSSFCell.CELL_TYPE_BOOLEAN:
				value=" "+cell.getBooleanCellValue();
				break;
			case HSSFCell.CELL_TYPE_ERROR:
				value="ERROR value="+cell.getErrorCellValue();
				break;
			default:
			}
%>

<%if(cell.getCellNum()==0){ %><td><%=value%></td> <%} %>
<%if(cell.getCellNum()==1){ %><td><%=value%></td> <%} %>
<%if(cell.getCellNum()==2){ %><td id="test"><%=value%></td> <%} %>



<%
				}
			}
%>
</tr>
			<% }
		}%>
		

</tbody>
<tfoot>
<tr><td><a href="" >다운로드</a></td></tr>
</tfoot>
</table>
	<% }
}catch(Exception e){
%>
Error occurred:
<%=e.getMessage() %>
<%
	e.printStackTrace();
}finally{
	
}
%>

<style>
#wrap {
	width: 100%;
	margin: auto;
}

table {
	width: 40%;
}
</style>

<script>
	$(function() {
		$('[id="adoptbtn"]').click(function() {
			//버튼 클릭하면 위의 양식으로 옮겨주기!
			$('[id="test"]').html("");
			$('[id="test"]').append("11111111");
		});
	});
</script>

<div id="wrap">
	<table>
		<thead>
			<tr>
				<th>설문 조사 양식.</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
			</tr>
		</tbody>
		
		<tfoot>
			<tr>
			<td><a href="">다운 로드!</a></td>
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
					<td><button type="button" id="adoptbtn">오왕</button>
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
