package kosta.teamd.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import kosta.teamd.mvc.dao.AnimalDao;
import kosta.teamd.mvc.inter.ImgBoardInsertInter;
import kosta.teamd.vo.AniBoardVO;
import kosta.teamd.vo.AnimalManageJoinVO;
import kosta.teamd.vo.AnimalManageVO;
import kosta.teamd.vo.AnimalVO;
import kosta.teamd.vo.AnimalsVO;
import kosta.teamd.vo.BoardVO;

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
	
	@RequestMapping(value="/selectallAdminam")
	public ModelAndView selectallAdminam(String mid){
		ModelAndView mav= new ModelAndView("animaltest/adminanimal");
		List<AnimalManageJoinVO> list= adao.getAdminjoinanimalmanage(mid);
		
		mav.addObject("list",list);
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
	
	@RequestMapping(value="formAnimal")
	public ModelAndView formAnimal(){
		ModelAndView mav= new ModelAndView("checkpage/imgboardwrite");
		return mav;
	}
	
	
	@Autowired
	private ImgBoardInsertInter ibinsert;
	
	@RequestMapping(value="/insertImgBoard", method=RequestMethod.POST)
	public ModelAndView insertImgBoard(AnimalVO anivo, BoardVO bvo, HttpServletRequest req) throws Exception {
		
		//사진이 널이다..?
		System.out.println(anivo.getAnisex());
		System.out.println("asdfasdfasdf");
		// 이미지 파일이 있으면 수행
		if (anivo.getManiimg().getSize() > 0) {
			// ----- 이미지 경로 설정 및 업로드 처리 -----
			// 이미지 저장 절대 경로
			HttpSession session = req.getSession();
			String r_path = session.getServletContext().getRealPath("/");
			
			// 시스템에 맞는 DocumentRoot 안에 img폴더 경로 설정
			String img_path = "\\img\\";
			
			// 최상위 경로와 결합
			StringBuffer path = new StringBuffer();
			path.append(r_path).append(img_path);
			
			// upload된 파일의 이름과 결합
			String oriFn = anivo.getManiimg().getOriginalFilename();
			path.append(oriFn);
			
			// upload 이미지의 경로 출력
			System.out.println("Log: [AnimalImgPath] " + path);
					
			// 이미지 upload
			File f = new File(path.toString());
			try {
				anivo.getManiimg().transferTo(f);
			}
			catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			anivo.setAniimg(oriFn);
		}
		// 이미지 파일이 없으면 디폴트 이미지 등록
		else {
			anivo.setAniimg("puppydefault.png");
		}
		
		// anistate 4, 5인 경우, 모든 정보 기입 안한경우 디폴트 처리
//		if (anivo.getAnistate() == 4 || anivo.getAnistate() == 5) {
//			if (anivo.getAnisex().equals("모름")) {
//				System.out.println("전: " + anivo.getAnisex());
//				anivo.setAnisex(" ");
//				System.out.println("후: " + anivo.getAnisex());
//			}
//			
//		}
		
		ibinsert.imgBoardInsert(bvo, anivo);
		
		return new ModelAndView("redirect:/testani");
	}
	
	
}
