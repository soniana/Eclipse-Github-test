**무조건 순서대로 생성하기

-얘는 만일을 위해 넣어놈--
drop sequence mem_info_seq;
drop table mem_info;
drop sequence com_info_seq;
drop table com_info;
drop sequence re_info_seq;
drop table re_info;
drop table com_list;
drop table prf_detail;
drop table fclty_list;

select * from prf_detail;

1.일반회원 정보
CREATE SEQUENCE mem_info_seq;

create table mem_info(
	memno		number,
	memid		varchar2(500),
	mempw		varchar2(500),
	memname		varchar2(500),
	memtel		varchar2(500),
	mememail	varchar2(500),
	memgen		varchar2(500),
	memage		varchar2(500),
	memmarry	varchar2(500),
	memjob		varchar2(500),
	memtype		varchar2(500),
	memjang1	varchar2(500),
	memjang2	varchar2(500),
	memjang3	varchar2(500),
	mempa1	    varchar2(500),
	mempa2	    varchar2(500),
	mempa3	    varchar2(500),
	admini		varchar2(500),
	constraint mem_info_memid_pk primary key (memid)
);


2. 기획/제작사 목록 정보
create table com_list(
	mt30id		varchar2(500),
	entrpsnm	varchar2(500),	
	genrenm		varchar2(500),
	telno		varchar2(500),
	relateurl	varchar2(500),
	constraint com_list_mt30id_pk primary key (mt30id)
);

3. 사업자 회원 정보
CREATE SEQUENCE com_info_seq;

create table com_info(
	comno		number,
	comid		varchar2(500),
	compw		varchar2(500),
	mt30id		varchar2(500),
	entrpsnm	varchar2(500),
	comtel		varchar2(500),
	genrenm		varchar2(500),
	constraint com_info_comid_pk primary key (comid),
	constraint com_info_comid_fk foreign key (mt30id) references com_list(mt30id)	
);

4. 공연시설 목록 정보
create table fclty_list(
	mt10id  	varchar2(500),
	fcltynm		varchar2(500),
	sidonm		varchar2(500),
	gugunnm		varchar2(500),
	seatscale	number,
	telno		varchar2(500),
	relateurl	varchar2(500),
	adres		varchar2(500),
	constraint fclty_list_mt10id_pk primary key (mt10id)
);
select * from fclty_list;

5. 공연상세 정보
create table prf_detail(
	mt20id  	varchar2(500),
	mt10id  	varchar2(500),
	prfnm  		varchar2(500),
	prfpdfrom  	Date,
	prfpdto		Date,
	fcltynm		varchar2(500),
	prfcast		varchar2(500),
	prfcrew		varchar2(500),
	prfruntime	varchar2(500),
	prfage		varchar2(500),
	entrpsnm	varchar2(500),
	pcseguidance	varchar2(500),
	poster		varchar2(500),
	genrenm		varchar2(500),
	prfstate	varchar2(500),
	openrun		varchar2(500),
	styurl		varchar2(500),
	dtguidance	varchar2(500),
	prfdtcnt	number,
	totnmrs		number,
	constraint prf_detail_mt20id_pk primary key (mt20id),
	constraint prf_detail_mt10id_fk foreign key (mt10id) references fclty_list(mt10id)	
);
drop table prf_detail cascade constraint;
select * from prf_detail;

6. 예매정보
CREATE SEQUENCE re_info_seq;

create table re_info(
	reno		number,
	memid		varchar2(500),
	mt20id		varchar2(500),
	mt10id 		varchar2(500),
	fcltynm		varchar2(500),
	seldate		Date,
	seltime		varchar2(500),
	people		number,
	seattype	varchar2(500),
	price		number,
	constraint re_info_reno_pk primary key (reno),
	constraint re_info_memid_fk foreign key (memid) references mem_info(memid),
	constraint re_info_mt20id_fk foreign key (mt20id) references prf_detail(mt20id),
	constraint re_info_mt10id_fk foreign key (mt10id) references fclty_list(mt10id)
);


7. 공연 목록
create table prf_list(
	mt20id  	varchar2(500)
)


desc mem_info;
desc com_list;
desc com_info;
desc fclty_list;
desc prf_detail;
desc re_info;


select * from mem_info;
select * from com_list;
select * from com_info;
select * from fclty_list;
select * from prf_detail;
select * from re_info;


insert into prf_detail values ('1','1','1',to_Date('20170203','YYYYMMDD'),to_Date('20170205','YYYYMMDD'),'1','1','1','1','1','1','1','1','1','1','1','1','1',1,1);
insert into prf_detail values ('2','2','2',to_Date('20170305','YYYYMMDD'),to_Date('20170309','YYYYMMDD'),'2','2','2','2','2','2','2','2','2','2','2','2','2',2,2);


insert into prf_detail values ('1','1','라이어1',to_Date('20170203','YYYYMMDD'),to_Date('20170205','YYYYMMDD'),'1','1','1','1','1','1','1','1','뮤지컬','1','1','1','1',1,1);
insert into prf_detail values ('2','1','라이어2',to_Date('20170309','YYYYMMDD'),to_Date('20170429','YYYYMMDD'),'1','1','1','1','1','1','1','1','뮤지컬','1','1','1','1',1,1);
insert into prf_detail values ('3','1','3라이어',to_Date('20161212','YYYYMMDD'),to_Date('20161225','YYYYMMDD'),'1','1','1','1','1','1','1','1','뮤지컬','1','1','1','1',1,1);
insert into prf_detail values ('4','1','4라이5',to_Date('20160519','YYYYMMDD'),to_Date('20170201','YYYYMMDD'),'1','1','1','1','1','1','1','1','뮤지컬','1','1','1','1',1,1);
insert into prf_detail values ('5','1','이어6',to_Date('20170101','YYYYMMDD'),to_Date('20170102','YYYYMMDD'),'1','1','1','1','1','1','1','1','뮤지컬','1','1','1','1',1,1);
insert into prf_detail values ('6','1','라7이어',to_Date('20170323','YYYYMMDD'),to_Date('20170402','YYYYMMDD'),'1','1','1','1','1','1','1','1','뮤지컬','1','1','1','1',1,1);

insert into prf_detail values ('7','1','라이어1',to_Date('20170203','YYYYMMDD'),to_Date('20170205','YYYYMMDD'),'1','1','1','1','1','1','1','1','연극','1','1','1','1',1,1);
insert into prf_detail values ('8','1','라이어2',to_Date('20170309','YYYYMMDD'),to_Date('20170429','YYYYMMDD'),'1','1','1','1','1','1','1','1','연극','1','1','1','1',1,1);
insert into prf_detail values ('9','1','3라이어',to_Date('20161212','YYYYMMDD'),to_Date('20161225','YYYYMMDD'),'1','1','1','1','1','1','1','1','연극','1','1','1','1',1,1);
insert into prf_detail values ('10','1','4라이5',to_Date('20160519','YYYYMMDD'),to_Date('20170201','YYYYMMDD'),'1','1','1','1','1','1','1','1','연극','1','1','1','1',1,1);
insert into prf_detail values ('11','1','이어6',to_Date('20170101','YYYYMMDD'),to_Date('20170102','YYYYMMDD'),'1','1','1','1','1','1','1','1','연극','1','1','1','1',1,1);
insert into prf_detail values ('12','1','라7이어',to_Date('20170323','YYYYMMDD'),to_Date('20170402','YYYYMMDD'),'1','1','1','1','1','1','1','1','연극','1','1','1','1',1,1);

insert into prf_detail values ('13','1','라이어1',to_Date('20170203','YYYYMMDD'),to_Date('20170205','YYYYMMDD'),'1','1','1','1','1','1','1','1','클래식/오페라','1','1','1','1',1,1);
insert into prf_detail values ('14','1','라이어2',to_Date('20170309','YYYYMMDD'),to_Date('20170429','YYYYMMDD'),'1','1','1','1','1','1','1','1','클래식/오페라','1','1','1','1',1,1);
insert into prf_detail values ('15','1','3라이어',to_Date('20161212','YYYYMMDD'),to_Date('20161225','YYYYMMDD'),'1','1','1','1','1','1','1','1','무용/발레','1','1','1','1',1,1);
insert into prf_detail values ('16','1','4라이5',to_Date('20160519','YYYYMMDD'),to_Date('20170201','YYYYMMDD'),'1','1','1','1','1','1','1','1','무용/발레','1','1','1','1',1,1);
insert into prf_detail values ('17','1','이어6',to_Date('20170101','YYYYMMDD'),to_Date('20170102','YYYYMMDD'),'1','1','1','1','1','1','1','1','국악/복합','1','1','1','1',1,1);
insert into prf_detail values ('18','1','라7이어',to_Date('20170323','YYYYMMDD'),to_Date('20170402','YYYYMMDD'),'1','1','1','1','1','1','1','1','국악/복합','1','1','1','1',1,1);


insert into re_info values (1,'1','1','1','1',to_Date('20170203','YYYYMMDD'),'1',1,'1',1);
insert into re_info values (2,'2','2','2','2',to_Date('20170124','YYYYMMDD'),'2',2,'2',2);

update re_info set memid='1',mt20id='1',mt10id='1',fcltynm='1',seldate='20170202',seltime='1', people=1, seattype='1', price=1 WHERE reno=1;

insert into mem_info values (1,'admini','123','1','1','1',1,'1','1','1','1','1','1','1','1','1','1','123');
insert into mem_info values (1,'1','1','1','1','1',1,'1','1','1','1','1','1','1','1','1','1','123');
insert into mem_info values (2,'2','2','2','2','2',2,'2','2','2','2','2','2','2','2','2','2','');
insert into mem_info values (6,'6','6','6','6','6',6,'6','6','6','6','6','6','6','6','6','6','');
insert into mem_info values (9,'9','9','9','9','9',9,'9','9','9','9','9','9','9','9','9','9','');

insert into com_info values (2,'2','2','2','2','2','2');


insert into fclty_list values ('1','1','1','1',1,'1','1','1');
insert into fclty_list values ('2','2','2','2',2,'2','2','2');
insert into fclty_list values ('3','3','3','3',3,'3','3','3');
insert into fclty_list values ('4','4','4','4',4,'4','4','4');
insert into fclty_list values ('5','5','5','5',5,'5','5','5');
insert into fclty_list values ('6','6','6','6',6,'6','6','6');


insert into com_list values ('1','1','1','1','1');
insert into com_list values ('2','2','2','2','2');
insert into com_list values ('3','3','3','3','3');
insert into com_list values ('4','4','4','4','4');
insert into com_list values ('5','5','5','5','5');
insert into com_list values ('6','6','6','6','6');


***이건 할 필요 없는거
alter table pa_info drop constraint pa_info_patname_fk;
alter table pa_info add constraint pa_info_patname_fk foreign key (patname) references pat_info(patname);


***select구문으로 join한거 다른 테이블에 insert하기
**문법 : insert into 테이블 명(칼럼명1,칼럼명2,칼럼명3......) select(join)구문 ;

8.공연상세목록 + 공연통계

insert into prf_detail (mt20id,mt10id,prfnm,prfpdfrom,prfpdto,fcltynm,prfcast,prfcrew,prfruntime,prfage,entrpsnm,pcseguidance,poster,genrenm,prfstate,openrun,styurl,dtguidance,prfdtcnt,totnmrs)
select distinct l.mt20id mt20id ,l.mt10id mt10id,l.prfnm prfnm,l.prfpdfrom prfpdfrom,l.prfpdto prfpdto,l.fcltynm fcltynm,l.prfcast prfcast,l.prfcrew prfcrew,l.prfruntime prfruntime,l.prfage prfage,l.entrpsnm entrpsnm,l.pcseguidance pcseguidance,l.poster poster,l.genrenm genrenm,l.prfstate prfstate,l.openrun openrun,l.styurl styurl,l.dtguidance dtguidance,s.prfdtcnt prfdtcnt,s.totnmrs totnmrs
from prf_detail_sub l, prf_detail_sub2 s 
where l.mt20id=s.mt20id
order by s.totnmrs desc;

8. 공연목록만
create table prf(
mt20id  	varchar2(500),
prfnm varchar2(500)
)
select * from prf;

9. 공연상세목록만
create table prf_detail_sub(
	mt20id  	varchar2(500),
	mt10id  	varchar2(500),
	prfnm  		varchar2(500),
	prfpdfrom  	Date,
	prfpdto		Date,
	fcltynm		varchar2(500),
	prfcast		varchar2(500),
	prfcrew		varchar2(500),
	prfruntime	varchar2(500),
	prfage		varchar2(500),
	entrpsnm	varchar2(500),
	pcseguidance	varchar2(500),
	poster		varchar2(500),
	genrenm		varchar2(500),
	prfstate	varchar2(500),
	openrun		varchar2(500),
	styurl		varchar2(500),
	dtguidance	varchar2(500)	
);
select * from prf_detail_sub;



10. 공연 통계 목록만
create table prf_detail_sub2(
mt20id  	varchar2(500),
prfdtcnt number,
totnmrs number
);
select * from prf_detail_sub2;
select table_name,constraint_name,status from user_constraints;
  
11. 시설 정보 목록만  
create table fclty(
mt10id varchar2(500),
fcltynm varchar2(500),
sidonm varchar2(500),
gugunnm varchar2(500)
);

12. 시설 정보 상세 목록만
create table fclty_sub(
mt10id  varchar2(500),
seatscale  varchar2(500),
telno  varchar2(500),
relateurl  varchar2(500),
adres  varchar2(500)
);

13. 검색테이블
create table search_data(
	memid varchar2(500),
	prfnm varchar2(500),
	search_date Date,
	search varchar2(500)	
);
select * from search_data;

14. 로그 테이블
create table logdata(
clickdata number,
mt10id varchar2(500),
mt20id varchar2(500),
genrenm varchar2(500)
);
insert into logdata values ('5022017','PF134335','뮤지컬');
select * from logdata;
drop table logdata;

select * from prf_detail;

select poster, PRFNM
from (select p.PRFNM, p.poster, p.mt20id, count(p.mt20id) 
		from logdata l, prf_detail p
		where p.mt20id=l.mt20id
		group by p.mt20id, p.poster, p.PRFNM
		order by count(p.mt20id) desc)
where rownum<4


select p.PRFNM, p.POSTER, p.MT20ID, count(p.MT20ID) 
		from logdata l, prf_detail p
		where p.MT20ID=l.MT20ID
		group by p.MT20ID, p.POSTER, p.PRFNM
		order by count(p.MT20ID) desc

select p.MT20ID from logdata l, prf_detail p where l.MT20ID=p.MT20ID group by p.MT20ID, p.POSTER, p.PRFNM

select * from logdata where MT20ID = ' PF122341';

select poster, prfnm
from (select distinct p.poster, p.prfnm, p.totnmrs
	  from re_info r, mem_info m,prf_detail p
	  where m.memid = r.memid
	  and p.mt20id = r.mt20id
	  and m.memgen = (select distinct m.memgen
	  				  from re_info r, mem_info m
	  				  where m.memid=r.memid
	  				  and r.memid = '')
	  and substr(m.memage, 1, 1) = (select distinct substr(m.memage, 1, 1)
	  							    from re_info r, mem_info m
	  							    where m.memid = r.memid
	  							    and r.memid = '')
	  order by totnmrs desc)
where rownum < 4;

