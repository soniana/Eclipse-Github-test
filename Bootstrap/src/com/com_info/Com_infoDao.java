package com.com_info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.frame.Dao;
import com.frame.Sql;
import com.vo.Com_info;
import com.vo.Prf_detail;
import com.vo.Remem_info;

public class Com_infoDao extends Dao {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		Com_info com_info=(Com_info) obj;
		PreparedStatement pstmt=con.prepareStatement(Sql.insertCom);
		pstmt.setString(1,com_info.getComid());
		pstmt.setString(2,com_info.getCompw());
		pstmt.setString(3,com_info.getMt30id());
		pstmt.setString(4,com_info.getEntrpsnm());
		pstmt.setString(5,com_info.getComtel());
		pstmt.setString(6,com_info.getGenrenm());
		pstmt.executeUpdate();
		close(pstmt);
	}

	@Override
	public void update(Connection con, Object obj) throws Exception {
		Com_info com_info=(Com_info) obj;
		PreparedStatement pstmt=con.prepareStatement(Sql.updateCom);
		pstmt.setString(1,com_info.getCompw());
		pstmt.setString(2,com_info.getMt30id());
		pstmt.setString(3,com_info.getEntrpsnm());
		pstmt.setString(4,com_info.getComtel());
		pstmt.setString(5,com_info.getGenrenm());
		pstmt.setString(6,com_info.getComid());
		pstmt.executeUpdate();
		close(pstmt);
	}

	@Override
	public void delete(Connection con, Object obj) throws Exception {
		PreparedStatement pstmt=con.prepareStatement(Sql.deleteCom);
		pstmt.setString(1,obj.toString());
		pstmt.executeUpdate();
		close(pstmt);
	}

	@Override
	public Object select(Connection con, Object obj) throws Exception {
		Object com_info=null;
		PreparedStatement pstmt=con.prepareStatement(Sql.selectCom);
		pstmt.setString(1,obj.toString());
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		rset.next();
		int comno=rset.getInt("COMNO");
		String comid=rset.getString("COMID");
		String compw=rset.getString("COMPW");
		String mt30id=rset.getString("mt30id");
		String entrpsnm=rset.getString("ENTRPSNM");
		String comtel=rset.getString("COMTEL");
		String genrenm=rset.getString("GENRENM");
		com_info=new Com_info(comno,comid,compw,mt30id,entrpsnm,comtel,genrenm);
		close(pstmt);	
		return com_info;
	}

	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		ArrayList<Object> list=new ArrayList<>();
		PreparedStatement pstmt=con.prepareStatement(Sql.selectAllCom);
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		while(rset.next()){
			int comno=rset.getInt("COMNO");
			String comid=rset.getString("COMID");
			String compw=rset.getString("COMPW");
			String mt30id=rset.getString("mt30id");
			String entrpsnm=rset.getString("ENTRPSNM");
			String comtel=rset.getString("COMTEL");
			String genrenm=rset.getString("GENRENM");
			Com_info com_info=new Com_info(comno,comid,compw,mt30id,entrpsnm,comtel,genrenm);
			list.add(com_info);
		}
		close(rset);
		close(pstmt);		
		return list;
	}
	
	@Override
	public ArrayList<Object> search(Connection con, Object obj) throws Exception {
		ArrayList<Object> list=new ArrayList<>();
		PreparedStatement pstmt=con.prepareStatement(Sql.searchCom);
		pstmt.setString(1,obj.toString());
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		while(rset.next()){
			String mt20id=rset.getString("mt20id");
			String prfnm=rset.getString("prfnm");
			String prfpdfrom=rset.getString("prfpdfrom");
			String prfpdto=rset.getString("prfpdto");
			String fcltynm=rset.getString("fcltynm");
			String prfcast=rset.getString("prfcast");
			String prfcrew=rset.getString("prfcrew");
			String prfruntime=rset.getString("prfruntime");
			Prf_detail prf_detail=new Prf_detail(mt20id,prfnm,prfpdfrom,prfpdto,fcltynm,prfcast,prfcrew,prfruntime);
			list.add(prf_detail);
		}
		close(rset);
		close(pstmt);		
		return list;
	}

	@Override
	public ArrayList<Object> typesearch(Connection con, Object obj) throws Exception {
		ArrayList<Object> list=new ArrayList<>();
		PreparedStatement pstmt=con.prepareStatement(Sql.typesearchRe);
		pstmt.setString(1,obj.toString());
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		while(rset.next()){
//			int reno=rset.getInt("r.reno");
//			String memid=rset.getString("r.memid");
//			String mt20id=rset.getString("r.mt20id");
//			String mt10id=rset.getString("r.mt10id");
//			String fcltynm=rset.getString("r.fcltynm");
//			String seldate=rset.getString("r.seldate");
//			String seltime=rset.getString("r.seltime");
//			int people=rset.getInt("r.people");
//			String seattype=rset.getString("r.seattype");
//			int price=rset.getInt("r.price");
//			String memname=rset.getString("m.memname");
//			String memtel=rset.getString("m.memtel");
			int reno=rset.getInt(1);
			String memid=rset.getString(2);
			String mt20id=rset.getString(3);
			String mt10id=rset.getString(4);
			String fcltynm=rset.getString(5);
			String seldate=rset.getString(6);
			String seltime=rset.getString(7);
			int people=rset.getInt(8);
			String seattype=rset.getString(9);
			int price=rset.getInt(10);
			String memname=rset.getString(11);
			String memtel=rset.getString(12);
			Remem_info remem_info=new Remem_info(reno,memid,mt20id,mt10id,fcltynm,seldate,seltime,people,seattype,price
					,memname,memtel);
			list.add(remem_info);
		}
		close(rset);
		close(pstmt);		
		return list;
	}
}
