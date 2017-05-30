package com.mem_info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.frame.Dao;
import com.frame.Sql;
import com.vo.Mem_info;

public class Mem_infoDao extends Dao {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		Mem_info mem_info =(Mem_info) obj;
		PreparedStatement pstmt=con.prepareStatement(Sql.insertMem);	
		pstmt.setString(1,mem_info.getMemid());
		pstmt.setString(2,mem_info.getMempw());
		pstmt.setString(3,mem_info.getMemname());
		pstmt.setString(4,mem_info.getMemtel());
		pstmt.setString(5,mem_info.getMememail());
		pstmt.setString(6,mem_info.getMemgen());
		pstmt.setString(7,mem_info.getMemage());
		pstmt.setString(8,mem_info.getMemmarry());
		pstmt.setString(9,mem_info.getMemjob());	
		pstmt.setString(10,mem_info.getMemtype());
		pstmt.setString(11,mem_info.getMemjang1());
		pstmt.setString(12,mem_info.getMemjang2());
		pstmt.setString(13,mem_info.getMemjang3());
		pstmt.setString(14,mem_info.getMempa1());
		pstmt.setString(15,mem_info.getMempa2());
		pstmt.setString(16,mem_info.getMempa3());
		pstmt.executeUpdate();
		close(pstmt);
	}

	@Override
	public void update(Connection con, Object obj) throws Exception {
		Mem_info mem_info = (Mem_info) obj;
		PreparedStatement pstmt = con.prepareStatement(Sql.updateMem);
		pstmt.setString(1, mem_info.getMempw());
		pstmt.setString(2, mem_info.getMemname());
		pstmt.setString(3, mem_info.getMemtel());
		pstmt.setString(4, mem_info.getMememail());
		pstmt.setString(5, mem_info.getMemgen());
		pstmt.setString(6, mem_info.getMemage());
		pstmt.setString(7, mem_info.getMemmarry());
		pstmt.setString(8, mem_info.getMemjob());
		pstmt.setString(9, mem_info.getMemtype());
		pstmt.setString(10, mem_info.getMemjang1());
		pstmt.setString(11, mem_info.getMemjang2());
		pstmt.setString(12, mem_info.getMemjang3());
		pstmt.setString(13, mem_info.getMempa1());
		pstmt.setString(14, mem_info.getMempa2());
		pstmt.setString(15, mem_info.getMempa3());	
		pstmt.setString(16, mem_info.getAdmini());	
		pstmt.setString(17, mem_info.getMemid());		
		pstmt.executeUpdate();	
		close(pstmt);

	}

	@Override
	public void delete(Connection con, Object obj) throws Exception {
		PreparedStatement pstmt = con.prepareStatement(Sql.deleteMem);
		pstmt.setString(1, obj.toString());
		pstmt.executeUpdate();	
		close(pstmt);
	}

	@Override
	public Object select(Connection con, Object obj) throws Exception {
		Object mem_info=null;
		PreparedStatement pstmt=con.prepareStatement(Sql.selectMem);
		pstmt.setString(1,obj.toString());
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		rset.next();
		int memno=rset.getInt("memno");
		String memid=rset.getString("memid");
		String mempw=rset.getString("mempw");
		String memname=rset.getString("memname");
		String memtel=rset.getString("memtel");
		String mememail=rset.getString("mememail");
		String memgen=rset.getString("memgen");
		String memage=rset.getString("memage");
		String memmarry=rset.getString("memmarry");
		String memjob=rset.getString("memjob");
		String memtype=rset.getString("memtype");
		String memjang1=rset.getString("memjang1");
		String memjang2=rset.getString("memjang2");
		String memjang3=rset.getString("memjang3");
		String mempa1=rset.getString("mempa1");
		String mempa2=rset.getString("mempa2");
		String mempa3=rset.getString("mempa3");
		String admini=rset.getString("admini");		
		mem_info=new Mem_info(memno,memid,mempw,memname,memtel,mememail,memgen,memage,memmarry,memjob,memtype,memjang1,memjang2,memjang3,mempa1,mempa2,mempa3,admini);
		close(pstmt);	
		return mem_info;
	}	
	
	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		ArrayList<Object> list=new ArrayList<>();
		PreparedStatement pstmt=con.prepareStatement(Sql.selectAllMem);
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		while(rset.next()){
			String memid=rset.getString("memid");
			String mempw=rset.getString("mempw");
			String memname=rset.getString("memname");
			String memtel=rset.getString("memtel");
			String mememail=rset.getString("mememail");
			String memgen=rset.getString("memgen");
			String memage=rset.getString("memage");
			String memmarry=rset.getString("memmarry");
			String memjob=rset.getString("memjob");
			String memtype=rset.getString("memtype");
			String memjang1=rset.getString("memjang1");
			String memjang2=rset.getString("memjang2");
			String memjang3=rset.getString("memjang3");
			String mempa1=rset.getString("mempa1");
			String mempa2=rset.getString("mempa2");
			String mempa3=rset.getString("mempa3");
			String admini=rset.getString("admini");
			Mem_info mem_info=new Mem_info(memid,mempw,memname,memtel,mememail,memgen,memage,memmarry,memjob,memtype,memjang1,memjang2,memjang3,mempa1,mempa2,mempa3,admini);
			list.add(mem_info);
		}
		close(rset);
		close(pstmt);		
		return list;
	}

	@Override
	public ArrayList<Object> search(Connection con, Object obj) throws Exception {
		return null;
	}

	@Override
	public ArrayList<Object> typesearch(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
