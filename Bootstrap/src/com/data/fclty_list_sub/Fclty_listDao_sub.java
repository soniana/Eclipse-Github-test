package com.data.fclty_list_sub;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.data.fclty_list_sub.Fclty_list_sub;
import com.data.frame.Dao1;
import com.data.frame.Sql;

public class Fclty_listDao_sub extends Dao1 {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		Fclty_list_sub fclty_list=(Fclty_list_sub) obj;
		PreparedStatement pstmt=con.prepareStatement(Sql.insertFcltySub);
		pstmt.setString(1,fclty_list.getMt10id());
		pstmt.setString(2,fclty_list.getSeatscale());
		pstmt.setString(3,fclty_list.getTelno());
		pstmt.setString(4,fclty_list.getRelateurl());
		pstmt.setString(5,fclty_list.getAdres());
		
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
		/*Object fclty_list=null;
		PreparedStatement pstmt=con.prepareStatement(Sql.selectFcltyL);
		pstmt.setString(1,obj.toString());
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		rset.next();
		String mt10id=rset.getString("mt10id");
		String fcltynm=rset.getString("fcltynm");
		String sidonm=rset.getString("sidonm");
		String gugunnm=rset.getString("gugunnm");
		int seatscale=rset.getInt("seatscale");
		String telno=rset.getString("telno");
		String relateurl=rset.getString("relateurl");
		String adres=rset.getString("adres");
		fclty_list=new Fclty_list_sub(mt10id,fcltynm,sidonm,gugunnm,seatscale,telno,relateurl,adres);
		close(pstmt);	
		return fclty_list;*/
		return null;
	}

	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		/*ArrayList<Object> list=new ArrayList<>();
		PreparedStatement pstmt=con.prepareStatement(Sql.selectAllFcltyL);
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		while(rset.next()){
			String mt10id=rset.getString("mt10id");
			String fcltynm=rset.getString("fcltynm");
			String sidonm=rset.getString("sidonm");
			String gugunnm=rset.getString("gugunnm");
			int seatscale=rset.getInt("seatscale");
			String telno=rset.getString("telno");
			String relateurl=rset.getString("relateurl");
			String adres=rset.getString("adres");
			Fclty_list_sub fclty_list=new Fclty_list_sub(mt10id,fcltynm,sidonm,gugunnm,seatscale,telno,relateurl,adres);
			list.add(fclty_list);
		}
		close(rset);
		close(pstmt);		
		return list;*/
		return null;
	}
	
	@Override
	public ArrayList<String> substring(Connection con, Object obj) throws Exception {
		PreparedStatement pstmt=con.prepareStatement(Sql.substring2);
		ResultSet rset=null;
		ArrayList<String> list=new ArrayList<>();
		rset =pstmt.executeQuery();
		while(rset.next()){

			String mt10id =rset.getString("mt10id");
			list.add(mt10id);			
		}
		
		
		//System.out.println(mt20id);
		close(rset);
		close(pstmt);	
		return list;
		
	
	}

}
