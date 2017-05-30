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

import com.data.prf_detail_sub.Prf_detail_sub1;
import com.data.prf_detail_sub.Prf_detail_sub1_Biz;

public class prf_detail_sub1_Tread extends Thread {
  public void run() {

		
		Prf_detail_sub1_Biz biz = new Prf_detail_sub1_Biz();
		try {
			// 다운로드 받을 변수

			ArrayList<String> list = biz.substring(null);

			
			//list.remove(0);
			for (int id=0;id<list.size();id++) {
				StringBuilder sBuffer = new StringBuilder();				
				URL url = null;
				String addr = null; 
				addr = "http://www.kopis.or.kr/openApi/restful/pblprfr/";
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

							NodeList items = element.getElementsByTagName("mt20id");
							NodeList items1 = element.getElementsByTagName("mt10id");
							NodeList items2 = element.getElementsByTagName("prfnm");
							NodeList items3 = element.getElementsByTagName("prfpdfrom");
							NodeList items4 = element.getElementsByTagName("prfpdto");
							NodeList items5 = element.getElementsByTagName("fcltynm");
							NodeList items6 = element.getElementsByTagName("prfcast");
							NodeList items7 = element.getElementsByTagName("prfcrew");
							NodeList items8 = element.getElementsByTagName("prfruntime");
							NodeList items9 = element.getElementsByTagName("prfage");
							NodeList items10 = element.getElementsByTagName("entrpsnm");
							NodeList items11 = element.getElementsByTagName("pcseguidance");
							NodeList items12 = element.getElementsByTagName("poster");
							NodeList items13 = element.getElementsByTagName("genrenm");
							NodeList items14 = element.getElementsByTagName("prfstate");
							NodeList items15 = element.getElementsByTagName("openrun");
							//NodeList items16 = element.getElementsByTagName("sty");
							NodeList items17 = element.getElementsByTagName("dtguidance");

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

								Node item11 = items11.item(i);
								Node text11 = item11.getFirstChild();
								String itemValue11 = text11.getNodeValue();

								Node item12 = items12.item(i);
								Node text12 = item12.getFirstChild();
								String itemValue12 = text12.getNodeValue();

								Node item13 = items13.item(i);
								Node text13 = item13.getFirstChild();
								String itemValue13 = text13.getNodeValue();

								Node item14 = items14.item(i);
								Node text14 = item14.getFirstChild();
								String itemValue14 = text14.getNodeValue();

								Node item15 = items15.item(i);
								Node text15 = item15.getFirstChild();
								String itemValue15 = text15.getNodeValue();

								/*Node item16 = items16.item(i);
								Node text16 = item16.getFirstChild();
								String itemValue16 = text16.getNodeValue();*/
								

								Node item17 = items17.item(i);
								Node text17 = item17.getFirstChild();
								String itemValue17 = text17.getNodeValue();

								
								Prf_detail_sub1 prf = new Prf_detail_sub1(itemValue, itemValue1, itemValue2, itemValue3, itemValue4,
										itemValue5, itemValue6, itemValue7, itemValue8, itemValue9, itemValue10, itemValue11,
										itemValue12, itemValue13, itemValue14, itemValue15, itemValue17);
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
