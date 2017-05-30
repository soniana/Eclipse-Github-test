package com.data.boxoffice_month;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.data.frame.Dao;
import com.data.frame.Sql;

public class Boxoffice_month_Dao extends Dao {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		Boxoffice_month week=(Boxoffice_month) obj;
		PreparedStatement pstmt=con.prepareStatement(Sql.insertboxweek);
		pstmt.setString(1,week.getArea());
		pstmt.setString(2,week.getPrfdtcnt());
		pstmt.setString(3,week.getNmrs());
		pstmt.setString(4,week.getPrfpd());
		pstmt.setString(5,week.getCate());
		pstmt.setString(6,week.getPrfplcnm());
		pstmt.setString(7,week.getPrfnm());
		pstmt.setString(8,week.getRnum());
		pstmt.setString(9,week.getSeatcnt());
		pstmt.setString(10,week.getPoster());
		pstmt.setString(11,week.getMt20id());
		
		pstmt.executeUpdate();
		close(pstmt);
	}

	@Override
	public void update(Connection con, Object obj) throws Exception {
		

	}

	@Override
	public void delete(Connection con, Object obj) throws Exception {
		

	}

	@Override
	public Object select(Connection con, Object obj) throws Exception {
	/*	Object prf_detail=null;
		PreparedStatement pstmt=con.prepareStatement(Sql.selectPrf);
		pstmt.setString(1,obj.toString());
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		rset.next();
		String mt20id=rset.getString("mt20id");
		String prfnm=rset.getString("prfnm");
		String genrenm=rset.getString("genrenm");
		prf_detail=new Boxoffice_week(mt20id,prfnm,genrenm);
		close(pstmt);	
		return prf_detail;*/
		return null;
	}

	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		/*ArrayList<Object> list=new ArrayList<>();
		PreparedStatement pstmt=con.prepareStatement(Sql.selectAllPrf);
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		while(rset.next()){
			String mt20id=rset.getString("mt20id");
			String prfnm=rset.getString("prfnm");
			String genrenm=rset.getString("genrenm");
			
			Boxoffice_week prf_detail=new Boxoffice_week(mt20id,prfnm,genrenm);
			list.add(prf_detail);
		}
		close(rset);
		close(pstmt);		
		return list;*/
		return null;
	}

	

}
