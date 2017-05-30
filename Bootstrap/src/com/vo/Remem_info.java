package com.vo;

public class Remem_info {
	private int reno;
	private String memid;
	private String mt20id;
	private String mt10id;
	private String fcltynm;
	private String seldate;
	private String seltime;
	private int people;
	private String seattype;
	private int price;
	private String memname;	
	private String memtel;
	
	
	public Remem_info(){ }
	public Remem_info(int reno, String memid, String mt20id, String mt10id, String fcltynm, String seldate,
			String seltime, int people, String seattype, int price, String memname, String memtel) {
		this.reno = reno;
		this.memid = memid;
		this.mt20id = mt20id;
		this.mt10id = mt10id;
		this.fcltynm = fcltynm;
		this.seldate = seldate;
		this.seltime = seltime;
		this.people = people;
		this.seattype = seattype;
		this.price = price;
		this.memname = memname;
		this.memtel = memtel;
	}

	public int getReno() {
		return reno;
	}
	public void setReno(int reno) {
		this.reno = reno;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}
	public String getMt10id() {
		return mt10id;
	}
	public void setMt10id(String mt10id) {
		this.mt10id = mt10id;
	}
	public String getFcltynm() {
		return fcltynm;
	}
	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}
	public String getSeldate() {
		return seldate;
	}
	public void setSeldate(String seldate) {
		this.seldate = seldate;
	}
	public String getSeltime() {
		return seltime;
	}
	public void setSeltime(String seltime) {
		this.seltime = seltime;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public String getSeattype() {
		return seattype;
	}
	public void setSeattype(String seattype) {
		this.seattype = seattype;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getMemtel() {
		return memtel;
	}
	public void setMemtel(String memtel) {
		this.memtel = memtel;
	}

	@Override
	public String toString() {
		return "Remem_info [reno=" + reno + ", memid=" + memid + ", mt20id=" + mt20id + ", mt10id=" + mt10id
				+ ", fcltynm=" + fcltynm + ", seldate=" + seldate + ", seltime=" + seltime + ", people=" + people
				+ ", seattype=" + seattype + ", price=" + price + ", memname=" + memname + ", memtel=" + memtel + "]";
	}	

}
