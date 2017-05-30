package com.data.frame;

public class Sql {
			public static String insertPrf= 
			   "INSERT INTO prf VALUES (?,?)";
			public static String deletePrf= 
			   "DELETE FROM prf WHERE mt20id=?";
			public static String selectPrf= 
			   "SELECT * FROM prf WHERE mt20id=?";
			public static String selectAllPrf= 
			   "SELECT * FROM prf ORDER BY 1";
			
			///수정작업필요
			public static String insertPrfDS= 
					   "INSERT INTO prf_detail_sub VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			public static String deletePrfDS= 
					   "DELETE FROM prf_detail_sub WHERE mt20id=?";
			public static String selectPrfDS= 
				   "SELECT * FROM prf_detail_sub WHERE mt20id=?";
			public static String selectAllPrfDS= 
					   "SELECT * FROM prf_detail_sub ORDER BY 1";
			
			public static String substring1=
					   "SELECT mt20id FROM prf";
			public static String substring2=
					   "SELECT mt10id FROM fclty";
			
			
			public static String insertPrfDS2= 
					   "INSERT INTO prf_detail_sub2 VALUES (?,?,?)";
			
			
			
			
			
			public static String insertboxweek= 
					   "INSERT INTO boxofficeweek VALUES (?,?,?.?.?.?.?.?.?.?.?)";
			
			
	
			public static String insertPrfD= 
					   "INSERT INTO prf_detail VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					public static String selectPrfD= 
					   "SELECT mt20id,mt10id,prfnm,to_char(prfpdfrom,'YYYY.MM.DD') prfpdfrom,to_char(prfpdto,'YYYY.MM.DD') prfpdto,"
					   + "fcltynm,prfcast,prfcrew,prfruntime,prfage,entrpsnm,pcseguidance,poster,genrenm,prfstate,"
					   + "openrun,styurl,dtguidance,prfdtcnt,totnmrs FROM prf_detail WHERE mt20id=?";
					public static String selectAllPrfD= 
					   "SELECT mt20id,mt10id,prfnm,to_char(prfpdfrom,'YYYY.MM.DD') prfpdfrom,to_char(prfpdto,'YYYY.MM.DD') prfpdto,"
					   + "fcltynm,prfcast,prfcrew,prfruntime,prfage,entrpsnm,pcseguidance,poster,genrenm,prfstate,"
					   + "openrun,styurl,dtguidance,prfdtcnt,totnmrs FROM prf_detail ORDER BY 1";
			
					/////////////////
			public static String total_prf ="insert into prf_detail (mt20id,mt10id,prfnm,prfpdfrom,prfpdto,fcltynm,prfcast,prfcrew,prfruntime,prfage,entrpsnm,pcseguidance,poster,genrenm,prfstate,openrun,styurl,dtguidance,prfdtcnt,totnmrs)select l.mt20id mt20id,l.mt10id mt10id,l.prfnm prfnm,l.prfpdfrom prfpdfrom,l.prfpdto prfpdto,l.fcltynm fcltynm,l.prfcast prfcast,l.prfcrew prfcrew,l.prfruntime prfruntime,l.prfage prfage,l.entrpsnm entrpsnm,l.pcseguidance pcseguidance,l.poster poster,l.genrenm genrenm,l.prfstate prfstate,l.openrun openrun,l.styurl styurl,l.dtguidance dtguidance,s.prfdtcnt prfdtcnt,s.totnmrs totnmrs from prf_detail_sub l, prf_detail_sub2 s where l.mt20id=s.mt20id order by s.totnmrs desc";		
			
			///////////나중에 table에서1뺴야함 ****************
			public static String total_fclty ="insert into fclty_list(mt10id,fcltynm,sidonm,gugunnm,seatscale,telno,relateurl,adres) select s.mt10id mt10id,s.fcltynm fcltynm,s.sidonm sidonm,s.gugunnm gugunnm,t.seatscale seatscale,t.telno telno,t.relateurl relateurl,t.adres adres from fclty s, fclty_sub t where s.mt10id=t.mt10id order by s.mt10id";		
					
					
					
					
					
					
					
					
					
					
					
					public static String insertComL=
					   "INSERT INTO com_list VALUES (?,?,?,?,?)";
					public static String selectComL= 
					   "SELECT * FROM com_list WHERE mt30id=?";
					public static String selectAllComL= 
					   "SELECT * FROM com_list ORDER BY 1";
					
					public static String insertFclty=
							   "INSERT INTO fclty VALUES (?,?,?,?)";
					public static String insertFcltySub=
							   "INSERT INTO fclty_sub VALUES (?,?,?,?,?)";
					
					
					
					public static String insertFcltyL=
					   "INSERT INTO fclty_list VALUES (?,?,?,?,?,?,?,?)";
					public static String selectFcltyL= 
					   "SELECT * FROM fclty_list WHERE mt10id=?";
					public static String selectAllFcltyL= 
					   "SELECT * FROM fclty_list ORDER BY 1";

					public static String insertMem =
					   "INSERT INTO mem_info VALUES (mem_info_seq,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					public static String updateMem= 
					   "UPDATE mem_info SET mempw=?,memname=?,memtel=?,mememail=?,memgen=?,memage=?,memmarry=?,memjob=?,memtype=?,"
					   + "memjang1=?, memjang2=?,memjang3=?, mempa1, mempa2, mempa3, admini=? WHERE memid=?";
					public static String deleteMem= 
					   "DELETE FROM mem_info WHERE memid=?";
					public static String selectMem= 
					   "SELECT * FROM mem_info WHERE memid=?";
					public static String selectAllMem= 
					   "SELECT * FROM mem_info ORDER BY 1";
					
					public static String insertRe =
					   "INSERT INTO re_info VALUES (re_info_seq.nextval,?,?,?,?,?,?,?,?,?)";
					public static String updateRe= 
					   "UPDATE re_info SET memid=?,mt20id=?,mt10id=?,fcltynm=?,seldate=to_Date(?,'YYYY.MM.DD'),"
					   + "seltime=?, people=?, seattype=?, price=? WHERE reno=?";
					public static String deleteRe= 
					   "DELETE FROM re_info WHERE reno=?";
					public static String selectRe= 
					   "SELECT reno,memid,mt20id,mt10id,fcltynm,to_char(seldate,'YYYY.MM.DD') as seldate,"
					   + "seltime,people,seattype,price FROM re_info WHERE reno=?";
					public static String selectAllRe= 
					   "SELECT reno,memid,mt20id,mt10id,fcltynm,to_char(seldate,'YYYY.MM.DD') as seldate,"
					   + "seltime,people,seattype,price FROM re_info ORDER BY 1";
						
					public static String insertCom =
					   "INSERT INTO com_info VALUES (com_info_seq.nextval,?,?,?,?,?)";
					public static String updateCom= 
					   "UPDATE com_info SET compw=?,company=?,entrpsnm=?,comtel=?,genrenm=? WHERE comid=?";
					public static String deleteCom= 
					   "DELETE FROM com_info WHERE comid=?";
					public static String selectCom= 
					   "SELECT * FROM com_info WHERE comid=?";
					public static String selectAllCom= 
					   "SELECT * FROM com_info ORDER BY 1";
			
			
}








