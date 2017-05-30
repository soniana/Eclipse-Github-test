package web.component;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.com_info.Com_infoBiz;
import com.com_list.Com_listBiz;
import com.vo.Com_info;
import com.vo.Com_list;

import web.dispatcher.Util;

@WebServlet({ "/Com_Servlet", "/cominfo", "/com" })
public class Com_InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Com_infoBiz biz;
	Com_listBiz biz1;
	public Com_InfoServlet() {
		super();
		biz = new Com_infoBiz();
		biz1 = new Com_listBiz();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String view = request.getParameter("view");
		String next = "main.jsp";
		String center = "";
		if (view != null) {
			center = "com_info/add";
		}else {
			String db = request.getParameter("db");
			if (db.equals("search")) {
				ArrayList<Object> list = null;
				try {
					list = biz.get();
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("cominfo", list);
				center = "com_info/comlist";
			}else if (db.equals("add")) {
				String comid = request.getParameter("comid");
				String compw = request.getParameter("compw");
				String entrpsnm = request.getParameter("entrpsnm");
				entrpsnm= Util.convertKr(entrpsnm);
				String mt30id="";
				try {
					mt30id = ((Com_list)biz1.search(entrpsnm).get(0)).getMt30id();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				String comtel = request.getParameter("comtel");
				String genrenm = request.getParameter("genrenm");
				genrenm= Util.convertKr(genrenm);
				Com_info cominfo = new Com_info(comid, compw, mt30id,entrpsnm, comtel, genrenm);
				try {
					biz.register(cominfo);
					request.setAttribute("addcominfo",cominfo);
					center = "com_info/registerok";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(db.equals("mypage")){
				center="com_info/mypage";
			}else if (db.equals("detail")) {
				String comid = request.getParameter("comid");
				Com_info cominfo = null;
				try {
					cominfo = (Com_info) biz.get(comid);
					request.setAttribute("cominfo", cominfo);
					center = "com_info/detail";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(db.equals("mylist")){
				String comid=request.getParameter("comid");
				Com_info cominfo = null;
				ArrayList<Object> list=null;
				try {
					cominfo=(Com_info)biz.get(comid);
					String entrpsnm=cominfo.getEntrpsnm();
					list=biz.search(entrpsnm);
					request.setAttribute("prflist",list);
					center="com_info/mylist";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(db.equals("redetail")){
				String mt20id=request.getParameter("mt20id");
				ArrayList<Object> list=null;
				try {
					list=biz.typesearch(mt20id);
					request.setAttribute("redelist",list);
					center="com_info/mydetail";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (db.equals("delete")) {
				String comid = request.getParameter("comid");
				try {
					biz.remove(comid);
					request.setAttribute("deletecomid", comid);
					center = "com_info/deleteok";
				} catch (Exception e) {
					center = "com_info/deletefail";
					e.printStackTrace();
				}
			}else if (db.equals("updateview")) {
				String comid = request.getParameter("comid");
				Com_info cominfo = null;
				try {
					cominfo = (Com_info) biz.get(comid);
					request.setAttribute("cominfo", cominfo);
					center = "com_info/update";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (db.equals("update")) {
				String comid = request.getParameter("comid");
				String compw = request.getParameter("compw");
				String mt30id = request.getParameter("mt30id");
				String entrpsnm = request.getParameter("entrpsnm");
				entrpsnm= Util.convertKr(entrpsnm);
				String comtel = request.getParameter("comtel");
				String genrenm = request.getParameter("genrenm");
				genrenm= Util.convertKr(genrenm);
				Com_info cominfo = new Com_info(comid, compw, mt30id,entrpsnm, comtel, genrenm);
				try {
					biz.modify(cominfo);
					next = "com.show?db=detail&id="+comid;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} // end if else
		request.setAttribute("center", center);
		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}
}
