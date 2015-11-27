package kosta.teamd.vo;

//조인용 vo!
public class VolunteerJoinVO {
	private int  vapplyno, volunteerno; // �����û��ȣ, �����ȣ
	private String memid, vapplydate; // ȸ�����̵�, �����û��¥
	
	private String volunteertitle, volunteerstart, volunteerend;
	public int getVapplyno() {
		return vapplyno;
	}
	public void setVapplyno(int vapplyno) {
		this.vapplyno = vapplyno;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getVapplydate() {
		return vapplydate;
	}
	public void setVapplydate(String vapplydate) {
		this.vapplydate = vapplydate;
	}
	public int getVolunteerno() {
		return volunteerno;
	}
	public void setVolunteerno(int volunteerno) {
		this.volunteerno = volunteerno;
	}
	public String getVolunteertitle() {
		return volunteertitle;
	}
	public void setVolunteertitle(String volunteertitle) {
		this.volunteertitle = volunteertitle;
	}
	public String getVolunteerstart() {
		return volunteerstart;
	}
	public void setVolunteerstart(String volunteerstart) {
		this.volunteerstart = volunteerstart;
	}
	public String getVolunteerend() {
		return volunteerend;
	}
	public void setVolunteerend(String volunteerend) {
		this.volunteerend = volunteerend;
	}
}
