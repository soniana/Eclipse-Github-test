package com.frame;

public class Sql {
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
	public static String searchPrfD= 
	   "SELECT mt20id,mt10id,prfnm,to_char(prfpdfrom,'YYYY.MM.DD') prfpdfrom,to_char(prfpdto,'YYYY.MM.DD') prfpdto,"
	   + "fcltynm,prfcast,prfcrew,prfruntime,prfage,entrpsnm,pcseguidance,poster,genrenm,prfstate,"
	   + "openrun,styurl,dtguidance,prfdtcnt,totnmrs FROM prf_detail where prfnm like ? ORDER BY 1";
	public static String typesearchPrfD= 
	   "SELECT mt20id,mt10id,prfnm,to_char(prfpdfrom,'YYYY.MM.DD') prfpdfrom,to_char(prfpdto,'YYYY.MM.DD') prfpdto,"
	   + "fcltynm,prfcast,prfcrew,prfruntime,prfage,entrpsnm,pcseguidance,poster,genrenm,prfstate,"
	   + "openrun,styurl,dtguidance,prfdtcnt,totnmrs FROM prf_detail where genrenm=? ORDER BY 1";
	
	public static String insertComL=
	   "INSERT INTO com_list VALUES (?,?,?,?,?)";
	public static String selectComL= 
	   "SELECT * FROM com_list WHERE mt30id=?";
	public static String selectAllComL= 
	   "SELECT * FROM com_list ORDER BY 1";
	public static String searchComL= 
	   "SELECT * FROM com_list where entrpsnm like ? ORDER BY 1";
	
	public static String insertFcltyL=
	   "INSERT INTO fclty_list VALUES (?,?,?,?,?,?,?,?)";
	public static String selectFcltyL= 
	   "SELECT * FROM fclty_list WHERE mt10id=?";
	public static String selectAllFcltyL= 
	   "SELECT * FROM fclty_list ORDER BY 1";

	public static String insertMem =
	   "INSERT INTO mem_info VALUES (mem_info_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'')";
	public static String updateMem= 
	   "UPDATE mem_info SET mempw=?,memname=?,memtel=?,mememail=?,memgen=?,memage=?,memmarry=?,memjob=?,memtype=?,"
	   + "memjang1=?, memjang2=?,memjang3=?, mempa1=?, mempa2=?, mempa3=?, admini=? WHERE memid=?";
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
//	   "SELECT reno,memid,mt20id,mt10id,fcltynm,to_char(seldate,'YYYY.MM.DD') as sdate,"
//	   + "seltime,people,seattype,price FROM re_info ORDER BY 1";
		"SELECT p.prfnm,r.reno,r.memid,r.mt20id,r.mt10id,r.fcltynm,to_char(r.seldate,'YYYY.MM.DD') as sdate,"
	   + "r.seltime,r.people,r.seattype,r.price FROM re_info r, prf_detail p where r.mt20id=p.mt20id ORDER BY 1";
	public static String searchRe= 
	   "SELECT p.prfnm,r.reno,r.memid,r.mt20id,r.mt10id,r.fcltynm,to_char(r.seldate,'YYYY.MM.DD') as sdate,"
	   + "r.seltime,r.people,r.seattype,r.price FROM re_info r, prf_detail p where r.mt20id=p.mt20id and memid=? ORDER BY 1";
	public static String typesearchRe= 
	   "SELECT r.reno, r.memid, r.mt20id, r.mt10id, r.fcltynm, to_char(r.seldate,'YYYY.MM.DD') as seldate, r.seltime,"
	   +"r.people, r.seattype, r.price, m.memname, m.memtel from re_info r, mem_info m where r.memid=m.memid and r.mt20id=?";
		
	public static String insertCom =
	   "INSERT INTO com_info VALUES (com_info_seq.nextval,?,?,?,?,?,?)";
	public static String updateCom= 
	   "UPDATE com_info SET compw=?,mt30id=?,entrpsnm=?,comtel=?,genrenm=? WHERE comid=?";
	public static String deleteCom= 
	   "DELETE FROM com_info WHERE comid=?";
	public static String selectCom= 
	   "SELECT * FROM com_info WHERE comid=?";
	public static String selectAllCom= 
	   "SELECT * FROM com_info ORDER BY 1";
	public static String searchCom= 
	   "SELECT * FROM prf_detail p, com_list c WHERE p.entrpsnm=c.entrpsnm and c.entrpsnm=? ORDER BY 1";
	
	public static String searchKeyword=
	   "select search, count(*) from search_data group by search order by 2 desc";
//	 to_char(search_date,'YYYYMMDD')=to_Char(sysdate,'YYYYMMDD')
	public static String searchprf=
	   "select * from prf_detail where PRFNM LIKE ? or FCLTYNM LIKE ? or PRFCAST LIKE ? or PRFCREW LIKE ? or ENTRPSNM LIKE ? or GENRENM LIKE ?";
	public static String insertKeyword=
	   "insert into search_data(memid,search_date,search) values(?,to_Char(sysdate,'YYYYMMDD'),?)";
}