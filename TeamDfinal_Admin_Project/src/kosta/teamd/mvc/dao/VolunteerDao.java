package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.VolunteerJoinVO;
import kosta.teamd.vo.VolunteerVO;


@Repository
public class VolunteerDao {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int insert(VolunteerVO vo){
		template.insert("vol.insertcal", vo);
		int seq=vo.getVolunteerno();
		return seq;
	}
	
	public List<VolunteerVO> select(){
		return template.selectList("vol.selectcal");
	}
	
	public void delete(int seq){
		template.delete("vol.deletecal",seq);
	}
	
	public List<VolunteerJoinVO> selectJoin(){
		return template.selectList("vol.selectjoin");
	}
}
