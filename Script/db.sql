/*
week
1 : ������, 2 : ȭ����
3 : ������, 4 : �����
5 : �ݿ���, 6 : �����
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

insert into course_tbl values('10001', '���α׷���', 2, '1', 1, 0900, 1100);
insert into course_tbl values('10002', '��ü���� ���α׷���', 2, '2', 1, 0900, 1200);
insert into course_tbl values('10003', '�ڷᱸ��'        , 3, '4', 3, 0900, 1200);
insert into course_tbl values('10004', '�˰���'        , 3, '4', 3, 0900, 1200);

insert into course_tbl values('20001', '�ý��� ���α׷���'  , 2, '5', 1, 1300, 1600);
insert into course_tbl values('20002', '�ü��'        , 3, '5', 2, 1500, 1800);
insert into course_tbl values('20003', '���丶Ÿ�� �����Ϸ�', 3, '5', 3, 1330, 1630);

insert into course_tbl values('30001', '����Ʈ���� ����'   , 2, '3', 4, 1330, 1530);
insert into course_tbl values('30002', '�ý��� �м� �� ����', 3, '3', 5, 0900, 1200);

insert into course_tbl values('40001', '�����ͺ��̽�'     , 3, '2', 5, 1300, 1600);

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
    
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, '�豳��', '����Ʈ�������', '�˰���');
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, '�̱���', '����Ʈ�������', '�ΰ�����');
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, '�ڱ���', '����Ʈ�������', '����Ʈ�������');
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, '�챳��', '����Ʈ�������', '�˰���');
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, '�ֱ���', '������ǻ�Ͱ���', '�Ӻ���� �ý���');
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, '������', '������ǻ�Ͱ���', '��Ƽ�̵��');
insert into lecturer_tbl values(lecturer_tbl_seq.nextval, 'Ȳ����', '����Ͻý��۰���', '��Ʈ��ũ');

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