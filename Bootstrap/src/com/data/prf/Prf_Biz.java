package com.data.prf;

import java.sql.Connection;
import java.util.ArrayList;

import com.data.frame.Biz;

public class Prf_Biz extends Biz {
	private Prf_Dao dao;
	public Prf_Biz(){
		dao=new Prf_Dao();
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

	

}
