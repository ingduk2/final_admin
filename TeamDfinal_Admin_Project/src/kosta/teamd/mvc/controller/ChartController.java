package kosta.teamd.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.ChartDao;
import kosta.teamd.vo.ChartAdoptScore;
import kosta.teamd.vo.ChartAnimalManage;
import kosta.teamd.vo.ChartMemAgeVO;
import kosta.teamd.vo.ChartMemberVO;
import kosta.teamd.vo.ChartSurveyVO;
import kosta.teamd.vo.ChartVO;
import kosta.teamd.vo.SurveyVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ChartController {
	
	@Autowired
	private ChartDao cdao;
	
	@RequestMapping(value="/formChart")
	public ModelAndView formChart(String year){
		ModelAndView mav= new ModelAndView("chart/chart");
		mav.addObject("year",year);
		return mav;
	}
	
	@RequestMapping(value="/selectallChart")
	public ModelAndView selectallChart(String year){
		ModelAndView mav= new ModelAndView("/chart/chartdata");
		
		ArrayList<Double> data= new ArrayList<>();
		
		List<ChartVO> list=cdao.select(year);
		for(ChartVO e:list){
			data.add(e.getA());
		}
		for(ChartVO e:list){
			data.add(e.getB());
		}
		for(ChartVO e:list){
			data.add(e.getC());
		}
		for(ChartVO e:list){
			data.add(e.getD());
		}
		
		//mav.addObject("data",data);
		int size=data.size();
		StringBuffer sb= new StringBuffer();
		for(int i=0; i<size; i++){
			sb.append(data.get(i));
			if(size-1!=i)sb.append(",");
		}
		System.out.println(sb.toString());
		mav.addObject("chdata",sb.toString());
		mav.addObject("sizev",data.size());
		return mav;
	}
	
	//모두 ajax용!!
	//member 지역별 수 뽑는 쿼리.
	@RequestMapping(value="memberChart")
	public ModelAndView memberChart(){
		ModelAndView mav= new ModelAndView("/chart/memberchart");
		
		List<ChartMemberVO> list= cdao.selectallChartMember();
		
		
		JSONArray arr= new JSONArray();
		JSONArray ja= null;
		for(ChartMemberVO e : list){
			ja=new JSONArray();
			ja.add(e.getCity());
			ja.add(e.getCity_count());
			arr.add(ja);
		}
		
		System.out.println(arr);
		
		mav.addObject("member",arr);
		return mav;
	}
	
	@RequestMapping(value="addrChart")
	public ModelAndView addrChart(){
		ModelAndView mav= new ModelAndView("/chart/memberchart");
		List<ChartMemberVO> list=cdao.selectallchartaddr();
		
		JSONArray arr= new JSONArray();
		JSONArray ja= null;
		for(ChartMemberVO e : list){
			ja=new JSONArray();
			ja.add(e.getCity());
			ja.add(e.getCity_count());
			arr.add(ja);
		}
		System.out.println(arr);
		
		mav.addObject("member",arr);
		return mav;
	}
	
	//멤버 연령대 별 뽑는 ajax
	@RequestMapping(value="memberAge")
	public ModelAndView memberAge(){
		ModelAndView mav= new ModelAndView("/chart/memagechart");
		ChartMemAgeVO cmavo= cdao.selectallMemAge();
		
		JSONArray arr= new JSONArray();
		
		JSONObject jo= new JSONObject();
		jo.put("name", "10세미만");
		jo.put("y", cmavo.getA0());
		arr.add(jo);
		
		jo= new JSONObject();
		jo.put("name", "10대");
		jo.put("y", cmavo.getA10());
		arr.add(jo);
		
		jo= new JSONObject();
		jo.put("name", "20대");
		jo.put("y", cmavo.getA20());
		arr.add(jo);
		
		jo= new JSONObject();
		jo.put("name", "30대");
		jo.put("y", cmavo.getA30());
		arr.add(jo);
		
		jo= new JSONObject();
		jo.put("name", "40대");
		jo.put("y", cmavo.getA40());
		arr.add(jo);
		
		jo= new JSONObject();
		jo.put("name", "50대 이상");
		jo.put("y", cmavo.getA50());
		arr.add(jo);
		
		System.out.println(arr);
		
		mav.addObject("memage",arr);
		return mav;
	}
	
	
	@RequestMapping(value="adoptScore")
	public ModelAndView adoptScore(){
		ModelAndView mav= new ModelAndView("/adopt/adoptchart");
		//ChartMemAgeVO cmavo= cdao.selectallMemAge();
		ChartAdoptScore casvo=cdao.selectallscore();
		
		JSONArray arr= new JSONArray();
		
		JSONObject jo= new JSONObject();
		jo.put("name", "1~10");
		jo.put("y", casvo.getC10());
		arr.add(jo);
		
		jo= new JSONObject();
		jo.put("name", "11~20");
		jo.put("y", casvo.getC20());
		arr.add(jo);
		
		jo= new JSONObject();
		jo.put("name", "21~30");
		jo.put("y", casvo.getC30());
		arr.add(jo);
		
		jo= new JSONObject();
		jo.put("name", "31~40");
		jo.put("y", casvo.getC40());
		arr.add(jo);
		
		
		System.out.println(arr);
		
		mav.addObject("json",arr);
		return mav;
	}
	
	
	@RequestMapping(value="selectallam")
	public ModelAndView selectallam(){
		ModelAndView mav= new ModelAndView("/chart/chartdata");
		List<ChartAnimalManage> list=cdao.selectallam();
		
		JSONArray ja= new JSONArray();
		JSONObject jo= null;
		for(ChartAnimalManage e : list){
			jo=new JSONObject();
			jo.put("name", e.getMid());
			jo.put("y", e.getCnt());
			ja.add(jo);
		}
		System.out.println(ja);
		mav.addObject("chdata",ja);
		return mav;
	}
	
	@RequestMapping(value="surveyChart")
	public ModelAndView surveyChart(){
		ModelAndView mav= new ModelAndView("/survey/surveyupdate");
		/*
		 * [{
	            name: '보기1',
	            data: [5, 3, 4, 7]
	        }, {
	            name: '보기2',
	            data: [2, 2, 3, 2]
	        }, {
	            name: '보기3',
	            data: [3, 4, 4, 2]
	        }]
		 */
		List<SurveyVO> list=cdao.selectallsurvey();
		
		
		JSONArray ja= new JSONArray(); // [    ]
		
		JSONObject j1=new JSONObject();
		JSONObject j2=new JSONObject();
		JSONObject j3=new JSONObject();
		j1.put("name", "보기1");
		j2.put("name", "보기2");
		j3.put("name", "보기2");
		
		JSONArray a1=new JSONArray();
		JSONArray a2=new JSONArray();
		JSONArray a3=new JSONArray();
		
		int size=list.size();
		for(int i=0; i<size; i++){
			
				a1.add(list.get(i).getSub1cnt());
				a2.add(list.get(i).getSub2cnt());
				a3.add(list.get(i).getSub3cnt());
			
		}
		j1.put("data", a1);
		j2.put("data", a2);
		j3.put("data", a3);
		ja.add(j1);
		ja.add(j2);
		ja.add(j3);
		System.out.println(ja);
		mav.addObject("survey",ja);
		return mav;
	}
}
