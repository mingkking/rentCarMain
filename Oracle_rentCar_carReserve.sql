create sequence car_seq
    start with 1
    increment by 1
    minvalue 1
    maxvalue 10000
    nocache
    nocycle;
    
create table rentcar(
    no number primary key,
    carname varchar2(30),
    category number,
    price number,
    usepeople number,
    company varchar2(30),
    img varchar2(50),
    info varchar2(200)
);

-- ���� �ڵ��� ������ �Է�
insert into rentcar values(1, '�׷���', 3, 220420, 5, '�����ڵ���', 'hyundaiModel001.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');
insert into rentcar values(2, '�׶�ĭ', 3, 250000, 5, '�����ڵ���', 'hyundaiModel002.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');
insert into rentcar values(3, '����ũ����', 3, 300000, 8, '�����ڵ���', 'hyundaiModel003.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');
insert into rentcar values(4, '�ƽ�ũ����', 3, 270000, 8, '�����ڵ���', 'hyundaiModel004.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');
insert into rentcar values(5, '�Ӹ����̵�', 3, 350000, 8, '�����ڵ���', 'hyundaiModel005.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');

-- ���� �ڵ��� ������ �Է�
insert into rentcar values(6, '���ڶ�', 2, 320420, 5, '�����ڵ���', 'hyundaiModel006.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');
insert into rentcar values(7, '�Ÿ', 2, 270000, 5, '�����ڵ���', 'hyundaiModel007.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');
insert into rentcar values(8, 'EF�Ÿ', 2, 300000, 5, '�����ڵ���', 'hyundaiModel008.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');
insert into rentcar values(9, '�Ÿ3', 2, 270000, 5, '�����ڵ���', 'hyundaiModel009.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');
insert into rentcar values(10, 'LF�Ÿ �� ������ HEV', 2, 400000, 5, '�����ڵ���', 'hyundaiModel010.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');

-- ���� �ڵ��� ������ �Է�
insert into rentcar values(11, '����', 1, 200420, 5, '�����ڵ���', 'hyundaiModel011.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');
insert into rentcar values(12, '����', 1, 220000, 5, '�����ڵ���', 'hyundaiModel012.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');
insert into rentcar values(13, '�� ����Ʈ', 1, 300000, 5, '�����ڵ���', 'hyundaiModel013.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');
insert into rentcar values(14, '������ Ʈ������', 1, 270000, 5, '�����ڵ���', 'hyundaiModel014.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');
insert into rentcar values(15, '�� Ŭ��', 1, 250000, 5, '�����ڵ���', 'hyundaiModel015.png', '������: ����� ���ʱ� �帪�� 12 â����: ���ֿ� ���ΰ�: New Thinking New Possibilities');


-- ���� �ڵ��� ������ �Է�
insert into rentcar values(21, 'S80', 3, 440000, 5, '�����ڵ���', 'volvoModel001.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');
insert into rentcar values(22, 'S90', 3, 730891, 5, '�����ڵ���', 'volvoModel002.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');
insert into rentcar values(23, 'V90', 3, 750491, 5, '�����ڵ���', 'volvoModel003.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');
insert into rentcar values(24, 'C70', 3, 530891, 5, '�����ڵ���', 'volvoModel004.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');
insert into rentcar values(25, 'S902', 3, 930000, 5, '�����ڵ���', 'volvoModel005.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');

-- ���� �ڵ��� ������ �Է�
insert into rentcar values(26, 'XC40', 2, 630891, 5, '�����ڵ���', 'volvoModel006.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');
insert into rentcar values(27, 'XC40 Recharge', 2, 530891, 5, '�����ڵ���', 'volvoModel007.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');
insert into rentcar values(28, 'XC60', 2, 930000, 5, '�����ڵ���', 'volvoModel008.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');
insert into rentcar values(29, 'V70 XC', 2, 530000, 5, '�����ڵ���', 'volvoModel009.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');
insert into rentcar values(30, 'XC70', 2, 930891, 5, '�����ڵ���', 'volvoModel010.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');

-- ���� �ڵ��� ������ �Է�
insert into rentcar values(31, 'C30', 1, 380000, 5, '�����ڵ���', 'volvoModel011.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');
insert into rentcar values(32, 'S40', 1, 340420, 5, '�����ڵ���', 'volvoModel012.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');
insert into rentcar values(33, 'V40', 1, 552000, 5, '�����ڵ���', 'volvoModel013.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');
insert into rentcar values(34, 'V50', 1, 670050, 5, '�����ڵ���', 'volvoModel014.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');
insert into rentcar values(35, 'V40New', 1, 580891, 5, '�����ڵ���', 'volvoModel015.png', '������: ������ ����Ʈ��Ÿ������ ���׺��� â����: �ƻ縣 ���긮����, ����Ÿ�� �󸣼� ���ΰ�: Design around you');


-- ��� �ڵ��� ������ �Է�
insert into rentcar values(41, 'K5', 2, 500000, 5, '����ڵ���', 'kiaModel006.png', '������: ����� ���ʱ� �帪�� 12 â����: ��öȣ ���ΰ�: Movement that inspires');
insert into rentcar values(42, 'K5 HEV', 2, 600420, 5, '����ڵ���', 'kiaModel007.png', '������: ����� ���ʱ� �帪�� 12 â����: ��öȣ ���ΰ�: Movement that inspires');
insert into rentcar values(43, '���þ�', 2, 800000, 5, '����ڵ���', 'kiaModel008.png', '������: ����� ���ʱ� �帪�� 12 â����: ��öȣ ���ΰ�: Movement that inspires');
insert into rentcar values(44, '��ü �̳뺣�̼�', 2, 470050, 5, '����ڵ���', 'kiaModel009.png', '������: ����� ���ʱ� �帪�� 12 â����: ��öȣ ���ΰ�: Movement that inspires');
insert into rentcar values(45, '��Ƽ��', 2, 380891, 5, '����ڵ���', 'kiaModel010.png', '������: ����� ���ʱ� �帪�� 12 â����: ��öȣ ���ΰ�: Movement that inspires');

select * from rentcar;


create sequence carReserve_seq
	start with 1
	increment by 1
	minvalue 1
	maxvalue 10000
	nocache
	nocycle;
	
create table carReserve(
	carRNo number primary key,
	id varChar2(20) not null,
	no number not null,
	img varchar2(50) not null,
	cnt number not null,
	day number not null,
	dday date not null,
	insurance number not null,
	wifi number not null,
	babySeat number not null,
	navi number not null
);
drop table carReserve;
select r.CARNAME, r.PRICE, c.IMG, c.CNT, c.DAY, c.DDAY, c.INSURANCE, c.WIFI, c.BABYSEAT, c.NAVI from rentCar r, CARRESERVE c;
select * from rentCar natural join carreserve where sysdate >= to_date(dday, 'YYYY-MM-DD') and id = 'jumki12';
commit

