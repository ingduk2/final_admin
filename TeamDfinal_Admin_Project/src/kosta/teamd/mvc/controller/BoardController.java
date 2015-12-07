package kosta.teamd.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@RequestMapping(value="formBoard")
	public ModelAndView formBoard(){
		ModelAndView mav= new ModelAndView("board/adminboard");
		
		return mav;
		
	}
	
	@RequestMapping(value="formTest")
	public ModelAndView formTest(){
		ModelAndView mav= new ModelAndView("board/test");
		return mav;
	}
}
