package com.data.prf_detail_sub;

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


public class prf_detail_sub2_Tread extends Thread {
  public void run() {

		
		Prf_detail_sub2_Biz biz = new Prf_detail_sub2_Biz();
		try {
			// 다운로드 받을 변수

			

			
			//list.remove(0);
			
				StringBuilder sBuffer = new StringBuilder();				
				String urlAddr = "http://www.kopis.or.kr/openApi/restful/prfstsPrfBy?service=9980fac33e384b6fbb7d7917b9fab551&cpage=1&rows=10000000000000&stdate=20160101&eddate=20171231";
			    URL url = new URL(urlAddr);
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

							NodeList items = element.getElementsByTagName("mt20id");
							NodeList items1 = element.getElementsByTagName("prfdtcnt");
							NodeList items2 = element.getElementsByTagName("totnmrs");
							

							int n = items.getLength();

							for (int i = 0; i < n; i++) {

								Node item = items.item(i);
								Node text = item.getFirstChild();
								String itemValue = text.getNodeValue();

								Node item1 = items1.item(i);
								Node text1 = item1.getFirstChild();
								String itemValue1 = text1.getNodeValue();
								int itemValue3=Integer.parseInt(itemValue1);

								Node item2 = items2.item(i);
								Node text2 = item2.getFirstChild();
								String itemValue2 = text2.getNodeValue();
								int itemValue4=Integer.parseInt(itemValue2);

								Prf_detail_sub2 prf = new Prf_detail_sub2(itemValue, itemValue3, itemValue4);
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
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());

		}

		

	}
}
