package com.data.com_list;

public class Com_list {
	private String mt30id;	
	private String entrpsnm;	
	private String genrenm;	
	private String telno;	
	private String relateurl;
	
	public Com_list(){}
	public Com_list(String mt30id, String entrpsnm, String genrenm, String telno, String relateurl) {
		this.mt30id = mt30id;
		this.entrpsnm = entrpsnm;
		this.genrenm = genrenm;
		this.telno = telno;
		this.relateurl = relateurl;
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
	public String getGenrenm() {
		return genrenm;
	}
	public void setGenrenm(String genrenm) {
		this.genrenm = genrenm;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public String getRelateurl() {
		return relateurl;
	}
	public void setRelateurl(String relateurl) {
		this.relateurl = relateurl;
	}
	@Override
	public String toString() {
		return "Com_list [mt30id=" + mt30id + ", entrpsnm=" + entrpsnm + ", genrenm=" + genrenm + ", telno=" + telno
				+ ", relateurl=" + relateurl + "]";
	}

}
