package kosta.teamd.excel;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import kosta.teamd.vo.ExcelVO;
import oracle.net.aso.s;

public class ExcelBuilder extends AbstractExcelView{

	
	//excelView 뷰를 찾으면, 이것을 현재클래스 ExcelBuilder가
	//abstractExcelView를 상속했기 때문에 이것은 뷰이다.
	//DispatcherServlet -> [view]jsp (model) : forward
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		//HSSF - 마이크로 소프트의 엑셀 전용 클래스
		//DispatcherServlet에 의해서 Model을 받습니다.
		//${listBooks}
		
		//cell을 리스트로 채운다.
		ExcelVO listBooks=
				 (ExcelVO) model.get("listBooks");
		//poi문법
		HSSFSheet sheet= workbook.createSheet("Show Books");
		sheet.setDefaultColumnWidth(30);
		CellStyle style = workbook.createCellStyle();
		Font font=workbook.createFont();
		font.setFontName("Arial");
		//style.setFillForegroundColor(HSSFColor.BLUE.index);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		font.setBoldweight(HSSFColor.WHITE.index);
		style.setFont(font);
//		HSSFRow header = sheet.createRow(0);
		//액셀의 셀 타이틀
//		String[] str={"Number","sub","writer","pwd","cont","reip","hit","regdate"};
//		for(int i=0; i<str.length; i++){
//			header.createCell(i).setCellValue(str[i]);
//			header.getCell(i).setCellStyle(style);
//		}
		int rowCount=0;
		//셀의 내용을 채움
		//for(bbs1VO aBook : listBooks){
			HSSFRow aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel0_0());
			aRow.createCell(1).setCellValue(listBooks.getCel0_1());
			aRow.createCell(2).setCellValue(listBooks.getCel0_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel1_0());
			aRow.createCell(1).setCellValue(listBooks.getCel1_1());
			aRow.createCell(2).setCellValue(listBooks.getCel1_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel2_0());
			aRow.createCell(1).setCellValue(listBooks.getCel2_1());
			aRow.createCell(2).setCellValue(listBooks.getCel2_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel3_0());
			aRow.createCell(1).setCellValue(listBooks.getCel3_1());
			aRow.createCell(2).setCellValue(listBooks.getCel3_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel4_0());
			aRow.createCell(1).setCellValue(listBooks.getCel4_1());
			aRow.createCell(2).setCellValue(listBooks.getCel4_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel5_0());
			aRow.createCell(1).setCellValue(listBooks.getCel5_1());
			aRow.createCell(2).setCellValue(listBooks.getCel5_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel6_0());
			aRow.createCell(1).setCellValue(listBooks.getCel6_1());
			aRow.createCell(2).setCellValue(listBooks.getCel6_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel7_0());
			aRow.createCell(1).setCellValue(listBooks.getCel7_1());
			aRow.createCell(2).setCellValue(listBooks.getCel7_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel8_0());
			aRow.createCell(1).setCellValue(listBooks.getCel8_1());
			aRow.createCell(2).setCellValue(listBooks.getCel8_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel9_0());
			aRow.createCell(1).setCellValue(listBooks.getCel9_1());
			aRow.createCell(2).setCellValue(listBooks.getCel9_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel10_0());
			aRow.createCell(1).setCellValue(listBooks.getCel10_1());
			aRow.createCell(2).setCellValue(listBooks.getCel10_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel11_0());
			aRow.createCell(1).setCellValue(listBooks.getCel11_1());
			aRow.createCell(2).setCellValue(listBooks.getCel11_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel12_0());
			aRow.createCell(1).setCellValue(listBooks.getCel12_1());
			aRow.createCell(2).setCellValue(listBooks.getCel12_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel13_0());
			aRow.createCell(1).setCellValue(listBooks.getCel13_1());
			aRow.createCell(2).setCellValue(listBooks.getCel13_2());
			aRow=sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(listBooks.getCel14_0());
			aRow.createCell(1).setCellValue(listBooks.getCel14_1());
			aRow.createCell(2).setCellValue(listBooks.getCel14_2());
			aRow=sheet.createRow(rowCount++);
		//}
		//응답객체로부터 다운로드 받을 타입과 파일 이름을 설정한다.
		response.setContentType("Application/Msexcel");
		response.setHeader("Content-Disposition", "attachment; filename=adopt_excel.xls");
	}
	
}

