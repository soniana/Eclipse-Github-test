package com.data.fclty_list;

import java.util.ArrayList;


public class Fclty_list_Tread extends Thread {
  public void run() {

	    Fclty_listBiz biz= new Fclty_listBiz();
		ArrayList<Object> list =null;
		
		try {
			list =biz.total();
			for(Object obj:list){ //�������� ���ִ� ���� ����
				
				System.out.println("Join Ok");
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Join Fail");
			e.printStackTrace();
		}
		
				

	}
}
