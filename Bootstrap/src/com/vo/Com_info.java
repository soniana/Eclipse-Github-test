package com.vo;

public class Com_info {
	private int comno;
	private String comid;
	private String compw;
	private String mt30id;
	private String entrpsnm;
	private String comtel;
	private String genrenm;
	
	public Com_info(){ }
	public Com_info(int comno, String comid, String compw, String mt30id, String entrpsnm, String comtel,
			String genrenm) {
		this.comno = comno;
		this.comid = comid;
		this.compw = compw;
		this.mt30id = mt30id;
		this.entrpsnm = entrpsnm;
		this.comtel = comtel;
		this.genrenm = genrenm;
	}
	public Com_info(String comid, String compw, String mt30id, String entrpsnm, String comtel, String genrenm) {
		this.comid = comid;
		this.compw = compw;
		this.mt30id = mt30id;
		this.entrpsnm = entrpsnm;
		this.comtel = comtel;
		this.genrenm = genrenm;
	}
	
	public int getComno() {
		return comno;
	}
	public void setComno(int comno) {
		this.comno = comno;
	}
	public String getComid() {
		return comid;
	}
	public void setComid(String comid) {
		this.comid = comid;
	}
	public String getCompw() {
		return compw;
	}
	public void setCompw(String compw) {
		this.compw = compw;
	}
	public String getMt30id() {
		return mt30id;
	}
	public void setMt30id(String mt30id) {
		this.mt30id = mt30id;
	}
	public String getEntrpsnm() {
		return entrpsnm;
	}
	public void setEntrpsnm(String entrpsnm) {
		this.entrpsnm = entrpsnm;
	}
	public String getComtel() {
		return comtel;
	}
	public void setComtel(String comtel) {
		this.comtel = comtel;
	}
	public String getGenrenm() {
		return genrenm;
	}
	public void setGenrenm(String genrenm) {
		this.genrenm = genrenm;
	}
	
	@Override
	public String toString() {
		return "Com_info [comno=" + comno + ", comid=" + comid + ", compw=" + compw + ", mt30id=" + mt30id
				+ ", entrpsnm=" + entrpsnm + ", comtel=" + comtel + ", genrenm=" + genrenm + "]";
	}

}
