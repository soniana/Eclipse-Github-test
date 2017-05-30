package com.re_info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.frame.Dao;
import com.frame.Sql;
import com.vo.Re_info;

public class Re_infoDao extends Dao {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		Re_info re_info=(Re_info) obj;
		PreparedStatement pstmt=con.prepareStatement(Sql.insertRe);
		pstmt.setString(1,re_info.getMemid());
		pstmt.setString(2,re_info.getMt20id());
		pstmt.setString(3,re_info.getMt10id());
		pstmt.setString(4,re_info.getFcltynm());
		pstmt.setString(5, re_info.getSeldate());
		pstmt.setString(6,re_info.getSeltime());
		pstmt.setInt(7,re_info.getPeople());
		pstmt.setString(8,re_info.getSeattype());
		pstmt.setInt(9,re_info.getPrice());
		pstmt.executeUpdate();
		close(pstmt);
	}

	@Override
	public void update(Connection con, Object obj) throws Exception {
		Re_info re_info=(Re_info) obj;
		PreparedStatement pstmt=con.prepareStatement(Sql.updateRe);
		pstmt.setString(1,re_info.getMemid());
		pstmt.setString(2,re_info.getMt20id());
		pstmt.setString(3,re_info.getMt10id());
		pstmt.setString(4,re_info.getFcltynm());
		pstmt.setString(5, re_info.getSeldate());
		pstmt.setString(6,re_info.getSeltime());
		pstmt.setInt(7,re_info.getPeople());
		pstmt.setString(8,re_info.getSeattype());
		pstmt.setInt(9,re_info.getPrice());
		pstmt.setInt(10,re_info.getReno());
		pstmt.executeUpdate();
		close(pstmt);
	}

	@Override
	public void delete(Connection con, Object obj) throws Exception {
		PreparedStatement pstmt=con.prepareStatement(Sql.deleteRe);
		pstmt.setInt(1,Integer.parseInt(obj.toString()));
		pstmt.executeUpdate();
		close(pstmt);
	}

	@Override
	public Object select(Connection con, Object obj) throws Exception {
		Object re_info=null;
		PreparedStatement pstmt=con.prepareStatement(Sql.selectRe);
		pstmt.setString(1,obj.toString());
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		rset.next();
		int reno=rset.getInt("RENO");
		String memid=rset.getString("MEMID");
		String mt20id=rset.getString("MT20ID");
		String mt10id=rset.getString("MT10ID");
		String fcltynm=rset.getString("FCLTYNM");
		String seldate=rset.getString("SELDATE");
		String seltime=rset.getString("SELTIME");
		int people=rset.getInt("PEOPLE");
		String seattype=rset.getString("SEATTYPE");
		int price=rset.getInt("PRICE");
		re_info=new Re_info(reno,memid,mt20id,mt10id,fcltynm,seldate,seltime,people,seattype,price);
		close(pstmt);	
		return re_info;
	}

	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		ArrayList<Object> list=new ArrayList<>();
		PreparedStatement pstmt=con.prepareStatement(Sql.selectAllRe);
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		while(rset.next()){
			String prfnm=rset.getString(1);
			int reno=rset.getInt(2);
			String memid=rset.getString(3);
			String fcltynm=rset.getString(6);
			String seldate=rset.getString(7);
			String seltime=rset.getString(8);
			int people=rset.getInt(9);
			String seattype=rset.getString(10);
			int price=rset.getInt(11);
			Re_info re_info=new Re_info(prfnm,reno,memid,fcltynm,seldate,seltime,people,seattype,price);
			list.add(re_info);
		}
		close(rset);
		close(pstmt);		
		return list;
	}

	@Override
	public ArrayList<Object> search(Connection con, Object obj) throws Exception {
		ArrayList<Object> list=new ArrayList<>();
		PreparedStatement pstmt=con.prepareStatement(Sql.searchRe);
		pstmt.setString(1,obj.toString());
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		while(rset.next()){
			String prfnm=rset.getString(1);
			int reno=rset.getInt(2);
			String memid=rset.getString(3);
			String fcltynm=rset.getString(6);
			String seldate=rset.getString(7);
			String seltime=rset.getString(8);
			int people=rset.getInt(9);
			String seattype=rset.getString(10);
			int price=rset.getInt(11);
			Re_info re_info=new Re_info(prfnm,reno,memid,fcltynm,seldate,seltime,people,seattype,price);
			list.add(re_info);
		}
		close(rset);
		close(pstmt);		
		return list;
	}

	@Override
	public ArrayList<Object> typesearch(Connection con, Object obj) throws Exception {
		return null;
	}
}
