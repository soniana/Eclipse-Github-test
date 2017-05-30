package web.component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/Prflist", "/prflist1" })
public class Prflist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String gen=request.getParameter("gen");
			String str="";
			if(gen.equals("all")){
				str="http://www.kopis.or.kr/openApi/restful/pblprfr?service=9980fac33e384b6fbb7d7917b9fab551&stdate=20170117&eddate=20180101&cpage=1&rows=60&prfstate=02";
			}
			else if(gen.equals("y")){
				str="http://www.kopis.or.kr/openApi/restful/pblprfr?service=9980fac33e384b6fbb7d7917b9fab551&stdate=20170117&eddate=20180101&cpage=1&rows=60&prfstate=02&shcate=AAAA";
			}
			else if(gen.equals("m")){
				str="http://www.kopis.or.kr/openApi/restful/pblprfr?service=9980fac33e384b6fbb7d7917b9fab551&stdate=20170117&eddate=20180101&cpage=1&rows=60&prfstate=02&shcate=AAAB";
			}
			else if(gen.equals("o")){
				str="http://www.kopis.or.kr/openApi/restful/pblprfr?service=9980fac33e384b6fbb7d7917b9fab551&stdate=20170117&eddate=20180101&cpage=1&rows=60&prfstate=02&shcate=CCCB";
			}
			else if(gen.equals("c")){
				str="http://www.kopis.or.kr/openApi/restful/pblprfr?service=9980fac33e384b6fbb7d7917b9fab551&stdate=20170117&eddate=20180101&cpage=1&rows=60&prfstate=02&shcate=CCCA";
			}
			else if(gen.equals("d")){
				str="http://www.kopis.or.kr/openApi/restful/pblprfr?service=9980fac33e384b6fbb7d7917b9fab551&stdate=20170117&eddate=20180101&cpage=1&rows=60&prfstate=02&shcate=BBBA";
			}
			else if(gen.equals("b")){
				str="http://www.kopis.or.kr/openApi/restful/pblprfr?service=9980fac33e384b6fbb7d7917b9fab551&stdate=20170117&eddate=20180101&cpage=1&rows=60&prfstate=02&shcate=BBBB";
			}
			else if(gen.equals("k")){
				str="http://www.kopis.or.kr/openApi/restful/pblprfr?service=9980fac33e384b6fbb7d7917b9fab551&stdate=20170117&eddate=20180101&cpage=1&rows=60&prfstate=02&shcate=CCCC";
			}
			else if(gen.equals("s")){
				str="http://www.kopis.or.kr/openApi/restful/pblprfr?service=9980fac33e384b6fbb7d7917b9fab551&stdate=20170117&eddate=20180101&cpage=1&rows=60&prfstate=02&shcate=EEEA";
			}

			/*String cpage="1";
			String add = "&rows=60&prfstate=02";
			str= str+cpage+add;
						*/
			
			URL url = new URL(str);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			StringBuffer sb = new StringBuffer();
			String temp = null;
			  int i=0;
		      while (true) {
		    	 
		         if(i>=2202){
		        	
		            sb.append("</dbs>");
		            break;
		         }
		         temp = br.readLine();
		         if (temp == null) {
		            break;
		         }
		         sb.append(temp);
		         i++;
		         
		      };
			response.setContentType("text/xml;charset=euc-kr");
			
			PrintWriter out = response.getWriter();
			out.print(sb.toString());
			out.close();
		}
	}


