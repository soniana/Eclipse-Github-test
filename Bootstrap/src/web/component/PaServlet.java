package web.component;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.prf_detail.Prf_detailBiz;

import web.dispatcher.Util;

@WebServlet({ "/PaServlet", "/pa" })
public class PaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Prf_detailBiz biz;
    public PaServlet() {
        super();
        biz=new Prf_detailBiz();
    }
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String next="main.jsp";
		String center="prf/center";
		//화면 이동
		String db=request.getParameter("db");
		if(db.equals("search")){
			//정보 조회
			ArrayList<Object> list=null;
			try {
				list=biz.get();
			} catch (Exception e) {
				e.printStackTrace();
			}
			//Center 화면 이동
			request.setAttribute("prflist",list);
			center="prf/list";
		}else if(db.equals("detail1")){
			String prfnm=request.getParameter("prfnm");
			prfnm=Util.convertKr(prfnm);
			ArrayList<Object> list=null;
			try {
				list=biz.search(prfnm);
				request.setAttribute("prf",list);
				next="mem_info/registerPop1.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(db.equals("detail2")){
			String prfnm=request.getParameter("prfnm");
			prfnm=Util.convertKr(prfnm);
			ArrayList<Object> list=null;
			try {
				list=biz.search(prfnm);
				request.setAttribute("prf",list);
				next="mem_info/registerPop2.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(db.equals("detail3")){
			String prfnm=request.getParameter("prfnm");
			prfnm=Util.convertKr(prfnm);
			ArrayList<Object> list=null;
			try {
				list=biz.search(prfnm);
				request.setAttribute("prf",list);
				next="mem_info/registerPop3.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("center",center);
		RequestDispatcher rd=request.getRequestDispatcher(next);
		rd.forward(request, response);
	}//end if else

}
