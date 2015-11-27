package kosta.teamd.vo;

public class MemRolesVO {

	// memroles table vo
	
	private String mid;   // 회원 아이디
	private String role;  // 회원 등급
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
}