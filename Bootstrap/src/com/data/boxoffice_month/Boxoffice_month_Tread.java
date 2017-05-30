package com.data.boxoffice_month;
 
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

 
public class Boxoffice_month_Tread extends Thread {
  
  String xml2;
  ArrayList<Object> data_1 =new ArrayList<>();
  
  public void run() {
   
    StringBuilder sBuffer = new StringBuilder();
   
    
    try {
     
      String urlAddr = "http://www.kopis.or.kr/openApi/restful/boxWeekMonthly?service=9980fac33e384b6fbb7d7917b9fab551&ststype=month&catecode=YK";
      URL url = new URL(urlAddr);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      if (conn != null) {      
    	  
        conn.setConnectTimeout(10000);
        conn.setUseCaches(false);
        
        if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
         InputStreamReader isr = new InputStreamReader(conn.getInputStream(),"UTF-8");
         BufferedReader br = new BufferedReader(isr);
         
         while (true) {
            String line = br.readLine();
          
            if (line == null){
                      
            		 break;
            		 
            	 }
            sBuffer.append(line);
         
          }
          br.close();
          conn.disconnect();      
          xml2 = sBuffer.toString();
       
        }
      }
   
    } catch (Exception e) {
      System.out.println(e.getMessage());
 
    }
   
    try {
      if (xml2 != null) {
    	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = factory.newDocumentBuilder();
        
        InputStream is = new ByteArrayInputStream(xml2.getBytes("UTF-8"));
       
        Document doc = documentBuilder.parse(is);
        Element element = doc.getDocumentElement();
        NodeList items = element.getElementsByTagName("area");
        NodeList items1 = element.getElementsByTagName("prfdtcnt");
        NodeList items2 = element.getElementsByTagName("nmrs");
        NodeList items3 = element.getElementsByTagName("prfpd");
		NodeList items4 = element.getElementsByTagName("cate");
		NodeList items5 = element.getElementsByTagName("prfplcnm");
		NodeList items6 = element.getElementsByTagName("prfnm");
		NodeList items7 = element.getElementsByTagName("rnum");
		NodeList items8 = element.getElementsByTagName("seatcnt");
		NodeList items9 = element.getElementsByTagName("poster");
		NodeList items10 = element.getElementsByTagName("mt20id");
        
        
        int n = items.getLength();
      
        for (int i = 0; i < n; i++) {
           
        	
          Node item = items.item(i);
          Node text = item.getFirstChild();
          String itemValue = text.getNodeValue();
         
          Node item1 = items1.item(i);
          Node text1 = item1.getFirstChild();
          String itemValue1 = text1.getNodeValue();
          
          Node item2 = items2.item(i);
          Node text2 = item2.getFirstChild();
          String itemValue2 = text2.getNodeValue();
          
          Node item3 = items3.item(i);
			Node text3 = item3.getFirstChild();
			String itemValue3 = text3.getNodeValue();

			Node item4 = items4.item(i);
			Node text4 = item4.getFirstChild();
			String itemValue4 = text4.getNodeValue();

			Node item5 = items5.item(i);
			Node text5 = item5.getFirstChild();
			String itemValue5 = text5.getNodeValue();

			Node item6 = items6.item(i);
			Node text6 = item6.getFirstChild();
			String itemValue6 = text6.getNodeValue();

			Node item7 = items7.item(i);
			Node text7 = item7.getFirstChild();
			String itemValue7 = text7.getNodeValue();

			Node item8 = items8.item(i);
			Node text8 = item8.getFirstChild();
			String itemValue8 = text8.getNodeValue();

			Node item9 = items9.item(i);
			Node text9 = item9.getFirstChild();
			String itemValue9 = text9.getNodeValue();

			Node item10 = items10.item(i);
			Node text10 = item10.getFirstChild();
			String itemValue10 = text10.getNodeValue();
          
      
        Boxoffice_month prf =new Boxoffice_month (itemValue,itemValue1,itemValue2,itemValue3,itemValue4,itemValue5,itemValue6,itemValue7,itemValue8,itemValue9,itemValue10);
        
      
    /*	try {
			biz.register(prf); 
			Thread.sleep(500);
			System.out.println("Insert OK");
		} catch (Exception e) {
			
			e.printStackTrace();
			System.out.println("Insert Fail");
		} 
 */
        System.out.println(prf);
        }
       
    
        
      }
  
 
    } catch (Exception e) {
    	e.printStackTrace();
      System.out.println(e.getMessage());
 
    }
 
  
  }
}
 
