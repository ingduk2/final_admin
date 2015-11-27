package kosta.teamd.mvc.service;

import kosta.teamd.vo.AnimalVO;
import kosta.teamd.vo.BoardVO;

public interface AniboardImple {
	
//	//동물게시판 insert 
	public void insert(BoardVO bvo, AnimalVO avo);

//	//동물게시판 delete
	public void delete(int anino);
	
	//동물게시판 update
	public void update(BoardVO bvo, AnimalVO avo);
	
}
