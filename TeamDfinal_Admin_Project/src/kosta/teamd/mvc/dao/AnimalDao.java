package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.AniBoardVO;
import kosta.teamd.vo.AnimalManageVO;
import kosta.teamd.vo.AnimalVO;
import kosta.teamd.vo.BoardVO;

@Repository
public class AnimalDao{
	

	@Autowired
	private SqlSessionTemplate ss;
	
	// insert 이미지게시판 내용
	public void imgInsert(AnimalVO avo) {
		ss.insert("animal.imgins", avo);
	}
	
	//  이미지게시판 리스트 출력
	public List<AniBoardVO> getImgList(){
		return ss.selectList("animal.imglist");
	}
	
	
	// 이미지게시판 상세보기 출력
	public AniBoardVO imgDetail(int anino){
		return ss.selectOne("animal.imgdetail", anino);
	}
	
	// 이미지게시판 삭제
	public void imgDelete(int anino){
		ss.delete("animal.imgdelete", anino);
	}
	
	//이미지게시판 업데이트
	public void imgUpdate(AnimalVO avo){
		ss.update("animal.imgupdate", avo);
	}
	
	//서치값이랑 합쳐야함.
	public int imgCnt(){
	  return ss.selectOne("animal.imgcnt");
	}
	
	
	
	//관리자용
	public void updateAniState(AnimalVO avo){
		ss.update("animal.updateAniState",avo);
		
	}
	
	public void insertAnimalManage(AnimalManageVO amvo){
		ss.insert("animal.insertanimalmanage",amvo);
	}
	
	public List<AnimalManageVO> selectallanimalmanage(AnimalManageVO amvo){
		System.out.println("Log");
		return ss.selectList("animal.selectallanimalmanage", amvo);
		
	}
	
	//관리자용 동물 조인!!
		
		public List<AniBoardVO> getAnimalManageJoin(String mid){
			return ss.selectList("animal.animalmanagejoin", mid);
		}
		
		//동물 밥주기 업데이트!
		public void updateAnimalManage(AnimalManageVO amvo){
			ss.update("animal.updateAnimalManage",amvo);
		}
}
