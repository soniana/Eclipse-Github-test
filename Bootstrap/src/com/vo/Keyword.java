package com.vo;

public class Keyword {
	private String memid;
	private String prfnm;

	public Keyword(String memid, String prfnm, String search_date, String search, int rank) {
		this.memid = memid;
		this.prfnm = prfnm;
		this.search_date = search_date;
		this.search = search;
		this.rank = rank;
	}

	public String getPrfnm() {
		return prfnm;
	}

	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}

	private String search_date;
	private String search;
	private int rank;

	public Keyword() {
	}

	public Keyword(String search, int rank) {
		this.search = search;
		this.rank = rank;
	}

	public Keyword(String memid, String search_date, String search) {
		this.memid = memid;
		this.search_date = search_date;
		this.search = search;
	}

	public Keyword(String memid2, String prfnm2) {
		// TODO Auto-generated constructor stub
		this.memid=memid2;
		this.search=prfnm2;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public String getSearch_date() {
		return search_date;
	}

	public void setSearch_date(String search_date) {
		this.search_date = search_date;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	@Override
	public String toString() {
		return "Keyword [memid=" + memid + ", prfnm=" + prfnm + ", search_date=" + search_date + ", search=" + search
				+ ", rank=" + rank + "]";
	}

}
