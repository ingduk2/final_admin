package kosta.teamd.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SurveyController {
	
	@RequestMapping(value="formSurvey")
	public ModelAndView formSurvey(){
		ModelAndView mav= new ModelAndView("survey/surveychange");
		
		return mav;
	}
}
