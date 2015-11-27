package kosta.teamd.mvc.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.VapplyDao;
import kosta.teamd.mvc.dao.VolunteerDao;
import kosta.teamd.vo.VapplyVO;
import kosta.teamd.vo.VolunteerJoinVO;
import kosta.teamd.vo.VolunteerVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



@Controller
public class CalController {
	
	@Autowired
	private VolunteerDao vdao;
	@Autowired
	private VapplyDao vadao;
	
	@RequestMapping(value="/formCal")
	public ModelAndView formCal(){
		ModelAndView mav = new ModelAndView("callendar/cal");
		
		List<VolunteerJoinVO> list=vdao.selectJoin();
		System.out.println(list.size());
		mav.addObject("list", list);
		return mav;
	}
	
	//처음에 DB접속해서 바로 AJAX로 요청을 보냄..
	
	@RequestMapping(value="/selectallCal")
	public ModelAndView selectallCal(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("euc-kr");
		ModelAndView mav= new ModelAndView("/callendar/loadcal");
		
		List<VolunteerVO> list=vdao.select();

		JSONObject jo= new JSONObject();
		JSONArray ja= new JSONArray();
		JSONObject vol=null;
		StringBuffer sb= new StringBuffer();
		
		for(VolunteerVO e : list){
			vol=new JSONObject();// { //[
			//stringbuffer로 바꾸기.?
			System.out.println(e.getVolunteerno());
			System.out.println(vol);
			
			vol.put("title", 
					sb.append(e.getVolunteerno())
					.append(".").append(e.getVolunteertitle())
					.toString());
			vol.put("start", e.getVolunteerstart());
			vol.put("end", e.getVolunteerend());
			vol.put("backgroundColor", "green");
			ja.add(vol);
			sb.delete(0, sb.length());
		}
		
//		int size=list.size();
//		for(int i=0; i<size; i++){
//			vol=new JSONObject();
//			vol.put(list.get(i).getClass(), value)
//		}
		
		mav.addObject("json", ja);
		System.out.println(ja);
		return mav;
		
		
	}
	
	@RequestMapping(value="/insertCal", method=RequestMethod.POST)
	public ModelAndView insertCal(VolunteerVO vo){
		System.out.println("Log : insert cal!");
		ModelAndView mav= new ModelAndView("/callendar/calinsert");
		System.out.println(vo.getVolunteertitle());
		int seq=vdao.insert(vo);
		
		mav.addObject("msg",Integer.toString(seq));
		return mav;
	}
	
	//관리자용 지우개
	@RequestMapping(value="/deleteCal" , method= RequestMethod.POST)
	public ModelAndView deleteCal(int seq){
		System.out.println("delete cal");
		ModelAndView mav= new ModelAndView("/callendar/deletecal");
		vadao.deleteVa(seq);
		vdao.delete(seq);
		
		mav.addObject("msg","success");
		return mav;
	}
	
	@RequestMapping(value="/insertdeleteCal")
	public ModelAndView insertdeleteCal(VapplyVO vo){
		ModelAndView mav= new ModelAndView("/callendar/applyservice");
		
		
		System.out.println(vo.getMemid());
		System.out.println(vo.getVolunteerno());
		//두 서비스를 구분하기 위해서 이 사람의 이봉사번호로
		//봉사가 있는지 확인한다.
		// memid와 volunteerno로
		//cnt를 얻어온다.
		String msg="";
		int cnt=vadao.getcnt(vo);
		 if(cnt>0){ //봉사가 있는상태다.. 그러면 지우는거임!!
			vadao.deleteOne(vo);
			msg="delete";
		 }else{ // 봉사가 없는 상태다.. 그러면 인서트 하는것임!!
			 vadao.insertVa(vo);
			 msg="insert";
		 }
		
		mav.addObject("msg" , msg);
		return mav;
		
	}
}
