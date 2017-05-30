package com.data.fclty_list;

import java.sql.Connection;
import java.util.ArrayList;

import com.data.frame.Biz2;

public class Fclty_listBiz extends Biz2 {
	private Fclty_listDao dao;
	public Fclty_listBiz(){
		dao=new Fclty_listDao();
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
	public ArrayList<Object> total() throws Exception{
		
		ArrayList<Object> list=null;
		Connection con=getConnection();
		list=dao.total(con);
		close(con);
		return list;
		
	}
	

}
