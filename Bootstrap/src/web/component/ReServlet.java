package web.component;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.re_info.Re_infoBiz;
import com.vo.Re_info;

import web.dispatcher.Util;

@WebServlet({ "/ReServlet", "/re" })
public class ReServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Re_infoBiz biz;
    public ReServlet() {
        super();
        biz=new Re_infoBiz();
    }
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view=request.getParameter("view");
		String next="main.jsp";
		String center="";
		if(view!=null){
			if(view.equals("add")){
				center="re/add";
			}
		}else{
			String db=request.getParameter("db");
			if(db.equals("add")){
				String memid=request.getParameter("memid");
				String mt20id=request.getParameter("mt20id");
				String prfnm=request.getParameter("prfnm");
				prfnm=Util.convertKr(prfnm);
				String mt10id=request.getParameter("mt10id");
				String fcltynm=request.getParameter("fcltynm");
				fcltynm=Util.convertKr(fcltynm);
				String seldate=request.getParameter("seldate");
				String seltime=request.getParameter("seltime");
				seltime=Util.convertKr(seltime);
				int people=Integer.parseInt(request.getParameter("people"));
				String seattype=request.getParameter("seattype");
				seattype=Util.convertKr(seattype);
				int price=Integer.parseInt(request.getParameter("price"));
				String poster=request.getParameter("poster");
				Re_info re_info=null;
				//DB¿¡ ÀÔ·Â
				re_info=new Re_info(memid,mt20id,mt10id,fcltynm,seldate,seltime,people,seattype,price);
				try {
					biz.register(re_info);
					request.setAttribute("prfnm",prfnm);
					request.setAttribute("poster",poster);
					request.setAttribute("addre",re_info);
					center="re/reservation_ok";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(db.equals("search")){
				ArrayList<Object> list=null;
				try {
					list=biz.get();
					request.setAttribute("relist",list);
					center="re/list";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(db.equals("detail")){
				String id=request.getParameter("id");
				Re_info re_info=null;
				try {
					re_info=(Re_info)biz.get(id);
					request.setAttribute("re",re_info);
					center="re/detail";
				} catch (Exception e) {
					e.printStackTrace();
				}				
			}else if(db.equals("delete")){
				int reno=Integer.parseInt(request.getParameter("reno"));
				String memid=request.getParameter("memid");
				ArrayList<Object> list=null;
				try {
					biz.remove(reno);
					list=biz.search(memid);
					request.setAttribute("relist",list);
					center="re/list";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(db.equals("mylist")){
				String memid=request.getParameter("memid");
				ArrayList<Object> list=null;
				try {
					list=biz.search(memid);
//					String [] re=new String [list.size()];
//					String [] prfnm=new String [list.size()];
//					for(int i=0;i<list.size();i++){
//						re[i]=((Re_info)list.get(0)).getMt20id();
//						prfnm[i]=((Prf_detail)(biz1.get(re[i]))).getPrfnm();						
//					}
					request.setAttribute("relist",list);
//					request.setAttribute("prfnm",prfnm);
					center="re/list";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(db.equals("reDetail")){			
				String prfnm=Util.convertKr(request.getParameter("prfnm"));
				String fcltynm=Util.convertKr(request.getParameter("fcltynm"));
				request.setAttribute("poster",request.getParameter("poster"));
				request.setAttribute("mt20id",request.getParameter("mt20id"));
				request.setAttribute("prfnm",prfnm);
				request.setAttribute("mt10id",request.getParameter("mt10id"));
				request.setAttribute("fcltynm",fcltynm);
				request.setAttribute("prfpdfrom",request.getParameter("prfpdfrom"));
				request.setAttribute("prfpdto",request.getParameter("prfpdto"));			
				center="re/reservation_page";			
			}
		}//end if else
		request.setAttribute("center",center);
		RequestDispatcher rd =request.getRequestDispatcher(next);
		rd.forward(request, response);
	}

}
