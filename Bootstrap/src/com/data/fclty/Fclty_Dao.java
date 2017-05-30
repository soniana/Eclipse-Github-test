package com.data.fclty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.data.frame.Dao;
import com.data.frame.Sql;

public class Fclty_Dao extends Dao {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		Fclty prf_detail=(Fclty) obj;
		PreparedStatement pstmt=con.prepareStatement(Sql.insertFclty);
		pstmt.setString(1,prf_detail.getMt10id());
		pstmt.setString(2,prf_detail.getFcltynm());
		pstmt.setString(3,prf_detail.getSidonm());
		pstmt.setString(4,prf_detail.getGugunnm());
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
		/*Object prf_detail=null;
		PreparedStatement pstmt=con.prepareStatement(Sql.selectPrf);
		pstmt.setString(1,obj.toString());
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		rset.next();
		String mt20id=rset.getString("mt20id");
		String prfnm=rset.getString("prfnm");
		String genrenm=rset.getString("genrenm");
		prf_detail=new Fclty(mt20id,prfnm,genrenm);
		close(pstmt);	
		return prf_detail;*/
		return null;
	}

	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
	/*	ArrayList<Object> list=new ArrayList<>();
		PreparedStatement pstmt=con.prepareStatement(Sql.selectAllPrf);
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		while(rset.next()){
			String mt20id=rset.getString("mt20id");
			String prfnm=rset.getString("prfnm");
			String genrenm=rset.getString("genrenm");
			
			Fclty prf_detail=new Fclty(mt20id,prfnm,genrenm);
			list.add(prf_detail);
		}
		close(rset);
		close(pstmt);		
		return list;*/
		return null;
	}

}
