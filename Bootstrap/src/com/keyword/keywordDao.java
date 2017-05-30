package com.keyword;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.frame.Dao;
import com.frame.Sql;
import com.vo.Keyword;

public class keywordDao extends Dao {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
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
		ArrayList<Object> list=new ArrayList<>();
		PreparedStatement pstmt=con.prepareStatement(Sql.searchKeyword);
		ResultSet rset=null;
		rset=pstmt.executeQuery();
		while(rset.next()){
			String word=rset.getString(1);
			int rank=rset.getInt(2);
			Keyword keyword=new Keyword(word,rank);
			list.add(keyword);
		}
		close(rset);
		close(pstmt);		
		return list;
	}

	@Override
	public ArrayList<Object> search(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> typesearch(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
