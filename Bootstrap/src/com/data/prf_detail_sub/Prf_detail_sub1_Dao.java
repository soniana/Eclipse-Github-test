package com.data.prf_detail_sub;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.data.frame.Dao1;
import com.data.frame.Sql;
import com.data.prf_detail_sub.Prf_detail_sub1;

public class Prf_detail_sub1_Dao extends Dao1 {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		Prf_detail_sub1 prf_detail=(Prf_detail_sub1) obj;
		PreparedStatement pstmt=con.prepareStatement(Sql.insertPrfDS);
		pstmt.setString(1,prf_detail.getMt20id());
		pstmt.setString(2,prf_detail.getMt10id());
		pstmt.setString(3,prf_detail.getPrfnm());
		pstmt.setString(4,prf_detail.getPrfpdfrom());
		pstmt.setString(5,prf_detail.getPrfpdto());
		pstmt.setString(6,prf_detail.getFcltynm());
		pstmt.setString(7,prf_detail.getPrfcast());
		pstmt.setString(8,prf_detail.getPrfcrew());
		pstmt.setString(9,prf_detail.getPrfruntime());
		pstmt.setString(10,prf_detail.getPrfage());
		pstmt.setString(11,prf_detail.getEntrpsnm());
		pstmt.setString(12,prf_detail.getPcseguidance());
		pstmt.setString(13,prf_detail.getPoster());
		pstmt.setString(14,prf_detail.getGenrenm());
		pstmt.setString(15,prf_detail.getPrfstate());
		pstmt.setString(16,prf_detail.getOpenrun());
		pstmt.setString(17,prf_detail.getstyurl());
		pstmt.setString(18,prf_detail.getDtguidance());
		
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
		Object prf_detail=null;
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
		String styurl=rset.getString("styurl");
		String dtguidance=rset.getString("dtguidance");
		
		prf_detail=new Prf_detail_sub1(mt20id,mt10id,prfnm,prfpdfrom,prfpdto,fcltynm,prfcast,prfcrew,prfruntime,prfage,
							entrpsnm,pcseguidance,poster,genrenm,prfstate,openrun,styurl,dtguidance);
		close(pstmt);	
		return prf_detail;
	}
	@Override
	public ArrayList<String> substring(Connection con, Object obj) throws Exception {
		PreparedStatement pstmt=con.prepareStatement(Sql.substring1);
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
		
	
	}
	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		ArrayList<Object> list=new ArrayList<>();
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
			String styurl=rset.getString("styurl");
			String dtguidance=rset.getString("dtguidance");
			
			Prf_detail_sub1 prf_detail=new Prf_detail_sub1(mt20id,mt10id,prfnm,prfpdfrom,prfpdto,fcltynm,prfcast,prfcrew,prfruntime,
					prfage,entrpsnm,pcseguidance,poster,genrenm,prfstate,openrun,styurl,dtguidance);
			list.add(prf_detail);
		}
		close(rset);
		close(pstmt);		
		return list;
	}

}
