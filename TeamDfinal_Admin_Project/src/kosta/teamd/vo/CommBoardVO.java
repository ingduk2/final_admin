package kosta.teamd.vo;

public class CommBoardVO {

	// commboard table vo
	
	private int cbno;          // 댓글 번호
	private int bno;           // 원본 글 번호
	private String cbcontent;  // 댓글 내용
	private String mid;        // 댓글 작성자(회원 아이디)
	private String cbip;       // 작성자 IP
	private String cbdate;     // 댓글 작성 일자
	private int cbrpt;         // 신고당한 횟수
	
	public int getCbno() {
		return cbno;
	}
	public void setCbno(int cbno) {
		this.cbno = cbno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getCbcontent() {
		return cbcontent;
	}
	public void setCbcontent(String cbcontent) {
		this.cbcontent = cbcontent;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getCbip() {
		return cbip;
	}
	public void setCbip(String cbip) {
		this.cbip = cbip;
	}
	public String getCbdate() {
		return cbdate;
	}
	public void setCbdate(String cbdate) {
		this.cbdate = cbdate;
	}
	public int getCbrpt() {
		return cbrpt;
	}
	public void setCbrpt(int cbrpt) {
		this.cbrpt = cbrpt;
	}
}
