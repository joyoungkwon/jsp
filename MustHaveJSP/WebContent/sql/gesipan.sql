select * from member;
select * from BOARD;



drop table member;

drop table board;

create table member(
	id varchar2(10) not null,
	pass varchar2(10) not null,
	name varchar2(30) not null,
	regidate date default sysdate not null,
	primary key(id)
);

insert into member(id, pass, name) values('abc','1234','ttt');