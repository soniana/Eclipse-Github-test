package com.data.com_list;
 
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

 
public class Com_list_Tread extends Thread {
  
  String xml;
  ArrayList<Object> data_1 =new ArrayList<>();
  
  public void run() {
   
    StringBuilder sBuffer = new StringBuilder();
   
    
    try {
     
      String urlAddr = "http://www.kopis.or.kr/openApi/restful/mnfct?service=9980fac33e384b6fbb7d7917b9fab551&cpage=1&rows=100000000";
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
        NodeList items = element.getElementsByTagName("mt30id");
        NodeList items1 = element.getElementsByTagName("entrpsnm");
        NodeList items2 = element.getElementsByTagName("genrenm");
        NodeList items3 = element.getElementsByTagName("telno");
        NodeList items4 = element.getElementsByTagName("relateurl");
        
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
                    
          Com_listBiz biz=new Com_listBiz();
          Com_list prf =new Com_list (itemValue,itemValue1,itemValue2,itemValue3,itemValue4);
        
      
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
 
