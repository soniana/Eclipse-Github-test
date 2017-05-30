package com.import_csv;

import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
import au.com.bytecode.opencsv.CSVReader;


@WebServlet({ "/Com_import", "/csv1" })
public class Com_import extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 Connection conn;
	 
    public Com_import() {
        super();
        try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }      
	    }
    
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
     try{
    	 
    	 
    	   // 기존 logdata delete 
    	   Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@13.124.91.125:1521:XE", "db", "db");
           String delete_sql="delete from logdata";
           PreparedStatement pstmt=conn.prepareStatement(delete_sql);
           pstmt.executeUpdate();	
           conn.commit();
           close(pstmt);
           
           System.out.println("delete완료");
           
           
           // new logdata input 
           PreparedStatement sql_statement;
           String jdbc_insert_sql = "INSERT INTO logdata (clickdata,mt10id,mt20id,genrenm) VALUES (?,?,?,?)";
           sql_statement = conn.prepareStatement(jdbc_insert_sql);
           String inputCSVFile = "c:/machulogs/perform.csv";
           CSVReader reader = new CSVReader(new FileReader(inputCSVFile));
           String [] nextLine;             
           int lnNum = 0;
           while ((nextLine = reader.readNext()) != null) {
                   lnNum++;
                   sql_statement.setString(1, nextLine[0]);
                   sql_statement.setString(2, nextLine[1]);
                   sql_statement.setString(3, nextLine[2]);
                   sql_statement.setString(4, nextLine[3]);
                   sql_statement.executeUpdate();
           }               
           close1(sql_statement);
           conn.commit();
           
           System.out.println("insert완료");
           
           // Top3 poster select  
      
           String select_sql="select poster,PRFNM from (select p.PRFNM, p.poster, p.mt20id ,count(p.mt20id) from logdata l, prf_detail p where p.mt20id=l.mt20id group by p.mt20id,p.poster,p.PRFNM order by count(p.mt20id) desc) where rownum<4";
           PreparedStatement pstmt_select=conn.prepareStatement(select_sql);
           ResultSet rset= null;
   		   rset =pstmt_select.executeQuery();
   		   
           JSONArray ja = new JSONArray(); //대괄호 생성
           
           while(rset.next()) { //객체 생성
              JSONObject jo = new JSONObject();
              jo.put("poster", rset.getString(1));
              jo.put("PRFNM", rset.getString(2));
              ja.add(jo);
           }
             
           System.out.println("조회순 : "+ja.toJSONString());
             
             response.setContentType("text/json;charset=euc-kr");
	         PrintWriter out = response.getWriter();
	         out.print(ja.toJSONString());
	         close2(pstmt_select);
	         conn.commit();
	         conn.close(); 	         
	         
	         System.out.println("select완료");

      	 
     } catch (SQLException e) {
         e.printStackTrace();
      }
    	
    	
    	
    }


	private void close(PreparedStatement pstmt) {
		if(pstmt != null){
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	private void close1(PreparedStatement sql_statement) {
		if(sql_statement != null){
			try {
				sql_statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	private void close2(PreparedStatement pstmt_select) {
		if(pstmt_select != null){
			try {
				pstmt_select.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
