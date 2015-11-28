package kosta.teamd.mvc.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.MemberDao;
import kosta.teamd.mvc.inter.MemRolesSelectInter;
import kosta.teamd.vo.MemRolesVO;
import kosta.teamd.vo.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	private MemberDao mdao;

	// -- 로그인 페이지 연결 --
	@RequestMapping(value="/login")
	public String formLogin(Principal prcp, HttpServletRequest request) {
		
		// 이미 로그인 한 회원이 로그인 페이지에 접근하려 할 시 처리
		if (prcp == null) {
			return "member/login";
		}
		else {
			return "index";
		}
	}
	
	// -- 로그인 시 제재 상태 체크 --
	@Autowired
	private MemRolesSelectInter mrselect;
	
	@RequestMapping(value="/mfreetimecheck")
	public String selectoneFreeTime(Principal mid) throws Exception {
		
		String freetime = mdao.selectFreetime(mid.getName());
		MemRolesVO mrvo = mrselect.memrolesSelect(mid.getName());
		
		if (mrvo.getRole().equals("Criminal")) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
			String now = sdf.format(new Date());
			
			System.out.println("Log: Now [" + now + "]");
			System.out.println("Log: FreeTime [" + freetime + "]");
			
			long chk = Long.parseLong(now) - Long.parseLong(freetime.trim());

			if (chk >= 0) {
				mdao.updateRoleUp(mid.getName());
			}
		}
		
		return "index";
	}
	
	// -- 아이디 찾기 --
	@RequestMapping(value="/findmid")
	public ModelAndView selectoneMid(MemberVO mvo) {
		
		String result = "";
		
		if (mvo.getMname().length() == 0 || mvo.getMemail().length() == 0 || mvo.getMtel().length() == 0) {
			result = "값을 모두 입력해주세요.";
		}
		else {
			
			String mid = mdao.findMid(mvo);
			
			if (mid == null) {
				result = "해당하는 아이디가 존재하지 않습니다.";
			}
			else {
				int len = mid.length();
				
				mid = mid.substring(0, (len/2));
				
				for(int i=0; i<len/2; i++) {
					mid += "*";
				}
				
				result = "회원님의 아이디는 [" + mid + "] 입니다.";
			}
		}
		
		ModelAndView mav = new ModelAndView("checkpage/findmidres");
		mav.addObject("result", result);
		
		return mav;
	}
	
	// -- 비밀번호 찾기 질문 찾기 --
	@RequestMapping(value="/findmpwdkey")
	public ModelAndView selectonePwdKey(MemberVO mvo) {
		
		String result = "";
		
		if (mvo.getMid().length() == 0 || mvo.getMemail().length() == 0) {
			result = "값을 모두 입력해주세요."; 
		}
		else {
			
			String mpwdkey = mdao.findMpwdKey(mvo);
			
			if (mpwdkey == null) {
				result = "해당하는 정보가 존재하지 않습니다.";
			}
			else {
				result = mpwdkey;
			}
		}
		
		ModelAndView mav = new ModelAndView("checkpage/findmpwdkeyres");
		mav.addObject("result", result);
		
		return mav;
	}
	
	//비밀번호 찾기
	@RequestMapping(value="/findmpwd")
	public ModelAndView selectonePwd(MemberVO mvo) {
		
		String result = "";
		
		if (mvo.getMid().length() == 0 || mvo.getMemail().length() == 0 || mvo.getMpwdval().length() == 0) {
			result = "값을 모두 입력해주세요.";
		}
		else {
			
			// 여기서 이메일을 보내주는 로직을 짜야허는디...............................!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			// 여기서 이메일을 보내주는 로직을 짜야허는디...............................!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			// 여기서 이메일을 보내주는 로직을 짜야허는디...............................!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			// 여기서 이메일을 보내주는 로직을 짜야허는디...............................!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			// 여기서 이메일을 보내주는 로직을 짜야허는디...............................!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			
			String mpwd = mdao.findMpwd(mvo);
			
			if (mpwd == null) {
				result = "해당하는 정보가 존재하지 않습니다.";
			}
			else {
				System.out.println("Log: 비밀번호 [" + mpwd + "]");
				
				result = "가입하신 이메일 주소로 비밀번호를 보내드렸습니다.";
			}
		}
		
		ModelAndView mav = new ModelAndView("checkpage/findmpwdres");
		mav.addObject("result", result);
		
		return mav;
	}
}
