package com.data.fclty_list;

public class Fclty_list {
	private String mt10id;
	private String fcltynm;
	private String sidonm;
	private String gugunnm;
	private int seatscale;
	private String telno;
	private String relateurl;
	private String adres;

	public Fclty_list() {
	}

	public Fclty_list(String mt10id, String fcltynm, String sidonm, String gugunnm, int seatscale, String telno,
			String relateurl, String adres) {
		super();
		this.mt10id = mt10id;
		this.fcltynm = fcltynm;
		this.sidonm = sidonm;
		this.gugunnm = gugunnm;
		this.seatscale = seatscale;
		this.telno = telno;
		this.relateurl = relateurl;
		this.adres = adres;
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

	public String getSidonm() {
		return sidonm;
	}

	public void setSidonm(String sidonm) {
		this.sidonm = sidonm;
	}

	public String getGugunnm() {
		return gugunnm;
	}

	public void setGugunnm(String gugunnm) {
		this.gugunnm = gugunnm;
	}

	public int getSeatscale() {
		return seatscale;
	}

	public void setSeatscale(int seatscale) {
		this.seatscale = seatscale;
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

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	@Override
	public String toString() {
		return "fclty_list [mt10id=" + mt10id + ", fcltynm=" + fcltynm + ", sidonm=" + sidonm + ", gugunnm=" + gugunnm
				+ ", seatscale=" + seatscale + ", telno=" + telno + ", relateurl=" + relateurl + ", adres=" + adres
				+ "]";
	}
}
