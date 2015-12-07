package kosta.teamd.mvc.imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.teamd.mvc.dao.MemberDao;
import kosta.teamd.mvc.inter.MemberDeleteInter;
import kosta.teamd.mvc.inter.MemberInsertInter;
import kosta.teamd.mvc.inter.MemberSelectInter;
import kosta.teamd.mvc.inter.MemberUpdateInter;
import kosta.teamd.vo.MemRolesVO;
import kosta.teamd.vo.MemberVO;

@Service
public class MemberImple 
			 implements MemberInsertInter, MemberDeleteInter, MemberUpdateInter, MemberSelectInter {

	@Autowired
	private MemberDao mdao;

	// @Transactional을 이용한 메서드 단위 처리
	@Transactional
	@Override
	public void memberInsert(MemberVO mvo, MemRolesVO mrvo) throws Exception {
			
		mdao.insertMember(mvo);
		mdao.insertMemRoles(mrvo);
	}
	
	// @Transactional을 이용한 메서드 단위 처리
	@Transactional
	@Override
	public void memberDelete(String mid) throws Exception {
		
		// -------------------------------------- 회원 탈퇴 시, FK 항목 처리
			mdao.deleteCBcont1(mid);
			mdao.deleteCBcont2(mid);
			mdao.deleteBcont(mid);
		// -------------------------------------- 회원 탈퇴 시, FK 항목 처리
		
		mdao.deleteMember(mid);
		mdao.deleteMemRoles(mid);
	}
	
	@Override
	public void memberUpdate(MemberVO mvo) throws Exception {
		
		mdao.updateMember(mvo);
	}

	@Override
	public MemberVO memberSelect(String mid) throws Exception {

		MemberVO mvo = mdao.selectMember(mid);
		
		return mvo;
	}
}
