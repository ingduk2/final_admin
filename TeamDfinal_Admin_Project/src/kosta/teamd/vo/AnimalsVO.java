package kosta.teamd.vo;

public class AnimalsVO {
	private String anispecies;  // 동물 분류(동물종)
	private String anibreed;    // 동물 분류(품종)
	private int cnt; //수량
	
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
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	

}
