package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.CenterVO;



@Repository
public class CenterDao {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public void insert(CenterVO vo){
		template.insert("center.insert",vo);
	}
	
	public List<CenterVO> list(BoardVO bvo){
		return template.selectList("center.list",bvo);
	}
	
	public void deleteCenter(int cnum){
		template.delete("center.deleteCenter",cnum);
		
	}
	
}
