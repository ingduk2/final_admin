package kosta.teamd.mvc.imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.teamd.mvc.dao.BoardDao;
import kosta.teamd.mvc.dao.ImgBoardDao;
import kosta.teamd.mvc.inter.ImgBoardDeleteInter;
import kosta.teamd.mvc.inter.ImgBoardInsertInter;
import kosta.teamd.mvc.inter.ImgBoardUpdateInter;
import kosta.teamd.vo.AnimalVO;
import kosta.teamd.vo.BoardVO;

@Service
public class ImgBoardImple
			 implements ImgBoardInsertInter, ImgBoardDeleteInter, ImgBoardUpdateInter {

	@Autowired
	private ImgBoardDao ibdao;
	@Autowired
	private BoardDao bdao;
	
	@Transactional
	@Override
	public void imgBoardInsert(BoardVO bvo, AnimalVO anivo) throws Exception {

		ibdao.animalInsert(anivo);
		
		int anino = anivo.getAnino();
		bvo.setAnino(anino);
		
		bdao.insertImgBoard(bvo);
	}
	
	@Override
	public void imgBoardDelete(int anino) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void imgBoardUpdate(BoardVO bvo, AnimalVO anivo) throws Exception {
		// TODO Auto-generated method stub
		
	}
}
