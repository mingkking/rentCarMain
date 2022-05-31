create table smartBoard(
	num number primary key,
	writer varChar2(30) not null,
	email varChar2(40) not null,
	subject varChar2(40) not null,
	password varChar2(15) not null,
	reg_date date,
	ref number,
	re_step number,
	re_level number,
	readCount number,
	content varChar2(500) not null,
);

insert into SMARTBOARD values(smartboard_seq.nextval, '현대빈', 'cic313@daum.net', '대통령선거', '1234', sysdate, 1, 1, 1, 0, '윤석렬 좋아요~');
insert into SMARTBOARD values(smartboard_seq.nextval, '홍길동', 'hong@daum.net', '지방선거', '1234', sysdate, 2, 1, 1, 0, '좋아요~');
insert into SMARTBOARD values(smartboard_seq.nextval, '박재형', 'park@naver.com', '의회민주주회', '1234', sysdate, 3, 1, 1, 0, '좋아요!!');

select * from SMARTBOARD;
commit