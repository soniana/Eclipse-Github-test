package web.component;

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

/**
 * Servlet implementation class com_chart3
 */
@WebServlet({ "/com_chart3", "/chart3" })
public class com_chart3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	Connection con;
	   Statement stmt;
	       
	    public com_chart3() {
	        super();
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }      
	    }

	   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
		 		   
		   
		   try {
			   
			   con = DriverManager.getConnection("jdbc:oracle:thin:@13.124.99.38:1521:XE","db","db");
			   		          
			   stmt = con.createStatement();
			   String sqlmoon;
			   String sqlmoon1;
			   String sqlmoon2;
			   
			   String comid;
			   sqlmoon1 = "select memjob, count(memjob) from mem_info where memid in (select memid from re_info where mt20id in (select mt20id from prf_detail where genrenm in (select genrenm from com_info where comid='";
			   sqlmoon2="'))) group by memjob";
			   comid =request.getParameter("comid");
			   sqlmoon=sqlmoon1+comid+sqlmoon2;
	           ResultSet rs = stmt.executeQuery(sqlmoon);
	            
	           
	           
	           
	          
	           JSONArray ja = new JSONArray(); //措褒龋 积己
	           
	            while(rs.next()) { //按眉 积己
	               JSONObject jo = new JSONObject();
	               jo.put("name", rs.getString(1));
	               jo.put("y", rs.getInt(2));
	               ja.add(jo);
	              
	              
	            }
	         
	            //System.out.println(ja.toJSONString());
	         System.out.println(ja.toJSONString());
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