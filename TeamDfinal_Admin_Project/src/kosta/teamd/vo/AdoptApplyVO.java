package kosta.teamd.vo;

public class AdoptApplyVO {

	// 신청자 아이디, 신청 동물 번호, 담당자 사원 아이디
	private int adoptno;
	public int getAdoptno() {
		return adoptno;
	}
	public void setAdoptno(int adoptno) {
		this.adoptno = adoptno;
	}

	private String mid;
	private int anino;
	private String eid;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getAnino() {
		return anino;
	}
	public void setAnino(int anino) {
		this.anino = anino;
	}
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}

	// 신청자 나이대, 신청 점수
	private String memage;
	private int score;
	
	public String getMemage() {
		return memage;
	}
	public void setMemage(String memage) {
		this.memage = memage;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}

	// 입양 신청 시, 각 질문에 대한 답변
	private String qus1, qus2, qus3, qus4, qus5, qus6, qus7, qus8, qus9, qus10;
	private String qus1sup1, qus2sup1, qus6sup1;

	public String getQus1() {
		return qus1;
	}
	public void setQus1(String qus1) {
		this.qus1 = qus1;
	}
	public String getQus2() {
		return qus2;
	}
	public void setQus2(String qus2) {
		this.qus2 = qus2;
	}
	public String getQus3() {
		return qus3;
	}
	public void setQus3(String qus3) {
		this.qus3 = qus3;
	}
	public String getQus4() {
		return qus4;
	}
	public void setQus4(String qus4) {
		this.qus4 = qus4;
	}
	public String getQus5() {
		return qus5;
	}
	public void setQus5(String qus5) {
		this.qus5 = qus5;
	}
	public String getQus6() {
		return qus6;
	}
	public void setQus6(String qus6) {
		this.qus6 = qus6;
	}
	public String getQus7() {
		return qus7;
	}
	public void setQus7(String qus7) {
		this.qus7 = qus7;
	}
	public String getQus8() {
		return qus8;
	}
	public void setQus8(String qus8) {
		this.qus8 = qus8;
	}
	public String getQus9() {
		return qus9;
	}
	public void setQus9(String qus9) {
		this.qus9 = qus9;
	}
	public String getQus10() {
		return qus10;
	}
	public void setQus10(String qus10) {
		this.qus10 = qus10;
	}
	public String getQus1sup1() {
		return qus1sup1;
	}
	public void setQus1sup1(String qus1sup1) {
		this.qus1sup1 = qus1sup1;
	}
	public String getQus2sup1() {
		return qus2sup1;
	}
	public void setQus2sup1(String qus2sup1) {
		this.qus2sup1 = qus2sup1;
	}
	public String getQus6sup1() {
		return qus6sup1;
	}
	public void setQus6sup1(String qus6sup1) {
		this.qus6sup1 = qus6sup1;
	}
}
