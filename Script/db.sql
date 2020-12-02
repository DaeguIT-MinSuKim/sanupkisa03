/*
week
1 : 월요일, 2 : 화요일
3 : 수요일, 4 : 목요일
5 : 금요일, 6 : 토요일
*/
drop table course_tbl;
drop table lecturer_tbl;
drop sequence lecturer_tbl_seq;
drop view vw_course;

create table course_tbl(
	id			varchar2(5) not null primary key,
	name 		varchar2(40),
	credit		number(6),
	lecturer	varchar2(10),
	week		number(2),
	start_hour	number(4),
	end_hour	number(4)
);

insert into course_tbl values('10001', '프로그래밍', 2, '1', 1, 0900, 1100);
insert into course_tbl values('10002', '객체지향 프로그래밍', 2, '2', 1, 0900, 1200);
insert into course_tbl values('10003', '자료구조'        , 3, '4', 3, 0900, 1200);
insert into course_tbl values('10004', '알고리즘'        , 3, '4', 3, 0900, 1200);

insert into course_tbl values('20001', '시스템 프로그래밍'  , 2, '5', 1, 1300, 1600);
insert into course_tbl values('20002', '운영체제'        , 3, '5', 2, 1500, 1800);
insert into course_tbl values('20003', '오토마타와 컴파일러', 3, '5', 3, 1330, 1630);

insert into course_tbl values('30001', '소프트웨어 공학'   , 2, '3', 4, 1330, 1530);
insert into course_tbl values('30002', '시스템 분석 및 설계', 3, '3', 5, 0900, 1200);

insert into course_tbl values('40001', '데이터베이스'     , 3, '2', 5, 1300, 1600);

create table lecturer_tbl(
	idx	number(6) not null primary key,
	name varchar2(10),
	major varchar2(40),
	field varchar2(30)
);

create sequence lecturer_tbl_seq
    start with 1
    increment by 1
    minvalue 1;
    
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, '김교수', '소프트웨어공학', '알고리즘');
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, '이교수', '소프트웨어공학', '인공지능');
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, '박교수', '소프트웨어공학', '소프트웨어공학');
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, '우교수', '소프트웨어공학', '알고리즘');
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, '최교수', '응용컴퓨터공학', '임베디드 시스템');
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, '강교수', '응용컴퓨터공학', '멀티미디어');
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, '황교수', '모바일시스템공학', '네트워크');

create view vw_course (id, cname, credit, idx, tname, week, start_hour, end_hour) as 
select id, c.name as cname, credit, idx, t.name as tname, week, start_hour, end_hour 
  from course_tbl c join lecturer_tbl t on c.lecturer = t.idx;
  
  
-- sql
select idx, name from lecturer_tbl;

select id, name, credit, lecturer, week, start_hour, end_hour 
  from course_tbl where id = '10001';
-- 
select count(*) from course_tbl;


  
select id, cname, credit, idx, tname, week, start_hour, end_hour from vw_course;