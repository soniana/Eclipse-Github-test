package com.com_list;

import java.sql.Connection;
import java.util.ArrayList;

import com.frame.Biz;

public class Com_listBiz extends Biz {
	private Com_listDao dao;
	public Com_listBiz(){
		dao=new Com_listDao();
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
		Object mem_info=null;
		Connection con=getConnection();
		mem_info=dao.select(con,obj);
		close(con);
		return mem_info;
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
