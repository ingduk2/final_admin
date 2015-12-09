package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.AnimalVO;
import kosta.teamd.vo.ImgBoardVO;

@Repository
public class ImgBoardDao {

	@Autowired
	private SqlSessionTemplate template;
	
	// 동물 정보 등록
	public void animalInsert(AnimalVO anivo) {
		template.insert("imgboard.animalInsert", anivo);
	}
	
	// 이미지 게시판 리스트 호출
}
