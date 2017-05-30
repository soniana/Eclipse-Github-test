package com.data.fclty;

public class Fclty {
	private String mt10id;
	private String fcltynm;
	private String sidonm;
	private String gugunnm;
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
	@Override
	public String toString() {
		return "Fclty [mt10id=" + mt10id + ", fcltynm=" + fcltynm + ", sidonm=" + sidonm + ", gugunnm=" + gugunnm + "]";
	}
	public Fclty(String mt10id, String fcltynm, String sidonm, String gugunnm) {
		this.mt10id = mt10id;
		this.fcltynm = fcltynm;
		this.sidonm = sidonm;
		this.gugunnm = gugunnm;
	}
	
	
	

		
	
}
