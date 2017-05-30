package web.component;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.keyword.KeywordBiz;
import com.keyword.keywordDao;
import com.vo.Keyword;

/**
 * Servlet implementation class KeywordServlet
 */
@WebServlet({ "/KeywordServlet", "/keyword" })
public class KeywordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	KeywordBiz biz;
    public KeywordServlet() {
        super();
        biz=new KeywordBiz();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Object> list=null;
		try {
			list=biz.get();
			 JSONArray ja = new JSONArray(); //´ë°ýÈ£ »ý¼º
					
			for(int i=0;i<10;i++){
				Keyword key=(Keyword)list.get(i);
				 JSONObject jo = new JSONObject();
	              jo.put("search", key.getSearch());
	              jo.put("rank", key.getRank());
	              ja.add(jo);
				
			}
	             
	             response.setContentType("text/json;charset=euc-kr");
		         PrintWriter out = response.getWriter();
		         out.print(ja.toJSONString());
	         
			System.out.print(
					ja.toJSONString());
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
