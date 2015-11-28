package kosta.teamd.mvc.inter;

import kosta.teamd.vo.MemRolesVO;
import kosta.teamd.vo.MemberVO;

public interface MemberInsertInter {

	public void memberInsert(MemberVO mvo, MemRolesVO mrvo) throws Exception;
}