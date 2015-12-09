package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.SurveyDao;
import kosta.teamd.vo.SurveyVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class SurveyController {
	
	@Autowired
	private SurveyDao sdao;
	
	@RequestMapping(value="formSurvey")
	public ModelAndView formSurvey(){
		ModelAndView mav= new ModelAndView("survey/surveychange");
		List<SurveyVO> list= sdao.surveyList();
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value="/selectonepopup")
	public ModelAndView popup(int num){
		ModelAndView mav = new ModelAndView("/survey/surveyupdate");
		SurveyVO v = sdao.getDetail(num);
		JSONArray ja=new JSONArray(); //[ ]
		JSONObject jo= new JSONObject(); // { }
		jo.put("content", v.getContent());
		jo.put("sub", v.getSub());
		jo.put("sub1", v.getSub1());
		jo.put("sub2", v.getSub2());
		jo.put("sub3", v.getSub3());
		
		ja.add(jo);
		System.out.println(ja);
		mav.addObject("survey",ja);
		return mav;
		
	}
	
	@RequestMapping(value="updateSurvey" ,method=RequestMethod.POST)
	public ModelAndView updateSurvey(SurveyVO svo){
		ModelAndView mav= new ModelAndView("redirect:/formSurvey");
		sdao.subUpdate(svo);
		return mav;
		
	}
}
