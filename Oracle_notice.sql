create table notice(
	noticeNum number primary key,
	noticeSubject varChar2(50) not null,
	noticeWrite varChar2(20) not null,
	noticeContent varChar2(1000) not null,
	noticeReg_date date not null
);