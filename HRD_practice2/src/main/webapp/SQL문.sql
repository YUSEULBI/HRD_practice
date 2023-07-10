create table TBL_VOTE_202005(
	V_JUMIN CHAR(13) NOT NULL ,
	V_NAME VARCHAR2(20) ,
	M_NO CHAR(1) ,
	V_TIME CHAR(4) ,
	V_AREA CHAR(20) ,
	V_CONFIRM CHAR(1) ,
 	primary key ( V_JUMIN )
);

CREATE TABLE TBL_MEMBER_202005(
	M_NO CHAR(1) NOT NULL ,
	M_NAME VARCHAR2(20) ,
	P_CODE CHAR(2) ,
	P_SCHOOL CHAR(1) ,
	M_JUMIN CHAR(13) ,
	M_CITY VARCHAR2(20),
	primary key(M_NO)
);

CREATE TABLE TBL_PARTY_202005(
	P_CODE CHAR(2) NOT NULL,
	P_NAME VARCHAR2(20),
	P_INDATE DATE,
	P_READER VARCHAR2(20),
	P_TEL1 CHAR(3) ,
	P_TEL2 CHAR(4) ,
	P_TEL3 CHAR(4) ,
	primary key(P_CODE)
);

insert into tbl_member_202005 values ('1', '김후보', 'P1', '1', '6603011999991', '수선화동');
insert into tbl_member_202005 values ('2', '이후보', 'P2', '3', '5503011999992', '민들래동');
insert into tbl_member_202005 values ('3', '박후보', 'P3', '2', '7703011999993', '나팔꽃동');
insert into tbl_member_202005 values ('4', '조후보', 'P4', '2', '8803011999994', '진달래동');
insert into tbl_member_202005 values ('5', '최후보', 'P5', '3', '9903011999995', '개나리동');

insert into tbl_party_202005 values ('P1', 'A정당', '2010-01-01', '위대표', '02', '1111', '0001');
insert into tbl_party_202005 values ('P2', 'B정당', '2010-02-01', '명대표', '02', '1111', '0002');
insert into tbl_party_202005 values ('P3', 'C정당', '2010-03-01', '기대표', '02', '1111', '0003');
insert into tbl_party_202005 values ('P4', 'D정당', '2010-04-01', '옥대표', '02', '1111', '0004');
insert into tbl_party_202005 values ('P5', 'E정당', '2010-05-01', '임대표', '02', '1111', '0005');

insert into tbl_vote_202005 values ('99010110001', '김유권', '1', '0930', '제1투표장', 'N');
insert into tbl_vote_202005 values ('89010120002', '이유권', '2', '0930', '제1투표장', 'N');
insert into tbl_vote_202005 values ('69010110003', '박유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('59010120004', '홍유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010110005', '조유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('89010120006', '최유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('59010110007', '지유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('49010120008', '장유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010110009', '정유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('89010120010', '강유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('99010110011', '신유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010120012', '오유권', '1', '1330', '제1투표장', 'Y');

insert into tbl_vote_202005 values ('69010110013', '현유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('89010110014', '왕유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110015', '유유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110016', '한유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('89010110017', '문유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110018', '양유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110019', '구유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110020', '황유권', '5', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('69010110021', '배유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110022', '전유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110023', '고유권', '1', '1330', '제2투표장', 'Y');  
insert into tbl_vote_202005 values ('59010110024', '권유권', '3', '1330', '제2투표장', 'Y');


select m.M_NO , m.M_NAME , m.P_CODE , m.P_SCHOOL , m.M_JUMIN , m.M_CITY , p.P_TEL1 , p.P_TEL2 , p.P_TEL3 
from tbl_member_202005 m , tbl_party_202005 p where m.P_CODE = p.P_CODE;

select m.M_NO , m.M_NAME , p.P_NAME , 
	case
		when m.P_SCHOOL = 1 then '고졸' 
		when m.P_SCHOOL = 2 then '학사' 
		when m.P_SCHOOL = 3 then '석사' 
		else '박사' 
	end as school  , 
	m.M_JUMIN , m.M_CITY , p.P_TEL1 , p.P_TEL2 , p.P_TEL3 
from tbl_member_202005 m , tbl_party_202005 p where m.P_CODE = p.P_CODE;


select V_NAME , V_JUMIN , M_NO , V_TIME , V_CONFIRM 
from TBL_VOTE_202005 where V_AREA = '제1투표장';


select m.M_NO , m.M_NAME , count(*) as countnum
from TBL_MEMBER_202005 m , TBL_VOTE_202005 v
where m.M_NO = v.M_NO and v.V_CONFIRM = 'Y' group by m.M_NO , m.M_NAME order by countnum desc