package web.component;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem_info.Mem_infoBiz;
import com.vo.Mem_info;

import web.dispatcher.Util;

@WebServlet({ "/MeminfoServlet", "/mem_info" })
public class MeminfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Mem_infoBiz biz;	
    public MeminfoServlet() {
        super();
        biz = new Mem_infoBiz();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = request.getParameter("view");
		String next = "main.jsp";
		String center = "";
		if(view != null) {
			center = "mem_info/add";
		}else {
			String db = request.getParameter("db");
			if(db.equals("search")){
				ArrayList<Object> list = null;
				try {
					list = biz.get();
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("mem_info",list); //리스트를 담아서 보낸다.
				center = "mem_info/memlist"; //list 폴더에 가져온 데이터를 뿌린다.
			}else if(db.equals("add")){
				String memid=request.getParameter("memid"); //이 값이 뿌려질 때 한글 깨짐 현상 발생
				String mempw=request.getParameter("mempw");
				String memname=request.getParameter("memname");
				memname = Util.convertKr(memname);
				String memtel=request.getParameter("memtel");
				String mememail=request.getParameter("mememail");
				String memgen=request.getParameter("memgen");
				memgen = Util.convertKr(memgen);
				String memage=request.getParameter("memage");
				memage = Util.convertKr(memage);
				String memmarry=request.getParameter("memmarry");
				memmarry = Util.convertKr(memmarry);
				String memjob=request.getParameter("memjob");
				memjob = Util.convertKr(memjob);
				String memtype=request.getParameter("memtype");
				memtype = Util.convertKr(memtype);
				String[] memjang=request.getParameterValues("memjang");
				String memjang1=memjang[0];
				String memjang2=memjang[1];
				String memjang3=memjang[2];
				memjang1 = Util.convertKr(memjang1);
				memjang2 = Util.convertKr(memjang2);
				memjang3 = Util.convertKr(memjang3);
				String mempa1="";
				String mempa2="";
				String mempa3="";
				
				Mem_info mem_info = new Mem_info(memid,mempw,memname,memtel,mememail,memgen,memage,memmarry,memjob,memtype,
						memjang1,memjang2,memjang3,mempa1,mempa2,mempa3);
				try {
					biz.register(mem_info); 
					request.setAttribute("addmeminfo",mem_info); //데이터를 request에 넣음
					center = "mem_info/add2";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(db.equals("addition")){
				String memid=request.getParameter("memid");
				String mempa1=request.getParameter("mempa1");
				mempa1 = Util.convertKr(mempa1);
				String mempa2=request.getParameter("mempa2");
				mempa2 = Util.convertKr(mempa2);
				String mempa3=request.getParameter("mempa3");
				mempa3 = Util.convertKr(mempa3);	
				
				Mem_info mem=null;
				Mem_info mem_info=null;				
				try {
					mem =(Mem_info)biz.get(memid);				
					String mempw=mem.getMempw();
					String memname=mem.getMemname();
					String memtel=mem.getMemtel();
					String mememail=mem.getMememail();
					String memgen=mem.getMemgen();
					String memage=mem.getMemage();
					String memmarry=mem.getMemmarry();
					String memjob=mem.getMemjob();
					String memtype=mem.getMemtype();
					String memjang1=mem.getMemjang1();
					String memjang2=mem.getMemjang2();
					String memjang3=mem.getMemjang3();
					mem_info=new Mem_info(memid,mempw,memname,memtel,mememail,memgen,memage,memmarry,memjob,memtype,
							memjang1,memjang2,memjang3,mempa1,mempa2,mempa3);
					biz.modify(mem_info); 
					request.setAttribute("addmeminfo",mem_info); //데이터를 request에 넣음
					center = "mem_info/registerok";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(db.equals("mypage")){
					center="mem_info/mypage";
			}else if(db.equals("detail")){
				String memid =request.getParameter("memid");
				Mem_info mem_info =null; //받을 준비 
				try {
					mem_info = (Mem_info) biz.get(memid);
					request.setAttribute("memdetail", mem_info); //"" 괄호안의 이름 똑같이 가져오면 안된다.
					center="mem_info/detail"; //center에 detail이 뿌려지면 된다. cust 폴더 밑에 detail만든다					
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}else if(db.equals("delete")){
				String memid=request.getParameter("memid");
				try {
					biz.remove(memid);
					request.setAttribute("deleteid",memid);
					HttpSession session=request.getSession();
			  		if(session!=null){
			  			session.getAttribute("loginmem");
			  			session.invalidate();
			  		}
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}else if(db.equals("updateview")){
				String memid=request.getParameter("memid");
				Mem_info mem_info =null;
				try {
					mem_info = (Mem_info) biz.get(memid);
					request.setAttribute("updatememinfo",mem_info);
					center="mem_info/detailupdate";
				} catch (Exception e1) {
					e1.printStackTrace();
				}		
			}else if(db.equals("update")){		
				String memid=request.getParameter("memid");
				String mempw=request.getParameter("mempw");
				String memname=request.getParameter("memname");
				memname = Util.convertKr(memname);
				String memtel=request.getParameter("memtel");
				String mememail=request.getParameter("mememail");
				String memgen=request.getParameter("memgen");
				memgen = Util.convertKr(memgen);
				String memage=request.getParameter("memage");
				memage = Util.convertKr(memage);
				String memmarry=request.getParameter("memmarry");
				memmarry = Util.convertKr(memmarry);
				String memjob=request.getParameter("memjob");
				memjob = Util.convertKr(memjob);
				String memtype=request.getParameter("memtype");
				memtype = Util.convertKr(memtype);
				String[] memjang=request.getParameterValues("memjang");
				String memjang1=memjang[0];
				String memjang2=memjang[1];
				String memjang3=memjang[2];
				memjang1 = Util.convertKr(memjang1);
				memjang2 = Util.convertKr(memjang2);
				memjang3 = Util.convertKr(memjang3);
				String mempa1=request.getParameter("mempa1");
				mempa1 = Util.convertKr(mempa1);
				String mempa2=request.getParameter("mempa2");
				System.out.println(mempa2);
				mempa2 = Util.convertKr(mempa2);
				String mempa3=request.getParameter("mempa3");
				mempa3 = Util.convertKr(mempa3);
				String admini=request.getParameter("admini");
		
				Mem_info mem_info = new Mem_info(memid,mempw,memname,memtel,mememail,memgen,memage,memmarry,memjob,memtype,memjang1,memjang2,memjang3,mempa1,mempa2,mempa3,admini);
				try {
					biz.modify(mem_info); 
					next="mem_info.show?db=detail&memid="+memid;
				} catch (Exception e) {				
					e.printStackTrace();
				}
			}else if(db.equals("admini")){
				center="mem_info/myadmini";
			}
		}//end if else
		request.setAttribute("center", center);
		RequestDispatcher rd = 						// next로 이동시켜준다
		request.getRequestDispatcher(next);
		rd.forward(request, response);
	}

}
