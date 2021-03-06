package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.EmployeeDao;
import kosta.teamd.vo.EmployeeJoinVO;
import kosta.teamd.vo.EmployeeVO;
import kosta.teamd.vo.MemberVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeDao edao;
	
	@RequestMapping(value="formEmployee")
	public ModelAndView formEmployee(){
		return new ModelAndView("employee/employee");
	}
	
	@RequestMapping(value="selectallEmployee")
	public ModelAndView selectallEmployee(String code){
		ModelAndView mav= new ModelAndView("/employee/listemployee");
		
		//승인
		List<MemberVO> list=null;
		if(code.equals("yes")){
			list= edao.selectyesEmployee();
			//mav.addObject("list",list);
		}else{//비승인 no
			list= edao.selectnoEmployee();
			//mav.addObject("list",list);
		}
		
		JSONArray ja= new JSONArray(); //[ ]
		JSONObject jo= null; // { }
		for(MemberVO e : list){
			jo=new JSONObject();
			jo.put("mid", e.getMid());
			jo.put("mname", e.getMname());
			jo.put("memail", e.getMemail());
			jo.put("mpwd", e.getMpwd());
			jo.put("mbirth", e.getMbirth());
			ja.add(jo);
		}
		
//		System.out.println(listn.size());
//		System.out.println(listy.size());
		
		//json변환.
		System.out.println(ja);
		mav.addObject("list",ja);
		
		return mav;
	}
	
	//!통합 가능..!
	//인에이블 0 -> 1
	@RequestMapping(value="updateyesEmployee")
	public ModelAndView updateyesEmployee(String mid){
		ModelAndView mav= new ModelAndView("/employee/updateemployee");
		edao.updateyesEmployee(mid);
		mav.addObject("employee","yes");
		return mav;
	}
	
	//인에이블 1->0
	@RequestMapping(value="updatenoEmployee")
	public ModelAndView updatenoEmployee(String mid){
		ModelAndView mav= new ModelAndView("/employee/updateemployee");
		edao.updatenoEmployee(mid);
		mav.addObject("employee","no");
		return mav;
	}
	
	@RequestMapping(value="selectpossibleEmployee")
	public ModelAndView selectpossibleEmployee(){
		ModelAndView mav= new ModelAndView("animaltest/");
		List<MemberVO> listy= edao.selectyesEmployee();
		
		//배열로.
//		String[] possible_employee=null;
//		int size=listy.size();
//		for(int i=0; i<size; i++){
//			possible_employee[i]=listy.get(i).getMid();
//		}
//		StringBuffer sb= new StringBuffer();
//		sb.append("<option>선택</option>");
//		for(MemberVO e: listy){
//			sb.append("<option value=").append(e.getMid()).append(">")
//			.append(e.getMid()).append("</option>\n");
//		}
		
//		System.out.println(possible_employee);
		
		mav.addObject("listy",listy);
		return mav;
		
	}
	
//	@RequestMapping(value="updateEmployee")
//	public ModelAndView updateEmployee(EmployeeVO emvo, int code){
//		ModelAndView mav= new ModelAndView("redirect:/selectallEmployee");
//		//직급 월 업데이트!
//		if(code==0){
//			edao.insertEmployee(emvo);
//		}else{
//		edao.updateEmployee(emvo);
//		}
//		return mav;
//		
//	}
	
}
