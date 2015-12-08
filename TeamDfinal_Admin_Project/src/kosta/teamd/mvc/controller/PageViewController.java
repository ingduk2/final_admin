package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.BoardDao;
import kosta.teamd.mvc.dao.EmployeeDao;
import kosta.teamd.mvc.dao.SurveyDao;
import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.EmployeeVO;
import kosta.teamd.vo.MemberVO;
import kosta.teamd.vo.SurveyVO;

@Controller
public class PageViewController {

	@Autowired
	private BoardDao bdao;
	
	@Autowired
	private SurveyDao sdao;
	
	@Autowired
	private EmployeeDao edao;
	
	@RequestMapping(value={"/","index"})
	public ModelAndView a(){
		ModelAndView mav= new ModelAndView("index");
		List<MemberVO> list=edao.selectMainEmployee();
		
		mav.addObject("list",list);
		
		return mav;
	}

	// 디나이 페이지
	@RequestMapping(value="/denied")
	public String formDenied() {
		return "denied";
	}
	
	//popup용 페이지들
	@RequestMapping(value="/popup")
	public String popup(){	
		return "checkpage/popup";
	}
	@RequestMapping(value="/popup2")
	public String popup2(){
		return "checkpage/popup2";
	}
	@RequestMapping(value="/popup3")
	public String popup3(){
		return "checkpage/popup3";
	}
	@RequestMapping(value="/popup4")
	public String popup4(){
		return "checkpage/popup4";
	}
	
	@RequestMapping(value="selectallpopup")
	public ModelAndView selectallpopup(){
		ModelAndView mav= new ModelAndView("survey/surveychange");
		List<SurveyVO> list= sdao.surveyList();
		
		mav.addObject("list",list);
		return mav;
	}
	
//	@RequestMapping(value="/selectonepopup")
//	public ModelAndView popup4(int num){
//		ModelAndView mav = new ModelAndView("checkpage/popup4");
//		SurveyVO v = sdao.getDetail(num);
//		mav.addObject("v",v);
//		return mav;
//		
//	}
	
	
}
