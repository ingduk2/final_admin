package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.BoardDao;
import kosta.teamd.vo.BoardVO;

@Controller
public class PageViewController {

	@Autowired
	private BoardDao bdao;
	
	@RequestMapping(value={"/","index"})
	public String a(){
		return "index";
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
	
}
