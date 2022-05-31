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

-- 현대 자동차 대형모델 입력
insert into rentcar values(1, '그랜저', 3, 220420, 5, '현대자동차', 'hyundaiModel001.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');
insert into rentcar values(2, '테라칸', 3, 250000, 5, '현대자동차', 'hyundaiModel002.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');
insert into rentcar values(3, '베라크루즈', 3, 300000, 8, '현대자동차', 'hyundaiModel003.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');
insert into rentcar values(4, '맥스크루즈', 3, 270000, 8, '현대자동차', 'hyundaiModel004.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');
insert into rentcar values(5, '팰리세이드', 3, 350000, 8, '현대자동차', 'hyundaiModel005.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');

-- 현대 자동차 중형모델 입력
insert into rentcar values(6, '스텔라', 2, 320420, 5, '현대자동차', 'hyundaiModel006.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');
insert into rentcar values(7, '쏘나타', 2, 270000, 5, '현대자동차', 'hyundaiModel007.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');
insert into rentcar values(8, 'EF쏘나타', 2, 300000, 5, '현대자동차', 'hyundaiModel008.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');
insert into rentcar values(9, '쏘나타3', 2, 270000, 5, '현대자동차', 'hyundaiModel009.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');
insert into rentcar values(10, 'LF쏘나타 뉴 라이즈 HEV', 2, 400000, 5, '현대자동차', 'hyundaiModel010.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');

-- 현대 자동차 소형모델 입력
insert into rentcar values(11, '포니', 1, 200420, 5, '현대자동차', 'hyundaiModel011.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');
insert into rentcar values(12, '엑셀', 1, 220000, 5, '현대자동차', 'hyundaiModel012.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');
insert into rentcar values(13, '뉴 엑센트', 1, 300000, 5, '현대자동차', 'hyundaiModel013.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');
insert into rentcar values(14, '베르나 트랜스폼', 1, 270000, 5, '현대자동차', 'hyundaiModel014.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');
insert into rentcar values(15, '뉴 클릭', 1, 250000, 5, '현대자동차', 'hyundaiModel015.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 정주영 슬로건: New Thinking New Possibilities');


-- 볼보 자동차 대형모델 입력
insert into rentcar values(21, 'S80', 3, 440000, 5, '볼보자동차', 'volvoModel001.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');
insert into rentcar values(22, 'S90', 3, 730891, 5, '볼보자동차', 'volvoModel002.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');
insert into rentcar values(23, 'V90', 3, 750491, 5, '볼보자동차', 'volvoModel003.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');
insert into rentcar values(24, 'C70', 3, 530891, 5, '볼보자동차', 'volvoModel004.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');
insert into rentcar values(25, 'S902', 3, 930000, 5, '볼보자동차', 'volvoModel005.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');

-- 볼보 자동차 중형모델 입력
insert into rentcar values(26, 'XC40', 2, 630891, 5, '볼보자동차', 'volvoModel006.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');
insert into rentcar values(27, 'XC40 Recharge', 2, 530891, 5, '볼보자동차', 'volvoModel007.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');
insert into rentcar values(28, 'XC60', 2, 930000, 5, '볼보자동차', 'volvoModel008.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');
insert into rentcar values(29, 'V70 XC', 2, 530000, 5, '볼보자동차', 'volvoModel009.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');
insert into rentcar values(30, 'XC70', 2, 930891, 5, '볼보자동차', 'volvoModel010.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');

-- 볼보 자동차 소형모델 입력
insert into rentcar values(31, 'C30', 1, 380000, 5, '볼보자동차', 'volvoModel011.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');
insert into rentcar values(32, 'S40', 1, 340420, 5, '볼보자동차', 'volvoModel012.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');
insert into rentcar values(33, 'V40', 1, 552000, 5, '볼보자동차', 'volvoModel013.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');
insert into rentcar values(34, 'V50', 1, 670050, 5, '볼보자동차', 'volvoModel014.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');
insert into rentcar values(35, 'V40New', 1, 580891, 5, '볼보자동차', 'volvoModel015.png', '소재지: 스웨덴 베스트라여타란드주 예테보리 창립자: 아사르 가브리엘손, 구스타프 라르손 슬로건: Design around you');


-- 기아 자동차 중형모델 입력
insert into rentcar values(41, 'K5', 2, 500000, 5, '기아자동차', 'kiaModel006.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 김철호 슬로건: Movement that inspires');
insert into rentcar values(42, 'K5 HEV', 2, 600420, 5, '기아자동차', 'kiaModel007.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 김철호 슬로건: Movement that inspires');
insert into rentcar values(43, '스팅어', 2, 800000, 5, '기아자동차', 'kiaModel008.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 김철호 슬로건: Movement that inspires');
insert into rentcar values(44, '로체 이노베이션', 2, 470050, 5, '기아자동차', 'kiaModel009.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 김철호 슬로건: Movement that inspires');
insert into rentcar values(45, '옵티마', 2, 380891, 5, '기아자동차', 'kiaModel010.png', '소재지: 서울시 서초구 헌릉로 12 창립자: 김철호 슬로건: Movement that inspires');

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

