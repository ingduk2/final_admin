package kosta.teamd.vo;

import org.springframework.web.multipart.MultipartFile;

public class AnimalVO {

	// animal table vo
	
	private int anino;          // 동물 등록 번호
	private String anispecies;  // 동물 분류(동물종)
	private String anibreed;    // 동물 분류(품종)
	private String aniname;     // 이름
	private int aniage;         // 나이
	private String anisex;      // 성별 _ 남아, 여아
	private String anisize;     // 크기 분류 _ 소, 중, 대
	private int aniweight;      // 몸무게
	private String anifeature;  // 특징
	private String aniregion;   // (실종, 발견)지역
	private String anidate;     // (실종, 발견)날짜
	private String aniimg;      // 동물 사진 파일 이름
	private MultipartFile maniimg; //이미지 업로드용
	
	public MultipartFile getManiimg() {
		return maniimg;
	}
	public void setManiimg(MultipartFile maniimg) {
		this.maniimg = maniimg;
	}
	public int getAnino() {
		return anino;
	}
	public void setAnino(int anino) {
		this.anino = anino;
	}
	public String getAnispecies() {
		return anispecies;
	}
	public void setAnispecies(String anispecies) {
		this.anispecies = anispecies;
	}
	public String getAnibreed() {
		return anibreed;
	}
	public void setAnibreed(String anibreed) {
		this.anibreed = anibreed;
	}
	public String getAniname() {
		return aniname;
	}
	public void setAniname(String aniname) {
		this.aniname = aniname;
	}
	public int getAniage() {
		return aniage;
	}
	public void setAniage(int aniage) {
		this.aniage = aniage;
	}
	public String getAnisex() {
		return anisex;
	}
	public void setAnisex(String anisex) {
		this.anisex = anisex;
	}
	public String getAnisize() {
		return anisize;
	}
	public void setAnisize(String anisize) {
		this.anisize = anisize;
	}
	public int getAniweight() {
		return aniweight;
	}
	public void setAniweight(int aniweight) {
		this.aniweight = aniweight;
	}
	public String getAnifeature() {
		return anifeature;
	}
	public void setAnifeature(String anifeature) {
		this.anifeature = anifeature;
	}
	public String getAniregion() {
		return aniregion;
	}
	public void setAniregion(String aniregion) {
		this.aniregion = aniregion;
	}
	public String getAnidate() {
		return anidate;
	}
	public void setAnidate(String anidate) {
		this.anidate = anidate;
	}
	public String getAniimg() {
		return aniimg;
	}
	public void setAniimg(String aniimg) {
		this.aniimg = aniimg;
	}
}
