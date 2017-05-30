package web.component;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.com_list.Com_listBiz;
import com.vo.Com_list;

import web.dispatcher.Util;

@WebServlet({ "/Com_listServlet", "/comlist" })
public class Com_listServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Com_listBiz biz;
	public Com_listServlet() {
		super();
		biz = new Com_listBiz();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String next = "main.jsp";
		String center = "";
		String db = request.getParameter("db");
		if (db.equals("search")) {
			ArrayList<Object> list = null;
			try {
				list = biz.get();
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("comlist", list);
			center = "com_list/list";
		} else if (db.equals("detail")) {
			String comid = request.getParameter("id");
			Com_list com_list = null;
			try {
				com_list = (Com_list) biz.get(comid);
				request.setAttribute("comlist",com_list);
				center="com_list/detail";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(db.equals("detail1")){
			String entrpsnm=request.getParameter("entrpsnm");
			entrpsnm=Util.convertKr(entrpsnm);
			ArrayList<Object> list=null;
			try {
				list=biz.search(entrpsnm);
				request.setAttribute("comlist",list);
				next="com_info/registerPop1.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("center", center);
		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}
}
