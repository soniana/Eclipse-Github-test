package web.highchart;

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
 * Servlet implementation class Project3_Top3_Servlet
 */
@WebServlet({ "/Project3_Top3_Servlet", "/hive333" })
public class Project3_Top3_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Connection con;
	   Statement stmt;
	       
	    public Project3_Top3_Servlet() {
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
			   String sqlmoon;
			   String sqlmoon1;
			   String sqlmoon2;
			   String sqlmoon3;
			   String sqlmoon4;
			   String memid;
			   sqlmoon1 = "select poster,prfnm from(select distinct p.poster,p.prfnm, p.totnmrs from re_info r, mem_info m,prf_detail p where m.memid=r.memid and p.mt20id=r.mt20id and p.mt20id in(select mt20id from re_info where memid in (select memid from mem_info where mempa1 in (select p.prfnm from re_info r,prf_detail p where r.mt20id=p.mt20id and r.memid='";
			   sqlmoon2="') or mempa2 in (select p.prfnm from re_info r,prf_detail p where r.mt20id=p.mt20id and r.memid='";
			   sqlmoon3="') or mempa3 in (select p.prfnm from re_info r,prf_detail p where r.mt20id=p.mt20id and r.memid='";
			   sqlmoon4="'))) order by p.totnmrs desc) where rownum<4";
			   memid =request.getParameter("memid");
			   sqlmoon=sqlmoon1+memid+sqlmoon2+memid+sqlmoon3+memid+sqlmoon4;
	           ResultSet rs = stmt.executeQuery(sqlmoon);
	            
	           
	           
	           
	          
	           JSONArray ja = new JSONArray(); //措褒龋 积己
	           
	            while(rs.next()) { //按眉 积己
	               JSONObject jo = new JSONObject();
	               jo.put("poster", rs.getString(1));
	               jo.put("name", rs.getString(2));
	               //jo.put("y", rs.getInt(2));
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