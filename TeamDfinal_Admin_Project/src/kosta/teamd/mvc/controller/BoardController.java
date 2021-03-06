package kosta.teamd.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import kosta.teamd.mvc.dao.AdminBoard;
import kosta.teamd.mvc.dao.MainDao;
import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.SaveVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class BoardController {
	
	@Autowired
	private AdminBoard abdao;
	
	@Autowired
	private MainDao maindao;
	
	@RequestMapping(value="formBoard")
	public ModelAndView formBoard(){
		ModelAndView mav= new ModelAndView("board/adminboard");
		BoardVO bvo= new BoardVO();
		bvo.setBcode(1);
		List<BoardVO> list1=abdao.selectallboard2(bvo);
		mav.addObject("list1",list1);
		bvo.setBcode(2);
		List<BoardVO> list2=abdao.selectallboard2(bvo);
		mav.addObject("list2",list2);
		bvo.setBcode(3);
		List<BoardVO> list3=abdao.selectallboard2(bvo);
		mav.addObject("list3",list3);
		bvo.setBcode(10);
		List<BoardVO> list10=abdao.selectallboard2(bvo);
		mav.addObject("list10",list10);
		
		
		
		SaveVO svo= maindao.selectsave();
		int mainboardcnt = maindao.mainBoardCnt();
		SaveVO save= new SaveVO();
		save.setMemcnt(svo.getMemcnt());
		save.setBoardcnt(svo.getBoardcnt());
		save.setAnimalcnt(svo.getAnimalcnt());
		save.setBoardcnt(mainboardcnt);
		maindao.updatesave(save);
		
		return mav;
		
	}
	
	//bcode2 ajax
	@RequestMapping(value="selectallboard")
	public @ResponseBody String boardajax(BoardVO bvo){
		//ModelAndView mav= new ModelAndView("/board/adminboard");
		List<BoardVO> list= abdao.selectallboard2(bvo);
		JSONArray ja= new JSONArray();
		JSONObject jo= null;
		
		for(BoardVO e:list){
			jo=new JSONObject();
			jo.put("bno", e.getBno());
			jo.put("btitle", e.getBtitle());
			jo.put("mid", e.getMid());
			jo.put("bdate", e.getBdate());
			ja.add(jo);
		}
		
		//System.out.println(ja);
		String jsonData=ja.toString();
		System.out.println(jsonData);
		return jsonData;
	}
	
	//delete Board
	@RequestMapping(value="/deleteBoard")
	public ModelAndView deleteBoard(BoardVO bvo){ //bno 필요\
		ModelAndView mav= new ModelAndView("redirect:/formBoard");
		System.out.println("Log : deleteBoard : " + bvo.getBno());
		abdao.deleteAllComm(bvo.getBno());
		abdao.deleteBoard(bvo);
		return mav;
	}
	
	//신고글 되돌리는 기능?
	@RequestMapping(value="/updateBoard")
	public ModelAndView updateBoard(BoardVO bvo){ //boricode, bno
		ModelAndView mav= new ModelAndView("redirect:/formBoard");
		abdao.updateBoard(bvo);
		return mav;
	}
	
	@RequestMapping(value="formWrite")
	public ModelAndView formWrite(){
		ModelAndView mav= new ModelAndView("checkpage/boardwrite");
		return mav;
	}
	
	
	@RequestMapping(value="insertadBoard", method=RequestMethod.POST)
	public ModelAndView insertBoard(BoardVO bvo , HttpServletRequest request){
		ModelAndView mav= new ModelAndView("redirect:/formBoard");
		System.out.println("btitle : " + bvo.getBtitle());
		
		HttpSession session=request.getSession();
		String r_path=session.getServletContext().getRealPath("/");
		
		StringBuffer sb=new StringBuffer();
		sb.append(r_path).append("\\img\\");
		
		String originalFile=bvo.getMfile().getOriginalFilename();
		sb.append(originalFile);
		
		File file=new File(sb.toString());
		
		try {
			bvo.getMfile().transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		bvo.setBfile(originalFile);
		
		
		abdao.insertBoard(bvo);
		return mav;
	}
	
	@RequestMapping(value="formTest")
	public ModelAndView formTest(){
		ModelAndView mav= new ModelAndView("board/test");
		return mav;
	}
	
	
}
