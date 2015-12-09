package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.MonthVO;

@Repository
public class MainDao {

	@Autowired
	private SqlSessionTemplate template;

	public int mainMemberCnt() {
		return template.selectOne("main.mainmembercnt");
	}

	public int mainBoardCnt() {
		return template.selectOne("main.mainboardcnt");
	}

	public int mainAniamlrCnt() {
		return template.selectOne("main.mainanimalcnt");
	}

	public List<MonthVO> month0() {
		return template.selectList("main.month0");
	}

	public List<MonthVO> month3() {
		return template.selectList("main.month3");
	}

	public List<MonthVO> month4() {
		return template.selectList("main.month4");
	}

	public List<MonthVO> month5() {
		return template.selectList("main.month5");
	}

}
