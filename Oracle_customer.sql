create sequence customer_seq
	start with 1
	increment by 1
	minvalue 1
	maxvalue 10000
	nocache
	nocycle;

create table customer(
	num number not null,
	id varChar2(20) primary key,
	password1 varChar2(20) not null,
	password2 varChar2(20) not null,
	email varChar2(30) not null,
	tel varChar2(20) not null,
	hobby varChar2(40), 
	job varChar2(20),
	age number(3),
	info varChar2(500)
);
drop table customer;

select * from tab;

alter table customer modify(hobby varChar2(40));
alter table customer rename column mail to email;
commit