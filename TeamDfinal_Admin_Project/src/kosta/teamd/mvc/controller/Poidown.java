package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.AnimalDao;
import kosta.teamd.vo.AniBoardVO;

@Controller
public class Poidown {
	
	@Autowired
	private AnimalDao adao;
		
		
		@RequestMapping(value="/anilistdown")
		public ModelAndView anipoi(){
			//나중에 VO 변경 및 Dao를 변경해야함 임으로 받아옴.
			List<AniBoardVO> anilist = adao.getImgList();
			return new ModelAndView("excelView", "anilist", anilist);
			
		}
}
