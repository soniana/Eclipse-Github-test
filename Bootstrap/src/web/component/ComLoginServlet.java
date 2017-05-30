package web.component;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.com_info.Com_infoBiz;
import com.vo.Com_info;

@WebServlet({ "/ComLoginServlet", "/comlogin" })
public class ComLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Com_infoBiz biz;
    public ComLoginServlet() {
        super();
        biz = new Com_infoBiz();
    }

    // logout, get type
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		HttpSession session = request.getSession();
 		if (session != null) {
 			session.getAttribute("logincom");
 			session.invalidate();
 			response.sendRedirect("main.show");
 		}
 	}

 	// login, post type
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		String comid = request.getParameter("comid");
 		String compw = request.getParameter("compw");
 		Com_info cominfo = null;
 		String next = "main.jsp";
 		String center = "center";
 		try {
 			cominfo = (Com_info) biz.get(comid);
 			if (compw.equals(cominfo.getCompw())) {
 				HttpSession session = request.getSession();
 				session.setAttribute("logincom", cominfo);
 			}else{
	  			request.setAttribute("login","err");
	  			center="login";
 			}
 		} catch (Exception e) {
  			request.setAttribute("login","err");
  			center="login";
 			e.printStackTrace();
 		}
 		request.setAttribute("center", center);
 		RequestDispatcher rd = request.getRequestDispatcher(next);
 		rd.forward(request, response);
 	}
}
