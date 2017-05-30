package com.data.prf_detail_sub;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.data.frame.Dao1;
import com.data.frame.Sql;
import com.data.prf_detail_sub.Prf_detail_sub2;

public class Prf_detail_sub2_Dao extends Dao1 {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		Prf_detail_sub2 prf_detail=(Prf_detail_sub2) obj;
		PreparedStatement pstmt=con.prepareStatement(Sql.insertPrfDS2);
		pstmt.setString(1,prf_detail.getMt20id());
		pstmt.setInt(2, prf_detail.getPrfdtcnt());
		pstmt.setInt(3, prf_detail.getTotnmrs());
		
		
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
		PreparedStatement pstmt=con.prepareStatement(Sql.selectPrfDS);
		pstmt.setString(1,obj.toString());
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		rset.next();
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
		String styurl=rset.getString("sty");
		String dtguidance=rset.getString("dtguidance");
		
		prf_detail=new Prf_detail_sub1(mt20id,mt10id,prfnm,prfpdfrom,prfpdto,fcltynm,prfcast,prfcrew,prfruntime,prfage,
							entrpsnm,pcseguidance,poster,genrenm,prfstate,openrun,styurl,dtguidance);
		close(pstmt);	
		return prf_detail;*/
		return null;
	}
	@Override
	public ArrayList<String> substring(Connection con, Object obj) throws Exception {
		/*PreparedStatement pstmt=con.prepareStatement(Sql.substring1);
		ResultSet rset=null;
		ArrayList<String> list=new ArrayList<>();
		rset =pstmt.executeQuery();
		while(rset.next()){

			String mt20id =rset.getString("mt20id");
			list.add(mt20id);			
		}
		
		
		//System.out.println(mt20id);
		close(rset);
		close(pstmt);	
		return list;
		*/
	return null;
	}
	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
	/*	ArrayList<Object> list=new ArrayList<>();
		PreparedStatement pstmt=con.prepareStatement(Sql.selectAllPrfDS);
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
			String styurl=rset.getString("sty");
			String dtguidance=rset.getString("dtguidance");
			
			Prf_detail_sub1 prf_detail=new Prf_detail_sub1(mt20id,mt10id,prfnm,prfpdfrom,prfpdto,fcltynm,prfcast,prfcrew,prfruntime,
					prfage,entrpsnm,pcseguidance,poster,genrenm,prfstate,openrun,styurl,dtguidance);
			list.add(prf_detail);
		}
		close(rset);
		close(pstmt);		
		return list;*/
		return null;
	}

}
