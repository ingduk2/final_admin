package kosta.teamd.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.teamd.mvc.dao.AnimalDao;
import kosta.teamd.mvc.dao.BoardDao;
import kosta.teamd.vo.AnimalVO;
import kosta.teamd.vo.BoardVO;

@Service
public class AnimalService implements AniboardImple {
	
	@Autowired
	private AnimalDao adao;
	@Autowired
	private BoardDao bdao;
	
	
	@Transactional
	@Override
	public void insert(BoardVO bvo, AnimalVO avo) {
		adao.imgInsert(avo);
		int anino =avo.getAnino();
		System.out.println(anino);
		bvo.setAnino(anino);
		bdao.imgInsert(bvo);
	}


	@Transactional
	@Override
	public void delete(int anino) {	
		System.out.println("삭제 트렌젝셔날: " +anino);
		bdao.imgDelete(anino);
		adao.imgDelete(anino);
	}

	@Transactional
	@Override
	public void update(BoardVO bvo, AnimalVO avo) {
		adao.imgUpdate(avo);
		bdao.imgUpdate(bvo);
	}
	
	
}
