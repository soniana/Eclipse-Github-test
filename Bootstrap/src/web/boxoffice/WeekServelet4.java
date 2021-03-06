package web.boxoffice;

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

/**
 * Servlet implementation class RankServelet
 */
@WebServlet({ "/WeekServelet4", "/week4" })
public class WeekServelet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str="http://www.kopis.or.kr/openApi/restful/boxWeekMonthly?service=9980fac33e384b6fbb7d7917b9fab551&ststype=week&catecode=MMB";
		URL url = new URL(str);
		BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
		StringBuffer sb = new StringBuffer();
		String temp = null;
		int i=0;
		while (true) {
			if(i>=132){
				sb.append("</boxofs>");
				break;
			}
			temp = br.readLine();
			if (temp == null) {
				break;
			}
			sb.append(temp);
			i++;
			
		}
		response.setContentType("text/xml;charset=euc-kr");
		
		PrintWriter out = response.getWriter();
		out.print(sb.toString());
		out.close();
	}

}
