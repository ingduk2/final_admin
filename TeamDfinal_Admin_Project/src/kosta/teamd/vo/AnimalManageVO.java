package kosta.teamd.vo;

public class AnimalManageVO {
//	create table animalmanage(
//			amno number constraint anumalmanage_amno_pk primary key,
//			mid varchar2(20),
//			anino number,
//			amrice number,
//			amspo number,
//			ambath number,
//			constraint animalmanage_mid_fk foreign key(mid) references member(mid),
//			constraint animalmanage_anino_fk foreign key(anino) references animal(anino)
//			);
//			--동물 관리 seq
//			create sequence am_seq
//			increment by 1
//			start with 1;
	
	private int amno, anino, amrice, amspo, ambath;
	private String mid;
	private String code;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getAmno() {
		return amno;
	}
	public void setAmno(int amno) {
		this.amno = amno;
	}
	public int getAnino() {
		return anino;
	}
	public void setAnino(int anino) {
		this.anino = anino;
	}
	public int getAmrice() {
		return amrice;
	}
	public void setAmrice(int amrice) {
		this.amrice = amrice;
	}
	public int getAmspo() {
		return amspo;
	}
	public void setAmspo(int amspo) {
		this.amspo = amspo;
	}
	public int getAmbath() {
		return ambath;
	}
	public void setAmbath(int ambath) {
		this.ambath = ambath;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	
	
}
