package com.data.prf;
 
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

 
public class First_input_Tread extends Thread {
  
  String xml;
  ArrayList<Object> data_1 =new ArrayList<>();
  
  public void run() {
   
    StringBuilder sBuffer = new StringBuilder();
   
    
    try {
     
      String urlAddr = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=9980fac33e384b6fbb7d7917b9fab551&stdate=20160101&eddate=20171231&cpage=1&rows=10000000000000";
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
          xml = sBuffer.toString();
       
        }
      }
   
    } catch (Exception e) {
      System.out.println(e.getMessage());
 
    }
   
    try {
      if (xml != null) {
    	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = factory.newDocumentBuilder();
        
        InputStream is = new ByteArrayInputStream(xml.getBytes("UTF-8"));
       
        Document doc = documentBuilder.parse(is);
        Element element = doc.getDocumentElement();
        NodeList items = element.getElementsByTagName("mt20id");
        NodeList items1 = element.getElementsByTagName("prfnm");
       // NodeList items2 = element.getElementsByTagName("genrenm");
        
        int n = items.getLength();
      
        for (int i = 0; i < n; i++) {
           
        	
          Node item = items.item(i);
          Node text = item.getFirstChild();
          String itemValue = text.getNodeValue();
         
          Node item1 = items1.item(i);
          Node text1 = item1.getFirstChild();
          String itemValue1 = text1.getNodeValue();
          
        /*  Node item2 = items2.item(i);
          Node text2 = item2.getFirstChild();
          String itemValue2 = text2.getNodeValue();*/
                    
        Prf_Biz biz=new Prf_Biz();
       // Prf prf =new Prf (itemValue,itemValue1,itemValue2);
        Prf prf =new Prf (itemValue,itemValue1);
      
    	try {
			biz.register(prf); 
			Thread.sleep(500);
			System.out.println("Insert OK");
		} catch (Exception e) {
			
			e.printStackTrace();
			System.out.println("Insert Fail");
		} 
 
        }
       
        
        
      }
  
 
    } catch (Exception e) {
      System.out.println(e.getMessage());
 
    }
 
  
  }
}
 
