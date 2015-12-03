package kosta.teamd.mvc.controller;

import java.io.FileInputStream;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.AdoptApplyDao;
import kosta.teamd.mvc.dao.MemberDao;
import kosta.teamd.vo.AdoptApplyVO;
import kosta.teamd.vo.AdoptVO;
import kosta.teamd.vo.MemberVO;

@Controller
public class AdoptController {
	
	@Autowired
	private MemberDao mdao;
	@Autowired
	private AdoptApplyDao adadao;


	@RequestMapping(value="selectallAdopt")
	public ModelAndView selectallAdopt(){
		ModelAndView mav= new ModelAndView("adoptboard");
		List<AdoptApplyVO> list = adadao.selectallAdopt();
		
		
		//엑셀불러오기 분리해야함..개귀찮다 ㅡㅡ
//		private String Age;
//		private String Score;
//		private String q1, q1_1, q2, q2_1, q3, q4, q5, q6
//		,q6_1, q7, q8, q9, q10;
		
	AdoptVO advo=new AdoptVO();
		
		
		String excelfile="/Users/ingduk2/Downloads/test3.xls";

	try{
		POIFSFileSystem fs= new POIFSFileSystem(new FileInputStream(excelfile));
		//워크북 생성
		HSSFWorkbook workbook = new HSSFWorkbook(fs);
		int sheetNum=workbook.getNumberOfSheets();
		
		for(int k=0; k<sheetNum; k++){
			//시트 이름과 시트번호를 추출

		
	
//	<table class="table table-striped">
//	<thead class="table table-striped">입양 양식</thead>
//
//	<tbody>
//	<tr>
	
		HSSFSheet sheet= workbook.getSheetAt(k);
	int rows=sheet.getPhysicalNumberOfRows();

	for(int r=0; r<rows; r++){
		//시트에 대한 행을하나씩 추출
		HSSFRow row= sheet.getRow(r);
		if(row!=null){
			int cells=row.getPhysicalNumberOfCells();

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
	

	if(cell.getCellNum()==0){ 
		if(!value.equals("")){
			
		}
	} 
	if(cell.getCellNum()==1){ 
		if(!value.equals("")){
			
		}	
	} 
	if(cell.getCellNum()==2){ 
		if(!value.equals("")){
			
		}
	} 



	
					}
				}
	
	
				 }
			}

	
		 }
	}catch(Exception e){
	

	e.getMessage() ;
	
		e.printStackTrace();
	}finally{
		
	}
	
		
		
		
		mav.addObject("list",list);
		return mav;
	}
}
