package com.data.fclty_list_sub;

import java.sql.Connection;
import java.util.ArrayList;

import com.data.frame.Biz1;

public class Fclty_listBiz_sub extends Biz1 {
	private Fclty_listDao_sub dao;
	public Fclty_listBiz_sub(){
		dao=new Fclty_listDao_sub();
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
