package com.data.fclty_list_sub;

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


public class Fclty_list_Tread_sub extends Thread {
  public void run() {

		
		Fclty_listBiz_sub biz = new Fclty_listBiz_sub();
		try {
			// 다운로드 받을 변수

			ArrayList<String> list = biz.substring(null);

			
			//list.remove(0);
			for (int id=0;id<list.size();id++) {
				StringBuilder sBuffer = new StringBuilder();				
				URL url = null;
				String addr = null; 
				addr = "http://www.kopis.or.kr/openApi/restful/prfplc/";
				String servicekey = "?service=9980fac33e384b6fbb7d7917b9fab551";
				addr = addr + list.get(id) + servicekey;
				
				url = new URL(addr);
						
		
				HttpURLConnection conn = null;
				conn = (HttpURLConnection) url.openConnection();
				if (conn != null) {

					conn.setConnectTimeout(10000);
					conn.setUseCaches(false);

					if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {

						InputStreamReader isr = new InputStreamReader(conn.getInputStream(), "UTF-8");
						BufferedReader br = new BufferedReader(isr);

						while (true) {
							String line = br.readLine();

							if (line == null) {

								break;

							}

							sBuffer.append(line);
						}
						br.close();
						conn.disconnect();
						
						String xml=null;
						xml = sBuffer.toString();
						
						
						if (xml != null) {
						
							DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
							DocumentBuilder documentBuilder = factory.newDocumentBuilder();

							InputStream is = new ByteArrayInputStream(xml.getBytes("UTF-8"));
							Document doc = documentBuilder.parse(is);
							is.close();

							Element element = doc.getDocumentElement();

							NodeList items = element.getElementsByTagName("mt10id");
							NodeList items1 = element.getElementsByTagName("seatscale");
							NodeList items2 = element.getElementsByTagName("telno");
							NodeList items3 = element.getElementsByTagName("relateurl");
							NodeList items4 = element.getElementsByTagName("adres");
							
							
							

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

								
								Fclty_list_sub prf = new Fclty_list_sub(itemValue, itemValue1, itemValue2, itemValue3,itemValue4);
								//System.out.println(prf);

								//// for문
								/*
								 * try { biz.register(prf); //입력할 때 정상적으로 입력이 안될수도 있으니 조심하라고
								 * error메세지 띄움 Thread.sleep(500);
								 * System.out.println("Insert OK"); } catch (Exception e) {
								 * 
								 * e.printStackTrace(); System.out.println("Insert Fail"); }
								 */
								
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
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());

		}

		

	}
}
