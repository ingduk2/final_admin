package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.AnimalDao;
import kosta.teamd.vo.AniBoardVO;
import kosta.teamd.vo.AnimalManageVO;
import kosta.teamd.vo.AnimalVO;
import kosta.teamd.vo.AnimalsVO;

@Controller
public class AnimalController {
	
	@Autowired
	private AnimalDao adao;
	
	
	@RequestMapping(value="updateAniState")
	public ModelAndView updateAniState(AnimalVO avo){
		System.out.println(avo.getAnistate());
		System.out.println(avo.getAnino());
		ModelAndView mav=new ModelAndView("/animaltest/updateanistate");
		adao.updateAniState(avo);
		mav.addObject("anistate", "success");
		return mav;
		
	}
	
	
	@RequestMapping(value="insertAnimalManage")
	public ModelAndView insertAnimalManage(AnimalManageVO amvo){
		ModelAndView mav= new ModelAndView("/animaltest/insertanimalmanage");
		System.out.println("insertAnimalManage");
		adao.insertAnimalManage(amvo);
		mav.addObject("msg","sucess");
		return mav;
	}
	
	//패스베리어블이삼함 ㅡㅡ
//	@RequestMapping(value="/selectallanimalmanage/{id}")
//	public ModelAndView selectallanimalmanage(@PathVariable("id") String mid){
	@RequestMapping(value="/selectallanimalmanage")
	public ModelAndView selectallanimalmanage(String mid){
	
		System.out.println("pathid : "+mid);
		ModelAndView mav= new ModelAndView("animaltest/imgboardlist");
		
		AnimalManageVO amvo= new AnimalManageVO();
		amvo.setMid(mid);
		//List<AniBoardVO> listjoin = adao.getImgList();
		List<AniBoardVO> listjoin = adao.getAnimalManageJoin(mid);
		List<AnimalManageVO> listam= adao.selectallanimalmanage(amvo);
		System.out.println(listam.size());
		mav.addObject("listam",listam);
		mav.addObject("listjoin",listjoin);
		mav.addObject("size",listjoin.size());
		return mav;
	}
	
	//String a = "rice011"
	@RequestMapping(value="/updateAnimalManage")
	public ModelAndView updateAnimalManage(AnimalManageVO amvo){
		ModelAndView mav= new ModelAndView("/animaltest/updateAnimalManage");
		
		//code로 들고가서 다이나믹쿼리로 조짐!
		//code를 뒤에 숫자는 잘라야함..
		
		if(amvo.getCode().matches("rice.*")){
			amvo.setCode("rice");
		}else if(amvo.getCode().matches("bath.*")){
			amvo.setCode("bath");
		}else if(amvo.getCode().matches("spo.*")){
			amvo.setCode("spo");
		}
		
		adao.updateAnimalManage(amvo);
		mav.addObject("msg","success");
		return mav;
		
	}
	
	
}
