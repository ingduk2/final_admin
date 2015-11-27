package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.MemberDao;
import kosta.teamd.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(value="formMember")
	public ModelAndView formMember(){
		ModelAndView mav= new ModelAndView("member");
		List<MemberVO> list= mdao.selectallMember();
		mav.addObject("list", list);
		return mav;
	}
	
//	@RequestMapping(value="selectallMember")
//	public ModelAndView selectallMember(){
//		ModelAndView mav= new ModelAndView("member");
//		List<MemberVO> list= mdao.selectallMember();
//		mav.addObject("list", list);
//		return mav;
//	}
}