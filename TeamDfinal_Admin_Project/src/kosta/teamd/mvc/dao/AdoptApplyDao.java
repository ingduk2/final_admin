package kosta.teamd.mvc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.AdoptApplyVO;

@Repository
public class AdoptApplyDao {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public void insertAdopt(AdoptApplyVO adavo){
		template.insert("adopt.insertadopt", adavo);
	}
	public List<AdoptApplyVO> selectallAdopt(){
		return template.selectList("adopt.selectalladopt");
	}
	public AdoptApplyVO selectoneAdopt(int adopno){
		return template.selectOne("adopt.selectoneadopt",adopno);
	}
}
