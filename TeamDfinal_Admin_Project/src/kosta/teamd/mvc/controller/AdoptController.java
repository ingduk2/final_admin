package kosta.teamd.mvc.controller;

import java.io.FileInputStream;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import kosta.teamd.vo.ExcelVO;
import kosta.teamd.vo.MemberVO;

@Controller
public class AdoptController {
	
	@Autowired
	private MemberDao mdao;
	@Autowired
	private AdoptApplyDao adadao;


	@RequestMapping(value="selectallAdopt")
	public ModelAndView selectallAdopt(){
		ModelAndView mav= new ModelAndView("adopt/adoptboard");
		List<AdoptApplyVO> list = adadao.selectallAdopt();
		System.out.println(list.size());

	
		AdoptVO advo= new AdoptVO();
		advo=getExcel();
		System.out.println(advo.getQ1());
		mav.addObject("vo",advo);
		
		mav.addObject("list",list);
		return mav;
	}
	
	
	@RequestMapping(value="downloadExcel")
	public ModelAndView downloadExcel(int adoptno){
		
		AdoptVO advo= getExcel();
		AdoptApplyVO adavo= adadao.selectoneAdopt(adoptno);
			
		ExcelVO exvo=new ExcelVO();
		exvo.setMid(adavo.getMid());
		exvo.setCel0_0("");exvo.setCel0_1("Age");exvo.setCel0_2(adavo.getMemage());
		exvo.setCel1_0("");exvo.setCel1_1("Score");exvo.setCel1_2(Integer.toString(adavo.getScore()));
		exvo.setCel2_0("Q1");exvo.setCel2_1(advo.getQ1());exvo.setCel2_2(adavo.getQus1());
		exvo.setCel3_0("Q1-1");exvo.setCel3_1(advo.getQ1_1());exvo.setCel3_2(adavo.getQus1sup1());
		exvo.setCel4_0("Q2");exvo.setCel4_1(advo.getQ2());exvo.setCel4_2(adavo.getQus2());
		exvo.setCel5_0("Q2-1");exvo.setCel5_1(advo.getQ2_1());exvo.setCel5_2(adavo.getQus2sup1());
		exvo.setCel6_0("Q3");exvo.setCel6_1(advo.getQ3());exvo.setCel6_2(adavo.getQus3());
		exvo.setCel7_0("Q4");exvo.setCel7_1(advo.getQ4());exvo.setCel7_2(adavo.getQus4());
		exvo.setCel8_0("Q5");exvo.setCel8_1(advo.getQ5());exvo.setCel8_2(adavo.getQus5());
		exvo.setCel9_0("Q6");exvo.setCel9_1(advo.getQ6());exvo.setCel9_2(adavo.getQus6());
		exvo.setCel10_0("Q6-1");exvo.setCel10_1(advo.getQ6_1());exvo.setCel10_2(adavo.getQus6sup1());
		exvo.setCel11_0("Q7");exvo.setCel11_1(advo.getQ7());exvo.setCel11_2(adavo.getQus7());
		exvo.setCel12_0("Q8");exvo.setCel12_1(advo.getQ8());exvo.setCel12_2(adavo.getQus8());
		exvo.setCel13_0("Q9");exvo.setCel13_1(advo.getQ9());exvo.setCel13_2(adavo.getQus9());
		exvo.setCel14_0("Q10");exvo.setCel14_1(advo.getQ10());exvo.setCel14_2(adavo.getQus10());
		
		//List<bbs1VO> listBooks = dao.getList(vo);
		//뷰 이름, 모델이름, 모델값주소
		return new ModelAndView("excelView","listBooks",exvo);
		//엑셀뷰로 가는데 그 요청이 프로퍼티즈에 있따..
		
		
	
	}
	
	
	public AdoptVO getExcel(){
		//엑셀불러오기 분리해야함..개귀찮다 ㅡㅡ
//		private String Age;
//		private String Score;
//		private String q1, q1_1, q2, q2_1, q3, q4, q5, q6
//		,q6_1, q7, q8, q9, q10;
		
	AdoptVO advo=new AdoptVO();
		
		//자기 경로에 맞춰야함
		String excelfile="C:\\Users\\kosta\\git\\final_admin\\TeamDfinal_Admin_Project\\WebContent\\excel\\test3.xls";

	try{
		POIFSFileSystem fs= new POIFSFileSystem(new FileInputStream(excelfile));
		//워크북 생성
		HSSFWorkbook workbook = new HSSFWorkbook(fs);
		int sheetNum=workbook.getNumberOfSheets();
		
		for(int k=0; k<sheetNum; k++){
			//시트 이름과 시트번호를 추출

		

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
	
	if(cell.getCellNum()==1){ 
		//이새끼 왜 null이냐 ㅡㅡ
//		if(!value.equals("")){
			if(row.getRowNum()==0){
				advo.setAge(value);
			}else if(row.getRowNum()==1){
				advo.setScore(value);
			}else if(row.getRowNum()==2){
				advo.setQ1(value);
			}else if(row.getRowNum()==3){
				advo.setQ1_1(value);
			}else if(row.getRowNum()==4){
				advo.setQ2(value);
			}else if(row.getRowNum()==5){
				advo.setQ2_1(value);
			}else if(row.getRowNum()==6){
				advo.setQ3(value);
			}else if(row.getRowNum()==7){
				advo.setQ4(value);
			}else if(row.getRowNum()==8){
				advo.setQ5(value);
			}else if(row.getRowNum()==9){
				advo.setQ6(value);
			}else if(row.getRowNum()==10){
				advo.setQ6_1(value);
			}else if(row.getRowNum()==11){
				advo.setQ7(value);
			}else if(row.getRowNum()==12){
				advo.setQ8(value);
			}else if(row.getRowNum()==13){
				advo.setQ9(value);
			}else if(row.getRowNum()==14){
				advo.setQ10(value);
			}
			
		}	
//	} 




	
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
		
		return advo;
	}
	
	
}
