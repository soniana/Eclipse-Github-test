package com.search;

import java.sql.Connection;
import java.util.ArrayList;

import com.frame.Biz;

public class searchBiz extends Biz {
	private searchDao dao;
	
	public searchBiz() {
		dao = new searchDao();
	}

	@Override
	public void register(Object obj) throws Exception {
		Connection con=getConnection();
		try{
			dao.insert(con,obj);
			con.commit();
		}catch(Exception e){
			con.rollback();
			throw e;
		}
		close(con);
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> search(Object obj) throws Exception {
		ArrayList<Object> list=null;
		Connection con=getConnection();
		list=dao.search(con,obj);
		close(con);		

		return list;
	}
	

	@Override
	public ArrayList<Object> typesearch(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
