package web.component;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem_info.Mem_infoBiz;
import com.vo.Mem_info;

@WebServlet({ "/LoginServlet", "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Mem_infoBiz biz; 
    public LoginServlet() {
        super();
        biz=new Mem_infoBiz();
    }

    //LOGOUT, GET TYPE
  	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		HttpSession session=request.getSession();
  		if(session!=null){
  			session.getAttribute("loginmem");
  			session.invalidate();
  			response.sendRedirect("main.show");
  		}
  	}

  	//LOGIN, POST TYPE
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		String id=request.getParameter("id");
  		String pwd=request.getParameter("pwd");
  		Mem_info mem_info=null;
  		String next="main.jsp";
  		String center="center";
  		String db = request.getParameter("db");
  		
  		if(db.equals("admini")){
			String adminid=request.getParameter("adminid");
			try {
				Mem_info meminfo = (Mem_info)biz.get(adminid);
				String pwdadmini=request.getParameter("pwdadmini");
				if(pwdadmini.equals(meminfo.getAdmini())){
					HttpSession session=request.getSession();
					session.setAttribute("loginmem",meminfo);
				}else{
					request.setAttribute("adminid",adminid);
	  				request.setAttribute("loginad","error");
		  			center="loginadmini";
	  			}
			}catch (Exception e) {
				request.setAttribute("login","error");
				e.printStackTrace();
			}
		}else if(db.equals("mem")){
			try {
	  			mem_info=(Mem_info)biz.get(id);
	  	  		if(id.equals("admini")){
	  					if(pwd.equals(mem_info.getMempw())){
	  						request.setAttribute("adminid",id);
	  						center="loginadmini";
	  					}else{
	  		  				request.setAttribute("login","error");
	  			  			center="login";
	  		  			}
	  			}else if(pwd.equals(mem_info.getMempw())){
	  				HttpSession session=request.getSession();
	  				session.setAttribute("loginmem",mem_info);
	  			}else{
	  				request.setAttribute("login","error");
		  			center="login";
	  			}
	  		}catch (Exception e) {
	  			request.setAttribute("login","error");
	  			center="login";
	  			e.printStackTrace();
	  		}
		}//end if else
  		request.setAttribute("center",center);
  		RequestDispatcher rd=request.getRequestDispatcher(next);
  		rd.forward(request,response);
  	}
}
