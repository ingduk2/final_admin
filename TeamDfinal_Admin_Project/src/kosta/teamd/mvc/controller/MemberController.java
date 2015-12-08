package kosta.teamd.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.MemberDao;
import kosta.teamd.mvc.inter.MemberDeleteInter;
import kosta.teamd.mvc.inter.MemberInsertInter;
import kosta.teamd.mvc.inter.MemberSelectInter;
import kosta.teamd.mvc.inter.MemberUpdateInter;
import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.MemRolesVO;
import kosta.teamd.vo.MemberVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MemberController {

	@Autowired
	private MemberDao mdao;
	//관리자 멤버 불러오깅..
	@RequestMapping(value="formMember")
	public ModelAndView formMember(){
		ModelAndView mav= new ModelAndView("member/member");
		List<MemberVO> list= mdao.selectallMember();
		mav.addObject("list", list);
		return mav;
	}
	
	@Autowired
	private MemberDeleteInter mdelete2;
	
	@RequestMapping(value="deleteforceMem")
	public ModelAndView deleteforceMem(String mid){
		ModelAndView mav= new ModelAndView("redirect:/formMember");
		try {
			mdelete2.memberDelete(mid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mav;
	}
	//관리자 멤버부르기 비동기 귀차나서 때려침
	public ModelAndView ajaxMember(){
		ModelAndView mav= new ModelAndView("/member/ajaxmember");
		List<MemberVO> list= mdao.selectallMember();
		JSONArray ja= new JSONArray();
		JSONObject jo= null;
		for(MemberVO e : list){
			jo=new JSONObject();
			jo.put("mid", e.getMid());
			jo.put("memail", e.getMemail());
			jo.put("mpwd", e.getMpwd());
			jo.put("mbirth", e.getMbirth());
			jo.put("mtel", e.getMtel());
			jo.put("mroad", e.getMroad());
			jo.put("mrpt", e.getMrpt());
			ja.add(jo);
		}
		mav.addObject("memjson", ja);
		return mav;
	}
	
	// -- 회원 가입 페이지 연결 --
	@RequestMapping(value="/formJoin")
	public String formJoin(Principal prcp) {
			
		// 이미 로그인 한 회원이 회원가입 페이지에 접근하려 할 시 처리
		if (prcp == null) {
			return "member/join";
		}
		else {
			return "index";
		}
	}
	
	// -- 아이디 존재유무 체크 --
	@RequestMapping(value="/midchk")
	public ModelAndView selectchkId(String mid) {
		
		int check = mdao.midCntCheck(mid);
		String resMsg = "";
		
		if (check > 0) {
			resMsg = "이미 존재하는 아이디 입니다.";
		}
		else {
			resMsg = "사용 가능한 아이디 입니다.";
		}
		
		ModelAndView mav = new ModelAndView("checkpage/midchkres");
		mav.addObject("resMsg", resMsg);
		
		return mav;
	}
	
	// -- 이메일 존재유무 체크 --
	@RequestMapping(value="/memailchk")
	public ModelAndView selectchkEmail(String memail) {
		
		int check = mdao.memailCntCheck(memail);
		String resMsg = "";
		
		if (check > 0) {
			resMsg = "이미 존재하는 메일 주소 입니다.";
		}
		else {
			resMsg = "사용 가능한 메일 주소 입니다.";
		}
		
		ModelAndView mav = new ModelAndView("checkpage/memailchkres");
		mav.addObject("resMsg", resMsg);
		
		return mav;
	}
	
	// -- 회원가입 시 비밀번호 동일성 여부 체크 --
	@RequestMapping(value="/mpwdchk")
	public String pwdchkPage() {
		
		return "checkpage/mpwdchk";
	}
	
	// -- 회원 정보, 권한 등록 --
	@Autowired
	private MemberInsertInter minsert;
	
	@RequestMapping(value="/insertMember", method=RequestMethod.POST)
	public ModelAndView insertMember(MemberVO mvo, MemRolesVO mrvo) throws Exception {
		
		mvo.setMimg("UnknownProfile.png"); // 디폴트 프로필 사진 설정
		mvo.setMintro("안녕하세요 ^^"); // 디폴트 프로필 인사말 설정
		
		minsert.memberInsert(mvo, mrvo);
		
		System.out.println("Log: [" + mvo.getMid() + "] 가입");
		
		return new ModelAndView("index");
	}
	
	// -- 회원 탈퇴 페이지 연결 --
	@RequestMapping(value="/formWithdrawal")
	public String formWithdrawal(Principal prcp) {
			
		// 이미 로그인 한 회원이 회원탈퇴 페이지에 접근하려 할 시 처리
		if (prcp == null) {
			return "index";
		}
		else {
			return "member/withdrawal";
		}
	}
	
	// -- 회원 정보, 권한 삭제 --
	@Autowired
	private MemberDeleteInter mdelete;
	
	@RequestMapping(value="/deleteMember")
	public ModelAndView deleteMember(Principal mid, HttpServletRequest request) throws Exception {
		
		// 세션에서 해당 아이디 제거
		HttpSession session = request.getSession();
		session.removeAttribute(mid.getName());
		
		mdelete.memberDelete(mid.getName());
		
		System.out.println("Log: [" + mid.getName() + "] 탈퇴");
		
		return new ModelAndView("index");
	}
	
	// -- 회원 정보 수정 --
	@Autowired
	private MemberUpdateInter mupdate;
	
	@RequestMapping(value="/updateMember", method=RequestMethod.POST)
	public ModelAndView updateMember(MemberVO mvo, HttpServletRequest request) throws Exception {
		
		// 프로필 이미지 파일이 있으면 수행
		if (mvo.getMfile().getSize() > 0) {
			// ----- 이미지 경로 설정 및 업로드 처리 -----
			// 이미지 저장 절대 경로
			HttpSession session = request.getSession();
			String r_path = session.getServletContext().getRealPath("/");
			
			// 시스템에 맞는 DocumentRoot 안에 img폴더 경로 설정
			String img_path = "\\img\\";
			
			// 최상위 경로와 결합
			StringBuffer path = new StringBuffer();
			path.append(r_path).append(img_path);
			
			// upload된 파일의 이름과 결합
			String oriFn = mvo.getMfile().getOriginalFilename();
			path.append(oriFn);
			
			// upload 이미지의 경로 출력
			System.out.println("Log: [ProfileImgPath] " + path);
					
			// 이미지 upload
			File f = new File(path.toString());
			try {
				mvo.getMfile().transferTo(f);
			}
			catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			mvo.setMimg(oriFn);
		}
		
		mupdate.memberUpdate(mvo);
		
		System.out.println("Log: [" + mvo.getMid() + "] 정보 수정");
		
		return new ModelAndView("redirect:/selectoneMember");
	}
	
	// -- 회원 정보 검색 --
	@Autowired
	private MemberSelectInter mselect;
	
	// -- 회원 정보 보기로 연결 --
	@RequestMapping(value="/selectoneMember")
	public ModelAndView selectoneMember(Principal mid) throws Exception {
		
		MemberVO mvo = mselect.memberSelect(mid.getName());
		
		ModelAndView mav = new ModelAndView("member/userinfo");
		mav.addObject("mvo", mvo);
		
		System.out.println("Log: [" + mid.getName() + "] 정보 검색");
		
		return mav;
	}
	
	// -- 회원 정보 수정으로 연결 --
	@RequestMapping(value="/updateformMember")
	public ModelAndView updateformMember(Principal mid) throws Exception {
		
		MemberVO mvo = mselect.memberSelect(mid.getName());
		
		ModelAndView mav = new ModelAndView("member/userupdate");
		mav.addObject("mvo", mvo);
		
		System.out.println("Log: [" + mid.getName() + "] 정보 검색");
		
		return mav;
	}
	
	// -- 나의 활동 페이지 연결 --
	@RequestMapping(value="/selectAllMyActivity")
	public ModelAndView selectMyActivity(BoardVO bvo, Principal prcp) {
		
		bvo.setMid(prcp.getName());
		
		List<BoardVO> mine = mdao.selectAllMine(bvo);
		
		ModelAndView mav = new ModelAndView("member/myactivity");
		mav.addObject("mine", mine);
		
		return mav;
	}
	
	public ModelAndView forcememdelete(){
		ModelAndView mav= new ModelAndView("/member/forcememdelete");
		
		
		return mav;
	}
}