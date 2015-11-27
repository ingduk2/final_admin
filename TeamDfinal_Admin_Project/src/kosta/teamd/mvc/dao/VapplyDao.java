package kosta.teamd.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.VapplyVO;



@Repository
public class VapplyDao {
	@Autowired
	private SqlSessionTemplate template;
	
	public void deleteVa(int seq){
		template.delete("vapply.delete",seq);
	}
	
	public void deleteOne(VapplyVO vo){
		template.delete("vapply.deleteone",vo);
	}
	
	public void insertVa(VapplyVO vo){
		template.insert("vapply.insert",vo);
	}
	
	public int getcnt(VapplyVO vo){
		return template.selectOne("vapply.cnt", vo);
	}
	
	
}
