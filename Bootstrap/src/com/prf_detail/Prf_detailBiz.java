package com.prf_detail;

import java.sql.Connection;
import java.util.ArrayList;

import com.frame.Biz;

public class Prf_detailBiz extends Biz {
	private Prf_detailDao dao;
	public Prf_detailBiz(){
		dao=new Prf_detailDao();
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
