package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.BoardDao;
import kosta.teamd.mvc.dao.EmployeeDao;
import kosta.teamd.mvc.dao.MainDao;
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
	
	@Autowired
	private MainDao maindao;
	
	@RequestMapping(value={"/","index"})
	public ModelAndView a(){
		ModelAndView mav= new ModelAndView("index");
		List<MemberVO> list=edao.selectMainEmployee();
		
		int mainmembercnt=maindao.mainMemberCnt();
		int mainboardcnt=maindao.mainBoardCnt();
		int mainanimalcnt=maindao.mainAniamlrCnt();
		
		mav.addObject("mainmembercnt", mainmembercnt);
		mav.addObject("mainboardcnt", mainboardcnt);
		mav.addObject("mainanimalcnt", mainanimalcnt);
		
		return mav;
	}

	// 디나이 페이지
	@RequestMapping(value="/denied")
	public String formDenied() {
		return "denied";
	}
	
}
