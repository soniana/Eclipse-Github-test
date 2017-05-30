package web.component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dispatcher.Util;

@WebServlet({"/PeDetailServelet","/PeDetail"})
public class PeDetailServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PeDetailServelet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String db=request.getParameter("db");
		if(db!=null){
			String next="main.jsp";
			String center="";
			if(db.equals("reDetail")){			
				String prfnm=Util.convertKr(request.getParameter("prfnm"));
				String fcltynm=Util.convertKr(request.getParameter("fcltynm"));
				request.setAttribute("poster",request.getParameter("poster"));
				request.setAttribute("mt20id",request.getParameter("mt20id"));
				request.setAttribute("prfnm",prfnm);
				request.setAttribute("mt10id",request.getParameter("mt10id"));
				request.setAttribute("fcltynm",fcltynm);
				request.setAttribute("prfpdfrom",request.getParameter("prfpdfrom"));
				request.setAttribute("prfpdto",request.getParameter("prfpdto"));
				System.out.println(request.getParameter("mt20id"));
				center="re/reservation_page";
			}else if(db.equals("goList")){
				String mt20id=request.getParameter("mt20id");
				request.setAttribute("id",mt20id);
				center="re/list";			
			}
			request.setAttribute("center",center);
			RequestDispatcher rd =request.getRequestDispatcher(next);
			rd.forward(request, response);
		}else{			
			String str="http://www.kopis.or.kr/openApi/restful/pblprfr/"+request.getParameter("mt20id")+"?service=9980fac33e384b6fbb7d7917b9fab551";
			URL url = new URL(str);
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			StringBuffer sb = new StringBuffer();
			String temp = null;
			while (true) {
				System.out.println("ghghhgh");
				temp = br.readLine();
				if (temp == null) {
					break;
				}
				sb.append(temp);
				System.out.println(sb);
			}
			response.setContentType("text/xml;charset=euc-kr");
			
			PrintWriter out = response.getWriter();
			out.print(sb.toString());
			out.close();
		}
		
	}

}
