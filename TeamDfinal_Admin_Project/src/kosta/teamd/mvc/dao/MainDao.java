package kosta.teamd.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDao {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int mainMemberCnt(){
		return template.selectOne("main.mainmembercnt");
	}
	public int mainBoardCnt(){
		return template.selectOne("main.mainboardcnt");
	}
	public int mainAniamlrCnt(){
		return template.selectOne("main.mainanimalcnt");
	}
	
	
	
}
