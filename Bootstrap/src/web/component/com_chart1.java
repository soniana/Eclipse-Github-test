package web.component;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class com_chart1
 */
@WebServlet({ "/com_chart1", "/chart1" })
public class com_chart1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	   Statement stmt;
	       
	    public com_chart1() {
	        super();
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }      
	    }

	   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		   String next="main.jsp";
		   String center="";
		   String db=request.getParameter("db");
		   if(db.equals("go")){
			   center="template1";
			   
			   request.setAttribute("center",center);
			   RequestDispatcher rd=request.getRequestDispatcher(next);
			   rd.forward(request, response);
		   }else{	   
		   
		   try {
			   
			   con = DriverManager.getConnection("jdbc:oracle:thin:@13.124.99.38:1521:XE","db","db");
			   		          
			   stmt = con.createStatement();
			   String sqlmoon;
			   String sqlmoon1;
			   String sqlmoon2;
			  
			   String comid;
			   sqlmoon1 = "select memjang1, count(memjang1) from mem_info where memid in (select memid from re_info where mt20id in (select mt20id from prf_detail where genrenm in (select genrenm from com_info where comid='";
			   sqlmoon2="'))) group by memjang1";
			   comid =request.getParameter("comid");
			   System.out.println(comid);
			   sqlmoon=sqlmoon1+comid+sqlmoon2;
	           ResultSet rs = stmt.executeQuery(sqlmoon);
	            
	           
	           
	           
	          
	           JSONArray ja = new JSONArray(); //대괄호 생성
	           
	            while(rs.next()) { //객체 생성
	               JSONObject jo = new JSONObject();
	               jo.put("name", rs.getString(1));
	               jo.put("y", rs.getInt(2));
	               ja.add(jo);
	              
	              
	            }
	         
	            //System.out.println(ja.toJSONString());
	         System.out.println("안되는부분"+ja.toJSONString());
	         response.setContentType("text/json;charset=euc-kr");
	         PrintWriter out = response.getWriter();
	         out.print(ja.toJSONString());
	         
	         con.close();   //커넥션 종료
	         System.out.println("Success....");

	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	   }
	   }
	}