package com.data.fclty_list_sub;

public class Fclty_list_sub {
	private String mt10id;
	private String seatscale;
	private String telno;
	private String relateurl;
	private String adres;
	public String getMt10id() {
		return mt10id;
	}
	public void setMt10id(String mt10id) {
		this.mt10id = mt10id;
	}
	public String getSeatscale() {
		return seatscale;
	}
	public void setSeatscale(String seatscale) {
		this.seatscale = seatscale;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getRelateurl() {
		return relateurl;
	}
	public void setRelateurl(String relateurl) {
		this.relateurl = relateurl;
	}
	@Override
	public String toString() {
		return "Fclty_list_sub [mt10id=" + mt10id + ", seatscale=" + seatscale + ", telno=" + telno + ", relateurl="
				+ relateurl + ", adres=" + adres + "]";
	}
	public Fclty_list_sub(String mt10id, String seatscale, String telno, String relateurl, String adres) {
		this.mt10id = mt10id;
		this.seatscale = seatscale;
		this.telno = telno;
		this.relateurl = relateurl;
		this.adres = adres;
	}
	
	
	
	
	
	
	
}
