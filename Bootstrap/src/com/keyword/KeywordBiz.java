package com.keyword;

import java.sql.Connection;
import java.util.ArrayList;

import com.frame.Biz;

public class KeywordBiz extends Biz {
	
	private keywordDao dao;
	

	public KeywordBiz() {
		dao=new keywordDao();
	}

	@Override
	public void register(Object obj) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void modify(Object obj) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(Object obj) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Object get(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> get() throws Exception {
		ArrayList<Object> list=null;
		Connection con=getConnection();
		list=dao.select(con);
		close(con);		
		return list;
	}

	@Override
	public ArrayList<Object> search(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> typesearch(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
