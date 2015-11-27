package kosta.teamd.vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {

	// member table vo
	
	private String mid;        // 아이디
	private String mname;      // 이름
	private String memail;     // 이메일
	private String mpwd;       // 비밀번호
	private String mpwdkey;    // 비밀번호 찾기 질문
	private String mpwdval;    // 비밀번호 찾기 답변
	private String mbirth;     // 생년월일
	private String mtel;       // 전화번호
	private String mpost;      // 우편번호
	private String mroad;      // 도로명 주소
	private String mjibun;     // 지번 주소
	private String mimg;       // 프로필 사진 파일 이름
	private String mintro;     // 프로필 인사말
	private int mrptlimit;     // 하루 신고 제한 횟수
	private int mrpt;          // 신고당한 횟수
	private String mfreetime;  // 제재 종료 시간
	private int enabled;       // 아이디 활성화 여부
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public String getMpwdkey() {
		return mpwdkey;
	}
	public void setMpwdkey(String mpwdkey) {
		this.mpwdkey = mpwdkey;
	}
	public String getMpwdval() {
		return mpwdval;
	}
	public void setMpwdval(String mpwdval) {
		this.mpwdval = mpwdval;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMpost() {
		return mpost;
	}
	public void setMpost(String mpost) {
		this.mpost = mpost;
	}
	public String getMroad() {
		return mroad;
	}
	public void setMroad(String mroad) {
		this.mroad = mroad;
	}
	public String getMjibun() {
		return mjibun;
	}
	public void setMjibun(String mjibun) {
		this.mjibun = mjibun;
	}
	public String getMimg() {
		return mimg;
	}
	public void setMimg(String mimg) {
		this.mimg = mimg;
	}
	public String getMintro() {
		return mintro;
	}
	public void setMintro(String mintro) {
		this.mintro = mintro;
	}
	public int getMrptlimit() {
		return mrptlimit;
	}
	public void setMrptlimit(int mrptlimit) {
		this.mrptlimit = mrptlimit;
	}
	public int getMrpt() {
		return mrpt;
	}
	public void setMrpt(int mrpt) {
		this.mrpt = mrpt;
	}
	public String getMfreetime() {
		return mfreetime;
	}
	public void setMfreetime(String mfreetime) {
		this.mfreetime = mfreetime;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	// 전화번호 변환에 사용할 변수
	private String mtelf, mtelb;

	public String getMtelf() {
		return mtelf;
	}
	public void setMtelf(String mtelf) {
		this.mtelf = mtelf;
	}
	public String getMtelb() {
		return mtelb;
	}
	public void setMtelb(String mtelb) {
		this.mtelb = mtelb;
	}
	
	// 프로필 사진 파일 받을 변수
	private MultipartFile mfile;

	public MultipartFile getMfile() {
		return mfile;
	}
	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}
}
