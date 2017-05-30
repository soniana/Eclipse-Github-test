package com.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.frame.Dao;
import com.frame.Sql;
import com.vo.Keyword;
import com.vo.Prf_detail;

public class searchDao extends Dao {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		Keyword keyword=(Keyword) obj;
		PreparedStatement pstmt=con.prepareStatement(Sql.insertKeyword);
		pstmt.setString(1,keyword.getMemid());
		pstmt.setString(2,keyword.getSearch());
		pstmt.executeUpdate();
		close(pstmt);
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Object select(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> search(Connection con, Object obj) throws Exception {
		ArrayList<Object> list=new ArrayList<>();
		PreparedStatement pstmt=con.prepareStatement(Sql.searchprf);
		pstmt.setString(1,"%"+obj.toString()+"%");
		pstmt.setString(2,"%"+obj.toString()+"%");
		pstmt.setString(3,"%"+obj.toString()+"%");
		pstmt.setString(4,"%"+obj.toString()+"%");
		pstmt.setString(5,"%"+obj.toString()+"%");
		pstmt.setString(6,"%"+obj.toString()+"%");
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		while(rset.next()){
			String mt20id=rset.getString("mt20id");
			String mt10id=rset.getString("mt10id");
			String prfnm=rset.getString("prfnm");
			String prfpdfrom=rset.getString("prfpdfrom");
			String prfpdto=rset.getString("prfpdto");
			String fcltynm=rset.getString("fcltynm");
			String prfcast=rset.getString("prfcast");
			String prfcrew=rset.getString("prfcrew");
			String prfruntime=rset.getString("prfruntime");
			String prfage=rset.getString("prfage");
			String entrpsnm=rset.getString("entrpsnm");
			String pcseguidance=rset.getString("pcseguidance");
			String poster=rset.getString("poster");
			String genrenm=rset.getString("genrenm");
			String prfstate=rset.getString("prfstate");
			String openrun=rset.getString("openrun");
			String styurl=rset.getString("styurl");
			String dtguidance=rset.getString("dtguidance");
			Prf_detail prf_detail=new Prf_detail(mt20id,mt10id,prfnm,prfpdfrom,prfpdto,fcltynm,prfcast,prfcrew,prfruntime,
					prfage,entrpsnm,pcseguidance,poster,genrenm,prfstate,openrun,styurl,dtguidance);
			list.add(prf_detail);
		}
		close(rset);
		close(pstmt);		
		return list;
	}

	@Override
	public ArrayList<Object> typesearch(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
