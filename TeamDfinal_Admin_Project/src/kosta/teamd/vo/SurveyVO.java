package kosta.teamd.vo;

public class SurveyVO {
	private int num,code, sub1cnt, sub2cnt,sub3cnt;
	//추가
	private String content;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	private String sub, sub1, sub2, sub3;
	private String surveychk; // 투표 체크 유무를 위한 property
	private String sdate;
	
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getSurveychk() {
		return surveychk;
	}
	public void setSurveychk(String surveychk) {
		this.surveychk = surveychk;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getSub1cnt() {
		return sub1cnt;
	}
	public void setSub1cnt(int sub1cnt) {
		this.sub1cnt = sub1cnt;
	}
	public int getSub2cnt() {
		return sub2cnt;
	}
	public void setSub2cnt(int sub2cnt) {
		this.sub2cnt = sub2cnt;
	}
	public int getSub3cnt() {
		return sub3cnt;
	}
	public void setSub3cnt(int sub3cnt) {
		this.sub3cnt = sub3cnt;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getSub1() {
		return sub1;
	}
	public void setSub1(String sub1) {
		this.sub1 = sub1;
	}
	public String getSub2() {
		return sub2;
	}
	public void setSub2(String sub2) {
		this.sub2 = sub2;
	}
	public String getSub3() {
		return sub3;
	}
	public void setSub3(String sub3) {
		this.sub3 = sub3;
	}

	
	

}
