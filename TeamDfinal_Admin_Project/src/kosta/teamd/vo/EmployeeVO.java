package kosta.teamd.vo;

public class EmployeeVO {
//	create table employee(
//			emno number constraint employee_emno_pk primary key,
//			mid varchar2(20),
//			emzic varchar2(20),
//			emsalary number,
//			constraint employee_mid_fk foreign key(mid) references member(mid)
//			);
//
//			create sequence employee_seq
//			increment by 1
//			start with 1;
	private int emno;
	private String mid;
	private String emzic;
	private int emsalary;
	public int getEmno() {
		return emno;
	}
	public void setEmno(int emno) {
		this.emno = emno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getEmzic() {
		return emzic;
	}
	public void setEmzic(String emzic) {
		this.emzic = emzic;
	}
	public int getEmsalary() {
		return emsalary;
	}
	public void setEmsalary(int emsalary) {
		this.emsalary = emsalary;
	}
}
