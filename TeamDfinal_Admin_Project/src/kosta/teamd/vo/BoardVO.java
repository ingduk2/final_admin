package kosta.teamd.vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {

	// board table vo
	
	private int bcode;        // 분류코드
	private int boricode;     // 원래 분류코드
	private int bno;          // 글 번호
	private String btitle;    // 제목
	private String mid;       // 작성자(회원 아이디)
	private String bcontent;  // 내용
	private String bdate;     // 작성 일자
	private int bhit;         // 조회수
	private int anino;        // 연관 동물 번호
	private int bref;         // 답글_원본 글 번호
	private int bseq;         // 답글_답글 순서
	private int blvl;         // 답글_트리 단계
	private String bip;       // 작성자 IP
	private String bfile;     // 첨부 파일 이름
	private MultipartFile mfile;
	private int brpt;         // 신고당한 횟수
	
	private String searchType; //검색타입
	private String searchValue; //검색값
	

	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public int getBoricode() {
		return boricode;
	}
	public void setBoricode(int boricode) {
		this.boricode = boricode;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	public int getAnino() {
		return anino;
	}
	public void setAnino(int anino) {
		this.anino = anino;
	}
	public int getBref() {
		return bref;
	}
	public void setBref(int bref) {
		this.bref = bref;
	}
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public int getBlvl() {
		return blvl;
	}
	public void setBlvl(int blvl) {
		this.blvl = blvl;
	}
	public String getBip() {
		return bip;
	}
	public void setBip(String bip) {
		this.bip = bip;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
	}
	public int getBrpt() {
		return brpt;
	}
	public void setBrpt(int brpt) {
		this.brpt = brpt;
	}
	public MultipartFile getMfile() {
		return mfile;
	}
	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
}
