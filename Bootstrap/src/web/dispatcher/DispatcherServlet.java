package web.dispatcher;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/DispatcherServlet", "/dispatcher" })
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DispatcherServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();	// *.big 이면 무조건 이 함수로 이동
		String path = uri.substring(uri.lastIndexOf("/"));
		path = path.substring(1, path.lastIndexOf("."));
		String next = "main.jsp";
		if(path.equals("main")){		// main 이면 이쪽으로 이동
			String view = request.getParameter("view");
			request.setAttribute("navi", Navi.home);
			if(view != null){
				build(request, view);
			}
			next = "main.jsp";
		}else{							// main이 아니면 이쪽으로 이동
			next = path; 		
		}
		RequestDispatcher rd =request.getRequestDispatcher(next);
		rd.forward(request, response);		
	}
	
	
	private void build(HttpServletRequest request, String view){		
		if(view.equals("login")){
			request.setAttribute("center", "login");
			request.setAttribute("nav", Navi.login);
		}else if(view.equals("comlogin")){
			request.setAttribute("center", "comlogin");
			request.setAttribute("nav", Navi.comlogin);
		}else if(view.equals("register")){
			request.setAttribute("center", "register");
			request.setAttribute("nav", Navi.register);
		} else if(view.equals("re")){
			request.setAttribute("center", "re/center");
			request.setAttribute("nav", Navi.re);
		} else if(view.equals("prf")){
			request.setAttribute("center", "prf/center");
			request.setAttribute("nav", Navi.prf);
		}else if(view.equals("fclty")){
			request.setAttribute("center", "fclty/center");
			request.setAttribute("nav", Navi.fclty);
		}else if(view.equals("mem_info")){
			request.setAttribute("center", "mem_info/center");
			request.setAttribute("nav", Navi.mem_info);
	    }else if(view.equals("com_info")){
			request.setAttribute("center", "com_info/center");
			request.setAttribute("nav", Navi.com_info);		 
		}else if(view.equals("com_list")){
			request.setAttribute("center", "com_list/center");
			request.setAttribute("nav", Navi.com_list);
		}
	}

}
