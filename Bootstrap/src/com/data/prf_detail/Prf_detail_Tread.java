package com.data.prf_detail;

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

public class Prf_detail_Tread extends Thread {
  public void run() {

		
		Prf_detailBiz biz= new Prf_detailBiz();
		ArrayList<Object> list =null;
		
		try {
			list =biz.total();
			for(Object obj:list){ //오른쪽은 들어가있는 놈의 정보
				
				System.out.println("Join Ok");
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Join Fail");
			e.printStackTrace();
		}
		
				

	}
}
