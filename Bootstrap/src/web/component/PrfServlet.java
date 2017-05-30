package web.component;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.prf_detail.Prf_detailBiz;
import com.vo.Prf_detail;

import web.dispatcher.Util;

@WebServlet({ "/PrfServlet", "/prf" })
public class PrfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Prf_detailBiz biz;
    private Logger perform_log = Logger.getLogger("perform"); 
    public PrfServlet() {
        super();
        biz=new Prf_detailBiz();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Prf_detail prf=null;
		String next="main.jsp";
		String center="prf/center";
		String db=request.getParameter("db");
		if(db.equals("search")){
			ArrayList<Object> list=null;
			try {
				list=biz.get();
				request.setAttribute("prflist",list);
				center="prf/list";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(db.equals("typesearch")){
			String gen=request.getParameter("gen");
			String typee=null;
			if(gen.equals("all")){
				typee="공연 전체";
			}else{
				if(gen.equals("y")){
					typee="연극";
				}else if(gen.equals("m")){
					typee="뮤지컬";
				}else if(gen.equals("o")){
					typee="오페라";
				}else if(gen.equals("c")){
					typee="클래식";
				}else if(gen.equals("d")){
					typee="무용";
				}else if(gen.equals("b")){
					typee="발레";
				}else if(gen.equals("k")){
					typee="국악";
				}else if(gen.equals("s")){
					typee="복합";
				}
			}		
			request.setAttribute("typee",typee);
			center="prf/newlist";
		}else if(db.equals("detail")){
			String id=request.getParameter("id");
			Prf_detail prf_detail=null;
			try {
				prf_detail=(Prf_detail)biz.get(id);
				request.setAttribute("prf",prf_detail);
				center="prf/detail";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(db.equals("deul")){
			String id=request.getParameter("id");
			Prf_detail prf_detail=null;
			try {
				prf_detail=(Prf_detail)biz.get(id);
				request.setAttribute("prf",prf_detail);
				request.setAttribute("prfpdfrom",prf_detail.getPrfpdfrom());
				request.setAttribute("prfpdto",prf_detail.getPrfpdto());
				center="re/add";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(db.equals("geom")){
			String prfnm=request.getParameter("prfnm");
			prfnm=Util.convertKr(prfnm);
			ArrayList<Object> list=null;
			try {
				list=biz.search(prfnm);
				request.setAttribute("prflist",list);
				center="prf/list";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(db.equals("Bmember")){
			String prfnm=request.getParameter("prfnm");
			prfnm=Util.convertKr(prfnm);
			ArrayList<Object> list=null;
			try {
				list=biz.search(prfnm);
				request.setAttribute("prflist",list);
				center="prf/list";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(db.equals("peDetail")){
			String mt20id=request.getParameter("mt20id");
			
			System.out.println("여기먼저"+mt20id);
			try {
				prf=(Prf_detail)biz.get(mt20id);
				perform_log.debug(prf.getMt10id()+","+prf.getMt20id()+","+prf.getGenrenm());
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("mt20id",mt20id);
			center="PeDetail";			
		}

		request.setAttribute("center",center);
		RequestDispatcher rd=request.getRequestDispatcher(next);
		rd.forward(request, response);
	}//end if else
		
}
