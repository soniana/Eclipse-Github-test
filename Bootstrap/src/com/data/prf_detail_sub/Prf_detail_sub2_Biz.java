package com.data.prf_detail_sub;

import java.sql.Connection;
import java.util.ArrayList;

import com.data.frame.Biz1;

public class Prf_detail_sub2_Biz extends Biz1 {
	private Prf_detail_sub2_Dao dao;
	public Prf_detail_sub2_Biz(){
		dao=new Prf_detail_sub2_Dao();
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
	public ArrayList<String> substring(Object obj) throws Exception {
		// TODO Auto-generated method stub
		ArrayList<String> list;
		Connection con=getConnection();
		list=dao.substring(con, obj);
		return list;
	}

}
