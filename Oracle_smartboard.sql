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

insert into SMARTBOARD values(smartboard_seq.nextval, '�����', 'cic313@daum.net', '����ɼ���', '1234', sysdate, 1, 1, 1, 0, '������ ���ƿ�~');
insert into SMARTBOARD values(smartboard_seq.nextval, 'ȫ�浿', 'hong@daum.net', '���漱��', '1234', sysdate, 2, 1, 1, 0, '���ƿ�~');
insert into SMARTBOARD values(smartboard_seq.nextval, '������', 'park@naver.com', '��ȸ������ȸ', '1234', sysdate, 3, 1, 1, 0, '���ƿ�!!');

select * from SMARTBOARD;
commit