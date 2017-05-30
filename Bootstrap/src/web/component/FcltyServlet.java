package web.component;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fclty_list.Fclty_listBiz;
import com.vo.Fclty_list;

@WebServlet({ "/FcltyServlet", "/fclty" })
public class FcltyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	Fclty_listBiz biz;	
    public FcltyServlet() {
        super();
        biz = new Fclty_listBiz();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = request.getParameter("view");
		String next = "main.jsp";
		String center = "";		
		if(view == null){
			String db = request.getParameter("db");
			if(db.equals("search")){
				ArrayList<Object> list = null;
				try {
					list = biz.get();
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("fcltylist",list);
				center = "fclty/list";		
			}else if(db.equals("detail")){
				String id=request.getParameter("id");
				Fclty_list fclty_list=null;
				try {
					fclty_list=(Fclty_list)biz.get(id);
					request.setAttribute("detailfclty",fclty_list);
					center="fclty/detail";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//end if else 
		request.setAttribute("center", center);
		RequestDispatcher rd=
		request.getRequestDispatcher(next);
		rd.forward(request, response);
		}
	}
}
