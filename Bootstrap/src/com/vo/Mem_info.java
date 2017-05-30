package com.vo;

public class Mem_info {
	private int memno;	
	private String memid;	
	private String mempw;	
	private String memname;	
	private String memtel;
	private String mememail;
	private String memgen;
	private String memage;
	private String memmarry;
	private String memjob;
	private String memtype;
	private String memjang1;
	private String memjang2;
	private String memjang3;
	private String mempa1;
	private String mempa2;
	private String mempa3;
	private String admini;
	
	public Mem_info(){}	
	public Mem_info(String memname, String memtel) {
		this.memname = memname;
		this.memtel = memtel;
	}
	public Mem_info(int memno, String memid, String mempw, String memname, String memtel, String mememail,
			String memgen, String memage, String memmarry, String memjob, String memtype, String memjang1,
			String memjang2, String memjang3, String mempa1, String mempa2, String mempa3, String admini) {
		this.memno = memno;
		this.memid = memid;
		this.mempw = mempw;
		this.memname = memname;
		this.memtel = memtel;
		this.mememail = mememail;
		this.memgen = memgen;
		this.memage = memage;
		this.memmarry = memmarry;
		this.memjob = memjob;
		this.memtype = memtype;
		this.memjang1 = memjang1;
		this.memjang2 = memjang2;
		this.memjang3 = memjang3;
		this.mempa1 = mempa1;
		this.mempa2 = mempa2;
		this.mempa3 = mempa3;
		this.admini = admini;
	}
	public Mem_info(String memid, String mempw, String memname, String memtel, String mememail,
			String memgen, String memage, String memmarry, String memjob, String memtype, String memjang1,
			String memjang2, String memjang3, String mempa1, String mempa2, String mempa3, String admini) {
		this.memid = memid;
		this.mempw = mempw;
		this.memname = memname;
		this.memtel = memtel;
		this.mememail = mememail;
		this.memgen = memgen;
		this.memage = memage;
		this.memmarry = memmarry;
		this.memjob = memjob;
		this.memtype = memtype;
		this.memjang1 = memjang1;
		this.memjang2 = memjang2;
		this.memjang3 = memjang3;
		this.mempa1 = mempa1;
		this.mempa2 = mempa2;
		this.mempa3 = mempa3;
		this.admini = admini;
	}
	
	public Mem_info(String memid, String mempw, String memname) {
		this.memid = memid;
		this.mempw = mempw;
		this.memname = memname;
	}
	
	public Mem_info(String memid, String mempw, String memname, String memtel, String mememail, String memgen,
			String memage, String memmarry, String memjob, String memtype, String memjang1, String memjang2,
			String memjang3, String mempa1, String mempa2, String mempa3) {
		this.memid = memid;
		this.mempw = mempw;
		this.memname = memname;
		this.memtel = memtel;
		this.mememail = mememail;
		this.memgen = memgen;
		this.memage = memage;
		this.memmarry = memmarry;
		this.memjob = memjob;
		this.memtype = memtype;
		this.memjang1 = memjang1;
		this.memjang2 = memjang2;
		this.memjang3 = memjang3;
		this.mempa1 = mempa1;
		this.mempa2 = mempa2;
		this.mempa3 = mempa3;
	}

	public Number getMemno() {
		return memno;
	}

	public void setMemno(int memno) {
		this.memno = memno;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public String getMempw() {
		return mempw;
	}

	public void setMempw(String mempw) {
		this.mempw = mempw;
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

	public String getMememail() {
		return mememail;
	}

	public void setMememail(String mememail) {
		this.mememail = mememail;
	}

	public String getMemgen() {
		return memgen;
	}

	public void setMemgen(String memgen) {
		this.memgen = memgen;
	}

	public String getMemage() {
		return memage;
	}

	public void setMemage(String memage) {
		this.memage = memage;
	}

	public String getMemmarry() {
		return memmarry;
	}

	public void setMemmarry(String memmarry) {
		this.memmarry = memmarry;
	}

	public String getMemjob() {
		return memjob;
	}

	public void setMemjob(String memjob) {
		this.memjob = memjob;
	}

	public String getMemtype() {
		return memtype;
	}

	public void setMemtype(String memtype) {
		this.memtype = memtype;
	}

	public String getMemjang1() {
		return memjang1;
	}

	public void setMemjang1(String memjang1) {
		this.memjang1 = memjang1;
	}

	public String getMemjang2() {
		return memjang2;
	}

	public void setMemjang2(String memjang2) {
		this.memjang2 = memjang2;
	}

	public String getMemjang3() {
		return memjang3;
	}

	public void setMemjang3(String memjang3) {
		this.memjang3 = memjang3;
	}

	public String getMempa1() {
		return mempa1;
	}

	public void setMempa1(String mempa1) {
		this.mempa1 = mempa1;
	}

	public String getMempa2() {
		return mempa2;
	}

	public void setMempa2(String mempa2) {
		this.mempa2 = mempa2;
	}

	public String getMempa3() {
		return mempa3;
	}

	public void setMempa3(String mempa3) {
		this.mempa3 = mempa3;
	}

	public String getAdmini() {
		return admini;
	}

	public void setAdmini(String admini) {
		this.admini = admini;
	}
	@Override
	public String toString() {
		return "Mem_info [memno=" + memno + ", memid=" + memid + ", mempw=" + mempw + ", memname=" + memname
				+ ", memtel=" + memtel + ", mememail=" + mememail + ", memgen=" + memgen + ", memage=" + memage
				+ ", memmarry=" + memmarry + ", memjob=" + memjob + ", memtype=" + memtype + ", memjang1=" + memjang1
				+ ", memjang2=" + memjang2 + ", memjang3=" + memjang3 + ", mempa1=" + mempa1 + ", mempa2=" + mempa2
				+ ", mempa3=" + mempa3 + ", admini=" + admini + "]";
	}

}
