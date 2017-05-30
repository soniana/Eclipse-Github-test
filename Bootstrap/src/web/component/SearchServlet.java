package web.component;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.search.searchBiz;
import com.vo.Keyword;

import web.dispatcher.Util;

@WebServlet({ "/SearchServlet", "/search" })
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;    
	searchBiz biz;
    public SearchServlet() {
        super();
    	biz=new searchBiz();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String next="main.jsp";
		String center="";
		String db=request.getParameter("db");
		if(db.equals("search")){
			center="search";
		}else if(db.equals("goDd")){
			center="dd";
		}else if(db.equals("gogogo")){
			String searchterm=request.getParameter("searchterm");
			searchterm=Util.convertKr(searchterm);
			String memid=request.getParameter("memid");
			Keyword keyword=new Keyword(memid,searchterm);
			ArrayList<Object> list=null;
			try {
				list=biz.search(searchterm);
				request.setAttribute("searchlist",list);
				if(keyword!=null){
					biz.register(keyword);
				}
				center="searchResult";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(db.equals("gogo")){
			String searchterm=request.getParameter("searchterm");
			searchterm=Util.convertKr(searchterm);
			Keyword keyword=new Keyword(null,searchterm);
			ArrayList<Object> list=null;
			try {
				list=biz.search(searchterm);
				request.setAttribute("searchlist",list);
				if(keyword!=null){
					biz.register(keyword);
				}
				center="searchResult";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("center", center);
		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}

}
