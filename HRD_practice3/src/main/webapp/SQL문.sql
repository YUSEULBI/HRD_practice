create table student_tbl_03( 
   sno varchar2(6) not null, 
   sname varchar2(10) ,
   sphone varchar2(15) , 
   sgender varchar2(4) , 
   saddress varchar2(40) , 
   primary key(sno) 
);

insert into student_tbl_03 values( '10101' , '김행복' , '010-1111-2222','M','서울 동대문구 휘경1동');
insert into student_tbl_03 values( '10102' , '이축복' , '010-1111-3333','F','서울 동대문구 휘경2동');
insert into student_tbl_03 values( '10103' , '장믿음' , '010-1111-4444','M','울릉군 울릉읍 독도 1리');
insert into student_tbl_03 values( '10104' , '최사랑' , '010-1111-5555','F','울릉군 울릉읍 독도 2리');
insert into student_tbl_03 values( '10105' , '진평화' , '010-1111-6666','M','제주도 제주시 외나무골');
insert into student_tbl_03 values( '10106' , '차공단' , '010-1111-7777','M','제주도 제주시 감나무골');

create table exam_tbl_03(
	sno varchar2(6) not null ,
	ekor number(4),
	emath number(4),
	eeng number(4),
	ehist number(4),
	primary key( sno )
);

insert into exam_tbl_03 values( '10101' , 98 , 91 , 95 , 90 );
insert into exam_tbl_03 values( '10102' , 87 , 89 , 92 , 82 );


   sno varchar2(6) not null, 
   sname varchar2(10) ,
   sphone varchar2(15) , 
   sgender varchar2(4) , 
   saddress varchar2(40) , 

// 학생목록
select sno , sname , 
	case 
		when sgender = 'M' then '남'
		when sgender = 'F' then '여'
	end as g ,  
	sphone , saddress 
	from student_tbl_03;

// 학생성적
select 
	substr(s.sno,1,1) 학년 , 
	substr(s.sno,2,2) 반 , 
	substr(s.sno,4,2) 번호 , 
	s.sname, e.ekor, e.emath, e.eeng, e.ehist ,
	(e.ekor + e.emath + e.eeng + e.ehist) 합계 ,
	(e.ekor + e.emath + e.eeng + e.ehist)/4 평균 ,
	RANK() OVER ( ORDER BY (NVL(e.ekor,0) + NVL(e.emath,0) + NVL(e.eeng,0) + NVL(e.ehist,0) ) DESC ) 순위
from student_tbl_03 s full outer join exam_tbl_03 e on s.sno = e.sno
ORDER BY (NVL(e.ekor,0) + NVL(e.emath,0) + NVL(e.eeng,0) + NVL(e.ehist,0) ) DESC;

rank
RANK() OVER ( ORDER BY 필드명 DESC ) : 높은순으로 1등
RANK() OVER ( ORDER BY 필드명 ASC ) : 낮은순으로 1등

