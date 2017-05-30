package com.data.prf;

public class Prf {
	private String mt20id;
	private String prfnm;
	
	
	
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}
	public String getPrfnm() {
		return prfnm;
	}
	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}
	@Override
	public String toString() {
		return "Prf [mt20id=" + mt20id + ", prfnm=" + prfnm + "]";
	}
	public Prf(String mt20id, String prfnm) {
		this.mt20id = mt20id;
		this.prfnm = prfnm;
	}
	
	
	/*
	public String getGenrenm() {
		return genrenm;
	}
	public void setGenrenm(String genrenm) {
		this.genrenm = genrenm;
	}*/
	

		
	
}
