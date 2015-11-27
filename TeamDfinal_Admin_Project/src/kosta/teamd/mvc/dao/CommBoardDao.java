package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.CommBoardVO;

@Repository
public class CommBoardDao {

	//진우형 댓
	@Autowired
	private SqlSessionTemplate ss;
	
	public void commInsert(CommBoardVO cbvo){
		ss.insert("commboard.commins", cbvo);
	}
	
	public List<CommBoardVO> commList(int bno){
		return ss.selectList("commboard.commlist", bno);
	}
	
	public CommBoardVO commDetail(int bno, int cbno){
		return ss.selectOne("commboard.commdetail", bno);
	}
	
	public void commDelete(int cbno){
		ss.delete("commboard.commdelete", cbno);
	}
	
	public void commUpdate(CommBoardVO cbvo){
		ss.update("commboard.commupdate", cbvo);
	}
	
	////


	@Autowired
	private SqlSessionTemplate template;
	
	public void insertCommBoard(CommBoardVO cbvo){
		template.insert("comm.insertComm", cbvo);
	}
	public List<CommBoardVO> selectCommBoard(int bno){
		return template.selectList("comm.getCommlist", bno);
	}
	public void deleteComm(int cbno){
		template.delete("comm.deleteComm", cbno);
	}
	
	
}
