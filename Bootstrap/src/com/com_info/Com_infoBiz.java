package com.com_info;

import java.sql.Connection;
import java.util.ArrayList;

import com.frame.Biz;

public class Com_infoBiz extends Biz {
	private Com_infoDao dao;
	public Com_infoBiz(){
		dao=new Com_infoDao();
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
	}

	@Override
	public void modify(Object obj) throws Exception {
		Connection con=getConnection();
		try{
			dao.update(con,obj);
			con.commit();
		}catch(Exception e){
			con.rollback();
			throw e;
		}
		close(con);
	}

	@Override
	public void remove(Object obj) throws Exception {
		Connection con=getConnection();
		try{
			dao.delete(con,obj);
			con.commit();
		}catch(Exception e){
			con.rollback();
			throw e;
		}
		close(con);
	}

	@Override
	public Object get(Object obj) throws Exception {
		Object com_info=null;
		Connection con=getConnection();
		com_info=dao.select(con,obj);
		close(con);
		return com_info;
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
		ArrayList<Object> list=null;
		Connection con=getConnection();
		list=dao.search(con,obj);
		close(con);		
		return list;
	}

	@Override
	public ArrayList<Object> typesearch(Object obj) throws Exception {
		ArrayList<Object> list=null;
		Connection con=getConnection();
		list=dao.typesearch(con,obj);
		close(con);		
		return list;
	}
}
