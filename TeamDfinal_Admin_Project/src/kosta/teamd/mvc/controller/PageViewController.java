package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.BoardDao;
import kosta.teamd.mvc.dao.EmployeeDao;
import kosta.teamd.mvc.dao.MainDao;
import kosta.teamd.mvc.dao.SurveyDao;
import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.EmployeeVO;
import kosta.teamd.vo.MemberVO;
import kosta.teamd.vo.MonthVO;
import kosta.teamd.vo.SurveyVO;
import net.sf.json.JSONArray;

@Controller
public class PageViewController {

	@Autowired
	private BoardDao bdao;

	@Autowired
	private SurveyDao sdao;

	@Autowired
	private EmployeeDao edao;

	@Autowired
	private MainDao maindao;

	@RequestMapping(value = { "/", "index" })
	public ModelAndView a() {
		ModelAndView mav = new ModelAndView("index");
		List<MemberVO> list = edao.selectMainEmployee();

		int mainmembercnt = maindao.mainMemberCnt();
		int mainboardcnt = maindao.mainBoardCnt();
		int mainanimalcnt = maindao.mainAniamlrCnt();
		
		mav.addObject("list",list);
		mav.addObject("mainmembercnt", mainmembercnt);
		mav.addObject("mainboardcnt", mainboardcnt);
		mav.addObject("mainanimalcnt", mainanimalcnt);

		return mav;
	}

	// ajax 메인 월 차트

	@RequestMapping(value = "monthajax")
	public ModelAndView month() {
		ModelAndView mav = new ModelAndView("/chart/chartdata");

		/*
		 * data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4,
		 * 194.1, 95.6, 54.4]
		 */
		int[] a_ = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
		int[] b_ = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
		int[] c_ = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
		int[] d_ = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

		List<MonthVO> a = maindao.month0();
		List<MonthVO> b = maindao.month3();
		List<MonthVO> c = maindao.month4();
		List<MonthVO> d = maindao.month5();
		System.out.println("size : "+ a.size()+","+b.size()+","+c.size()+","+d.size());
		System.out.println(b.get(0).getCnt());
		int locate = 0;
		if (a.size() != 0) {
			for (MonthVO e : a) {
				locate = Integer.parseInt(e.getAnidate().split("-")[1])-1;
				a_[locate] = e.getCnt();
			}
		}
		if (b.size() != 0) {
			for (MonthVO e : b) {
				locate = Integer.parseInt(e.getAnidate().split("-")[1])-1;
				b_[locate] = e.getCnt();
				System.out.println("-0-0- : " +b_[locate]);
			}
		}
		if (c.size() != 0) {
			for (MonthVO e : c) {
				locate = Integer.parseInt(e.getAnidate().split("-")[1])-1;
				c_[locate] = e.getCnt();
			}
		}
		if (d.size() != 0) {
			for (MonthVO e : d) {
				locate = Integer.parseInt(e.getAnidate().split("-")[1])-1;
				d_[locate] = e.getCnt();
			}
		}

		JSONArray ja = new JSONArray();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 12; i++) {
			ja.add(a_[i]);
		}
		sb.append(ja.toString()).append("/");
		ja=new JSONArray();
		for (int i = 0; i < 12; i++) {
			ja.add(b_[i]);
		}
		sb.append(ja.toString()).append("/");
		ja=new JSONArray();
		for (int i = 0; i < 12; i++) {
			ja.add(c_[i]);
		}
		sb.append(ja.toString()).append("/");
		ja=new JSONArray();
		for (int i = 0; i < 12; i++) {
			ja.add(d_[i]);
		}
		sb.append(ja.toString());
		// 월을 숫자로 바꿈.
//		int size = 0;
//		try {
//			size = Integer.parseInt(a.get(0).getAnidate().split("-")[1]);
//			for (int i = 0; i < size - 1; i++) { // 11 이니까 10까지 오고
//				ja.add(0);
//			}
//			for (MonthVO e : a) {
//				ja.add(e.getCnt());
//			}
//			sb.append(ja.toString()).append("/");
//
//			ja = new JSONArray();
//			size = Integer.parseInt(b.get(0).getAnidate().split("-")[1]);
//			for (int i = 0; i < size - 1; i++) { // 11 이니까 10까지 오고
//				ja.add(0);
//			}
//			for (MonthVO e : b) {
//				ja.add(e.getCnt());
//			}
//			sb.append(ja.toString()).append("/");
//
//			ja = new JSONArray();
//			size = Integer.parseInt(c.get(0).getAnidate().split("-")[1]);
//			for (int i = 0; i < size - 1; i++) { // 11 이니까 10까지 오고
//				ja.add(0);
//			}
//			for (MonthVO e : c) {
//				ja.add(e.getCnt());
//			}
//			sb.append(ja.toString()).append("/");
//
//			ja = new JSONArray();
//			size = Integer.parseInt(d.get(0).getAnidate().split("-")[1]);
//			for (int i = 0; i < size - 1; i++) { // 11 이니까 10까지 오고
//				ja.add(0);
//			}
//			for (MonthVO e : d) {
//				ja.add(e.getCnt());
//			}
//			sb.append(ja.toString());
//
//		} catch (Exception e) {
//			// TODO: handle exception
//
//		}

		System.out.println(sb.toString());
		mav.addObject("chdata", sb.toString());
		return mav;
	}

	// 디나이 페이지
	@RequestMapping(value = "/denied")
	public String formDenied() {
		return "denied";
	}

}
