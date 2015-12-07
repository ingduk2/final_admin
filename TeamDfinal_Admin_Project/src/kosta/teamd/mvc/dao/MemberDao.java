package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.MemRolesVO;
import kosta.teamd.vo.MemberVO;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate template;
	
	//관리자다!
	public List<MemberVO> selectallMember(){
		return template.selectList("member.selectallMember");
	}
	// 아이디 존재유무 체크
		public int midCntCheck(String mid) {
			return template.selectOne("member.midCntCheck", mid);
		}
		
		// 이메일 존재유무 체크
		public int memailCntCheck(String memail) {
			return template.selectOne("member.memailCntCheck", memail);
		}
		
		// 회원 정보 등록
		public void insertMember(MemberVO mvo) {
			
			template.insert("member.insertMember", mvo);
		}
		
		// 회원 권한 등록
		public void insertMemRoles(MemRolesVO mrvo) {
			
			template.insert("member.insertMemRoles", mrvo);
		}
		
		// 회원 정보 삭제
		public void deleteMember(String mid) {
			
			template.delete("member.deleteMember", mid);
		}
		
		// 회원 권한 삭제
		public void deleteMemRoles(String mid) {
			
			template.delete("member.deleteMemRoles", mid);
		}
		
		// -------------------------------------- 회원 탈퇴 시, FK 항목 처리
			public void deleteBcont(String mid) {
				template.delete("member.deleteBcont", mid);
			}
			public void deleteCBcont1(String mid) {
				template.delete("member.deleteCBcont1", mid);
			}
			public void deleteCBcont2(String mid){
				template.delete("member.deleteCBcont2",mid);
			}
		// -------------------------------------- 회원 탈퇴 시, FK 항목 처리
		
		// 회원 정보 검색
		public MemberVO selectMember(String mid) {
			
			return template.selectOne("member.selectMember", mid);
		}
		
		// 회원 권한 검색
		public MemRolesVO selectMemRoles(String mid) {
			
			return template.selectOne("member.selectMemRoles", mid);
		}
		
		// 회원 정보 수정
		public void updateMember(MemberVO mvo) {
			
			template.update("member.updateMember", mvo);
		}
		
		// 회원 제재 상태 풀리는 시간 검색
		public String selectFreetime(String mid) {
			
			return template.selectOne("member.selectFreetime", mid);
		}
		
		// 회원 제재 상태 권한 수정
		public void updateRoleUp(String mid) {
			
			template.update("member.updateRoleUp", mid);
		}
		
		// 회원 아이디 찾기
		public String findMid(MemberVO mvo) {
			return template.selectOne("member.findMid", mvo);
		}
		
		// 회원 비밀번호 찾기 질문 찾기
		public String findMpwdKey(MemberVO mvo) {
			return template.selectOne("member.findMpwdKey", mvo);
		}
		
		// 회원 비밀번호 찾기
		public String findMpwd(MemberVO mvo) {
			return template.selectOne("member.findMpwd", mvo);
		}
		
		// 회원 자신이 작성한 모든 글 검색
		public List<BoardVO> selectAllMine(BoardVO bvo) {
			return template.selectList("member.selectAllMine", bvo);
		}
}