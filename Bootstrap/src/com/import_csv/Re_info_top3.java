package com.import_csv;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


@WebServlet({ "/Re_info_top3", "/re111" })
public class Re_info_top3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  //Connection conn;
	   Connection con;
	   Statement stmt;
	       
	    public Re_info_top3() {
	        super();
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }      
	    }

	   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
		   
		   /*String user = "db";
		   String password = "db";
		   String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";*/
		   
		   
		   try {
			   
			   con = DriverManager.getConnection("jdbc:oracle:thin:@13.124.91.125:1521:XE","db","db");
			   		          
			   stmt = con.createStatement();
			   String sql ="select poster,PRFNM from (select p.PRFNM, p.poster, r.mt20id ,count(r.mt20id) from re_info r, prf_detail p where p.mt20id=r.mt20id group by r.mt20id,p.poster,p.PRFNM order by count(r.mt20id) desc) where rownum<4";
			  
	           ResultSet rs = stmt.executeQuery(sql);
	           
	           JSONArray ja = new JSONArray(); //措褒龋 积己
	           
	            while(rs.next()) { //按眉 积己
	               JSONObject jo = new JSONObject();
	               jo.put("poster", rs.getString(1));
	               jo.put("PRFNM", rs.getString(2));
	               ja.add(jo);
	              
	              
	            }
	         
	            System.out.println("抗概鉴 : "+ja.toJSONString());

	         response.setContentType("text/json;charset=euc-kr");
	         PrintWriter out = response.getWriter();
	         out.print(ja.toJSONString());
	        
	         con.close();   //目池记 辆丰
	         System.out.println("Success....");

	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	   }

	}