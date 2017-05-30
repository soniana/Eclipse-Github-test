package com.data.com_list;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.data.com_list.Com_list;
import com.data.frame.Dao;
import com.data.frame.Sql;

public class Com_listDao extends Dao {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		Com_list com_list =(Com_list) obj;
		PreparedStatement pstmt=con.prepareStatement(Sql.insertComL);
		pstmt.setString(1,com_list.getMt30id());
		pstmt.setString(2,com_list.getEntrpsnm());
		pstmt.setString(3,com_list.getGenrenm());
		pstmt.setString(4,com_list.getTelno());
		pstmt.setString(5,com_list.getRelateurl());
		pstmt.executeUpdate();
		close(pstmt);
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
		Object com_list=null;
		PreparedStatement pstmt=con.prepareStatement(Sql.selectComL);
		pstmt.setString(1,obj.toString());
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		rset.next();
		String mt30id=rset.getString("mt30id");
		String entrpsnm=rset.getString("entrpsnm");
		String genrenm=rset.getString("genrenm");
		String telno=rset.getString("telno");
		String relateurl=rset.getString("relateurl");
		
		com_list=new Com_list(mt30id,entrpsnm,genrenm,telno,relateurl);
		close(pstmt);	
		return com_list;
	}

	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		ArrayList<Object> list=new ArrayList<>();
		PreparedStatement pstmt=con.prepareStatement(Sql.selectAllComL);
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		while(rset.next()){
			String mt30id=rset.getString("mt30id");
			String entrpsnm=rset.getString("entrpsnm");
			String genrenm=rset.getString("genrenm");
			String telno=rset.getString("telno");
			String relateurl=rset.getString("relateurl");
			Com_list com_list=new Com_list(mt30id,entrpsnm,genrenm,telno,relateurl);
			list.add(com_list);
		}
		close(rset);
		close(pstmt);		
		return list;
	}

}
