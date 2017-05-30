package com.data.prf_detail_sub;

public class Prf_detail_sub2 {
	private String mt20id;
	private int prfdtcnt;
	private int totnmrs;
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}
	public int getPrfdtcnt() {
		return prfdtcnt;
	}
	public void setPrfdtcnt(int prfdtcnt) {
		this.prfdtcnt = prfdtcnt;
	}
	public int getTotnmrs() {
		return totnmrs;
	}
	public void setTotnmrs(int totnmrs) {
		this.totnmrs = totnmrs;
	}
	@Override
	public String toString() {
		return "Prf_detail_sub2 [mt20id=" + mt20id + ", prfdtcnt=" + prfdtcnt + ", totnmrs=" + totnmrs + "]";
	}
	public Prf_detail_sub2(String mt20id, int prfdtcnt, int totnmrs) {
		this.mt20id = mt20id;
		this.prfdtcnt = prfdtcnt;
		this.totnmrs = totnmrs;
	}
	
	
	
	
	
	
}
