package kosta.teamd.mvc.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.CenterDao;
import kosta.teamd.mvc.service.urljson;
import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.CenterVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Controller
public class CenterController {

	@Autowired
	private urljson myjson;
	
	@Autowired
	private CenterDao cdao;
	
	@RequestMapping(value="/formCenter")
	public ModelAndView formCenter(){
		
		ModelAndView mav= new ModelAndView("center/admincenter");
		BoardVO bvo= new BoardVO();
		List<CenterVO> list= cdao.list(bvo);
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value="/insertCenter",method=RequestMethod.POST)
	public ModelAndView insertCenter(CenterVO vo) throws UnsupportedEncodingException{
		
		
		ModelAndView mav= new ModelAndView("redirect:/formCenter");
		
		//웹에서 받는 걸로 바꿈..
		
		cdao.insert(vo);
		//jsonObject.get(key)

		return mav;
	}
	
	@RequestMapping(value="/selectallCenter")
	public ModelAndView selectallCenter(BoardVO bvo){ //search 때무에 씀
		ModelAndView mav= new ModelAndView("center/map");
		List<CenterVO> list=cdao.list(bvo);
		//여기서 json으로 만들어서 보내줘얗ㄴ다
		mav.addObject("list",list);
		mav.addObject("sv",bvo.getSearchValue());
		mav.addObject("st",bvo.getSearchType());
		return mav;
		
	}
	
	//ajax!!
	@RequestMapping(value="selectalljsonCenter")
	public ModelAndView selectalljsonCenter(BoardVO bvo){
		ModelAndView mav= new ModelAndView("/center/jsonmap");
		List<CenterVO> list=cdao.list(bvo);
		
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JSONObject map= null;
		for(CenterVO e: list){
			map=new JSONObject();
			map.put("title", e.getCname());
			map.put("latlng", e.getCxy());
			jsonArray.add(map);
		}
		
		jsonObject.put("aa", jsonArray);
		mav.addObject("json",jsonObject);
		return mav;
	}
	
	@RequestMapping(value="deleteCenter")
	public ModelAndView deleteCenter(int cnum){
		
//		ModelAndView mav = new ModelAndView("/center/jsonmap");
		ModelAndView mav= new ModelAndView("center/admincenter");
		cdao.deleteCenter(cnum);
		//mav.addObject("json","success");
		return mav;
	}
	
}
