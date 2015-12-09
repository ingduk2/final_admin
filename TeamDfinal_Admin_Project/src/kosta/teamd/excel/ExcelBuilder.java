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

import kosta.teamd.vo.AniBoardVO;


public class ExcelBuilder extends AbstractExcelView{


	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook adoptbook, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			List<AniBoardVO> anilist = (List<AniBoardVO>) model.get("anilist");
			HSSFSheet sheet = adoptbook.createSheet("anibooks");
			sheet.setDefaultColumnWidth(35);
			CellStyle style = adoptbook.createCellStyle();
			Font font = adoptbook.createFont();
			font.setFontName("Arial");
			style.setFillForegroundColor(HSSFColor.GREY_40_PERCENT.index);
			style.setFillPattern(CellStyle.ALIGN_CENTER);
			font.setBoldweight(HSSFColor.BLACK.index);
			style.setFont(font);
			HSSFRow header=sheet.createRow(0);
			//컬럼
			String[] clum = {"동물번호", "동물대분류", "동물소분류", "성별", "일자"};
			for (int i=0; i< clum.length; i++ ){
				header.createCell(i).setCellValue(clum[i]); // 셀만들어서 값넣기
				header.getCell(i).setCellStyle(style); // 셀에 스타일 적용
			}

			//열에 값 넣기
			int rowCnt= 1;
			for(AniBoardVO valbook : anilist){
			HSSFRow anirow = sheet.createRow(rowCnt++);
			anirow.createCell(0).setCellValue(valbook.getAnino());
			anirow.createCell(1).setCellValue(valbook.getAnispecies());
			anirow.createCell(2).setCellValue(valbook.getAnibreed());
			anirow.createCell(3).setCellValue(valbook.getAnisex());
			anirow.createCell(4).setCellValue(valbook.getAnidate());
			//불러올값만.
			}
		
			//타입지정	
			response.setContentType("Application/Msexcel");
			// 파일이름  ani_list.xls 임시 지정.
			response.setHeader("Context-Disposition", "attachment; filename=ani_list.xls;");
	}


}
