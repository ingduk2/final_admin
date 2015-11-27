package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.AnimalsVO;

@Repository
public class AnimalsDao {

	@Autowired
	private SqlSessionTemplate ss;
	
	public List<AnimalsVO> selectallCnt(){
		return ss.selectList("animal.anispectes");
	}
	
	public List<AnimalsVO> selectallanisCnt(){
		return ss.selectList("animal.anis");
	}
}
