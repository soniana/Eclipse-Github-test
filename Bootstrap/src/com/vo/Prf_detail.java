package com.vo;

public class Prf_detail {
	private String mt20id;
	private String mt10id;
	private String prfnm;
	private String prfpdfrom;
	private String prfpdto;
	private String fcltynm;
	private String prfcast;
	private String prfcrew;
	private String prfruntime;
	private String prfage;
	private String entrpsnm;
	private String pcseguidance;
	private String poster;
	private String genrenm;
	private String prfstate;
	private String openrun;
	private String styurl;
	private String dtguidance;
	
	private int prfdtcnt;
	private int totnmrs;
	
	public Prf_detail(){}	
	public Prf_detail(String mt20id, String prfnm, String prfpdfrom, String prfpdto, String fcltynm, String prfcast,
			String prfcrew, String prfruntime) {
		this.mt20id = mt20id;
		this.prfnm = prfnm;
		this.prfpdfrom = prfpdfrom;
		this.prfpdto = prfpdto;
		this.fcltynm = fcltynm;
		this.prfcast = prfcast;
		this.prfcrew = prfcrew;
		this.prfruntime = prfruntime;
	}	
	public Prf_detail(String mt20id, String mt10id, String prfnm, String prfpdfrom, String prfpdto, String fcltynm,
			String prfcast, String prfcrew, String prfruntime, String prfage, String entrpsnm, String pcseguidance,
			String poster, String genrenm, String prfstate, String openrun, String styurl, String dtguidance) {
		this.mt20id = mt20id;
		this.mt10id = mt10id;
		this.prfnm = prfnm;
		this.prfpdfrom = prfpdfrom;
		this.prfpdto = prfpdto;
		this.fcltynm = fcltynm;
		this.prfcast = prfcast;
		this.prfcrew = prfcrew;
		this.prfruntime = prfruntime;
		this.prfage = prfage;
		this.entrpsnm = entrpsnm;
		this.pcseguidance = pcseguidance;
		this.poster = poster;
		this.genrenm = genrenm;
		this.prfstate = prfstate;
		this.openrun = openrun;
		this.styurl = styurl;
		this.dtguidance = dtguidance;
	}
	public Prf_detail(String mt20id, String mt10id, String prfnm, String prfpdfrom, String prfpdto, String fcltynm,
			String prfcast, String prfcrew, String prfruntime, String prfage, String entrpsnm, String pcseguidance,
			String poster, String genrenm, String prfstate, String openrun, String styurl, String dtguidance,
			int prfdtcnt, int totnmrs) {
		this.mt20id = mt20id;
		this.mt10id = mt10id;
		this.prfnm = prfnm;
		this.prfpdfrom = prfpdfrom;
		this.prfpdto = prfpdto;
		this.fcltynm = fcltynm;
		this.prfcast = prfcast;
		this.prfcrew = prfcrew;
		this.prfruntime = prfruntime;
		this.prfage = prfage;
		this.entrpsnm = entrpsnm;
		this.pcseguidance = pcseguidance;
		this.poster = poster;
		this.genrenm = genrenm;
		this.prfstate = prfstate;
		this.openrun = openrun;
		this.styurl = styurl;
		this.dtguidance = dtguidance;
		this.prfdtcnt = prfdtcnt;
		this.totnmrs = totnmrs;
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

	public String getPrfnm() {
		return prfnm;
	}

	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}

	public String getPrfpdfrom() {
		return prfpdfrom;
	}

	public void setPrfpdfrom(String prfpdfrom) {
		this.prfpdfrom = prfpdfrom;
	}

	public String getPrfpdto() {
		return prfpdto;
	}

	public void setPrfpdto(String prfpdto) {
		this.prfpdto = prfpdto;
	}

	public String getFcltynm() {
		return fcltynm;
	}

	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}

	public String getPrfcast() {
		return prfcast;
	}

	public void setPrfcast(String prfcast) {
		this.prfcast = prfcast;
	}

	public String getPrfcrew() {
		return prfcrew;
	}

	public void setPrfcrew(String prfcrew) {
		this.prfcrew = prfcrew;
	}

	public String getPrfruntime() {
		return prfruntime;
	}

	public void setPrfruntime(String prfruntime) {
		this.prfruntime = prfruntime;
	}

	public String getPrfage() {
		return prfage;
	}

	public void setPrfage(String prfage) {
		this.prfage = prfage;
	}

	public String getEntrpsnm() {
		return entrpsnm;
	}

	public void setEntrpsnm(String entrpsnm) {
		this.entrpsnm = entrpsnm;
	}

	public String getPcseguidance() {
		return pcseguidance;
	}

	public void setPcseguidance(String pcseguidance) {
		this.pcseguidance = pcseguidance;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getGenrenm() {
		return genrenm;
	}

	public void setGenrenm(String genrenm) {
		this.genrenm = genrenm;
	}

	public String getPrfstate() {
		return prfstate;
	}

	public void setPrfstate(String prfstate) {
		this.prfstate = prfstate;
	}

	public String getOpenrun() {
		return openrun;
	}

	public void setOpenrun(String openrun) {
		this.openrun = openrun;
	}

	public String getStyurl() {
		return styurl;
	}

	public void setStyurl(String styurl) {
		this.styurl = styurl;
	}

	public String getDtguidance() {
		return dtguidance;
	}

	public void setDtguidance(String dtguidance) {
		this.dtguidance = dtguidance;
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
		return "Prf_detail [mt20id=" + mt20id + ", mt10id=" + mt10id + ", prfnm=" + prfnm + ", prfpdfrom=" + prfpdfrom
				+ ", prfpdto=" + prfpdto + ", fcltynm=" + fcltynm + ", prfcast=" + prfcast + ", prfcrew=" + prfcrew
				+ ", prfruntime=" + prfruntime + ", prfage=" + prfage + ", entrpsnm=" + entrpsnm + ", pcseguidance="
				+ pcseguidance + ", poster=" + poster + ", genrenm=" + genrenm + ", prfstate=" + prfstate + ", openrun="
				+ openrun + ", styurl=" + styurl + ", dtguidance=" + dtguidance + ", prfdtcnt=" + prfdtcnt
				+ ", totnmrs=" + totnmrs + "]";
	}	
	
}
