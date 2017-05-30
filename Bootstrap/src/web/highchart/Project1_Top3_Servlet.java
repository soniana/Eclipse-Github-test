package web.highchart;

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
 * Servlet implementation class Project1_Top3_Servlet
 */
@WebServlet({ "/Project1_Top3_Servlet", "/hive111" })
public class Project1_Top3_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  //Connection conn;
	   Connection con;
	   Statement stmt;
	       
	    public Project1_Top3_Servlet() {
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
		   String next="main.jsp";
		   String center="";
		   String db=request.getParameter("db");
		   if(db.equals("gogo")){
			   center="template";
			   
			   request.setAttribute("center",center);
			   RequestDispatcher rd=request.getRequestDispatcher(next);
			   rd.forward(request, response);
		   }else{
			   try {
				   
				   con = DriverManager.getConnection("jdbc:oracle:thin:@13.124.91.125:1521:XE","db","db");
				   		          
				   stmt = con.createStatement();
				   String sqlmoon;
				   String sqlmoon1;
				   String sqlmoon3;
				   String sqlmoon4;
				   String memid;
				   sqlmoon1 = "select poster, prfnm from(select distinct p.poster, p.prfnm, p.totnmrs from re_info r, mem_info m, prf_detail p where m.memid=r.memid and p.mt20id=r.mt20id and m.memgen=(select distinct m.memgen from re_info r, mem_info m where m.memid=r.memid and r.memid='";				  
				   sqlmoon3="') and substr(m.memage,1,1)=(select distinct substr(m.memage,1,1)from re_info r, mem_info m where m.memid=r.memid and r.memid='";
				   sqlmoon4="') order by totnmrs desc) where rownum<4";
				   memid =request.getParameter("memid");
				   sqlmoon=sqlmoon1+memid+sqlmoon3+memid+sqlmoon4;
				   System.out.println(sqlmoon);
		           ResultSet rs = stmt.executeQuery(sqlmoon);
		           
		           JSONArray ja = new JSONArray(); //���ȣ ����
		           
		            while(rs.next()) { //��ü ����
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
		        
		         con.close();   //Ŀ�ؼ� ����
		         System.out.println("Success....");

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   }
		   
	   }

	}