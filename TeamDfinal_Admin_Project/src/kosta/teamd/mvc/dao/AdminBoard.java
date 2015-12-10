package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.BoardVO;

@Repository
public class AdminBoard {
	@Autowired
	private SqlSessionTemplate template;
	
	public List<BoardVO> selectallboard2(BoardVO bvo){
		return template.selectList("adminboard.selectallboard2",bvo);
	}
	
	public void deleteBoard(BoardVO bvo){
		template.delete("adminboard.deleteBoard", bvo);
	}
	
	public void deleteAllComm(int bno){
		template.delete("adminboard.deleteAllComm", bno);
	}
	
	public void updateBoard(BoardVO bvo){
		template.update("adminboard.updateBoard",bvo);
	}
	
	public void insertBoard(BoardVO bvo){
		template.insert("adminboard.insertBoard",bvo);
	}
}
