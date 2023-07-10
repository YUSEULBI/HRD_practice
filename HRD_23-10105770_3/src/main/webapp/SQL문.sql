create table student_tbl_03(
	sno varchar2(6) not null ,
	sname varchar2(10) ,
	sphone varchar2(15) ,
	sgender varchar2(4) ,
	saddress varchar2(40) ,
	primary key ( sno )
);


insert into student_tbl_03 values ( '10101' , '김행복' , '010-1111-2222' , 'M' , '서울 동대문구 휘경1동' );
insert into student_tbl_03 values ( '10102' , '이축복' , '010-1111-3333' , 'F' , '서울 동대문구 휘경2동' );
insert into student_tbl_03 values ( '10103' , '장믿음' , '010-1111-4444' , 'M' , '울릉군 울릉읍 독도1리' );
insert into student_tbl_03 values ( '10104' , '최사랑' , '010-1111-5555' , 'F' , '울릉군 울릉읍 독도2리' );
insert into student_tbl_03 values ( '10105' , '진평화' , '010-1111-6666' , 'M' , '제주도 제주시 외나무골' );
insert into student_tbl_03 values ( '10106' , '차공단' , '010-1111-7777' , 'M' , '제주도 제주시 감나무골' );

create table exam_tbl_03(
	sno varchar2(6) not null ,
	ekor number(4) ,
	emath number(4) ,
	eeng number(4) ,
	ehist number(4) ,
	primary key ( sno )
);

insert into exam_tbl_03 values ( '10101' , 98 , 91 , 95 , 90 );
insert into exam_tbl_03 values ( '10102' , 87 , 89 , 92 , 82 );

// 학생조회
select 
	sno , sname ,
	substr( sno , 1 , 1 ) ,
	substr( sno , 2 , 2 ) ,
	substr( sno , 4 , 2 ) ,
	case when sgender = 'M' then '남' when sgender = 'F' then '여' end as gender ,
	sphone , saddress
	from student_tbl_03;


//학생성적
select 
	substr( s.sno , 1 , 1 ) ,
	substr( s.sno , 2 , 2 ) ,
	substr( s.sno , 4 , 2 ) ,
	s.sname , 
	case when e.ekor is null then 0 else e.ekor end as kor,
	case when e.emath is null then 0 else e.emath end as math,
	case when e.eeng is null then 0 else e.eeng end as eeng,
	case when e.ehist is null then 0 else e.ehist end as hist ,
	case when e.ehist is null then 0 else ( e.ekor + e.emath + e.eeng + e.ehist ) end as sum , 
	case when e.ehist is null then 0 else ( e.ekor + e.emath + e.eeng + e.ehist )/4 end as avg  
	from student_tbl_03 s full outer join exam_tbl_03 e on s.sno = e.sno
	order by ( e.ekor + e.emath + e.eeng + e.ehist ) desc;

select 
	substr( s.sno , 1 , 1 ) as grade ,
	substr( s.sno , 2 , 2 ) as class ,
	substr( s.sno , 4 , 2 ) as num ,
	s.sname , e.ekor , e.emath , e.eeng , e.ehist ,
	( e.ekor + e.emath + e.eeng + e.ehist ) as sum ,
	( e.ekor + e.emath + e.eeng + e.ehist )/4 as avg ,
	rank() over ( order by ( nvl(e.ekor,0) + nvl(e.emath,0) + nvl(e.eeng,0) + nvl(e.ehist,0) ) desc ) as rank 
	from student_tbl_03 s full outer join exam_tbl_03 e 
	on s.sno = e.sno
	order by ( nvl(e.ekor,0) + nvl(e.emath,0) + nvl(e.eeng,0) + nvl(e.ehist,0) ) desc ;