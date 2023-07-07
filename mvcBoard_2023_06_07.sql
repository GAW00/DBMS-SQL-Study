select count(*) from mvc_board;


select bid, bname, btitle, bcontent, bdate, bhit
from(
    select rownum rn, bid, bname, btitle, bcontent, bdate, bhit
    from mvc_board
    where ROWNUM <= (2 * 10)
)
where rn > (2 - 1) * 10;
--order by ROWNUM;

select rownum rn, bid, bname, btitle, bcontent, bdate, bhit
    from mvc_board;


delete from mvc_board;

drop table mvc_board;
drop sequence mvc_board_seq;

CREATE SEQUENCE  MVC_BOARD_SEQ  
MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 NOCYCLE ;

insert into mvc_board values(1, 'a', 'aa', 'aaa', sysdate, 0);
insert into mvc_board values(4, 'd', 'dd', 'ddd', sysdate, 0);

select bid, bname, btitle, bcontent, bdate, bhit from mvc_board;
select * from mvc_board;

create table mvc_board(
    bid number(4) primary key,
    bname varchar2(20),
    btitle varchar2(100),
    bcontent varchar2(300),
    bdate date default sysdate,
    bhit number(4) default 0
);

commit;


--------------------------------------------------------------------

delete from item;

select * from item;

insert into item values('a', 1000, 'aa');
insert into item values('b', 2000, 'bb');

select name, price, description from item;

create table item(
    name varchar2(20),
    price number(8),
    description varchar2(100)
);


commit;

------------------------------------------------------------------------

insert into mvc_member values('aaa', '1234', 'abcd');

delete from mvc_member;

select * from mvc_member;

create table mvc_member(
    mem_uid varchar2(15),
    mem_pwd varchar2(15),
    mem_name varchar2(10)
);

commit;






------------------------------------------------------------------

CREATE TABLE PRODUCT_REV(
REVCODE NUMBER(20) PRIMARY KEY, --리뷰번호
REVTITLE VARCHAR2(30), --리뷰제목
REVCONT VARCHAR2(500), --리뷰내용
REVAUTH VARCHAR2(30), --리뷰작성자
REVDATE date default sysdate, --작성일
REVHIT NUMBER DEFAULT 0 NOT NULL --조회수
);

--글번호를 받아서 뜰 수있게 구현하기
-- 댓글번호(PK), 아이디(FK), 주문번호+상품번호(FK), 비밀번호(FK)
CREATE TABLE REV_COMMENTS(
REVCODE NUMBER(20) NOT NULL, --리뷰글번호
CMTCODE NUMBER(20) PRIMARY KEY NOT NULL, --댓글번호
CMTNAME VARCHAR2(30), --댓작성자[아이디]
CMTPWD VARCHAR2(30), --댓글 비밀번호[비밀번호]
CMTCONT VARCHAR2(300), --댓글 내용
CMTDATE DATE DEFAULT SYSDATE
);

ALTER TABLE REV_COMMENTS 
ADD CONSTRAINT FK_REV_COMMENTS_REVCODE
FOREIGN KEY(REVCODE)
REFERENCES PRODUCT_REV(REVCODE);


insert into admin values('ADMIN00', 'ADMIN00', 'Y');

delete from notice where noticode = 2;

select * from product_ord;
select * from notice;
select * from admin;
select * from product;
select * from category;
select * from member;
select * from product_op_color;
select * from product_op_size;
select * from cart;
select * from pay;

delete from member;
delete from member where id = '2897451099';
delete from product where procode between 7 and 100;
delete from cart where procode = 2;
delete from cart where userid = 'test1';
update member set pwd = 'test1' where id = 'test1';
commit;

update product set proimg = 'https://img.77g.com/shopping/prodLimg/w32133.jpg' where proname = 'chair a';
update product set proimg = 'https://www.imwood.co.kr/news/photo/201502/12474-2-14774.jpg' where proname = 'chair b';
update product set proimg = 'https://www.thediy.co.kr/data/goods/1/2009/03/2028_tmp_14871638490277large.jpg' where proname = 'chair c';
update product set proimg = 'https://emons.co.kr/shop/data/goods/main_qk7IiY64Kp7ZiV.jpg' where proname = 'bed a';

insert into cart (cartcode, userid, procode, amount)
    values (2, 'test1', 1, 1);

insert into product_ord (ordercode, userid, cartcode, name, postcode, addr, etcaddr, hp, memo, orderdate, status, totalprice, changedate)
values ('test','test1', 2,'홍길동','1234','rewfew','fewwe','010-2222-1111',NULL, '2023-06-30','1','30000', NULL);

insert into product_out (pocode, ordercode, procode, amount, cartcode)
values ('534fsa','test', 1 ,2, 2);


insert into member(id, pwd, email, hp, name) values('test1', 'test1', 'test1@test.com', '010-xxxx-xxxx', '홍길동');
delete from member where id = 'test1';

insert into product_rev(id, pwd, email, hp, name) values('test1', 'test1', 'test1@test.com', '010-xxxx-xxxx', '홍길동');


delete from product;
delete from PRODUCT_QNA;
delete from PRODUCT_REV;
delete from REV_COMMENTS;

insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty) values(1, 1, 'chair a', 1000, 500, '의자 a 입니다', 'Y', 10);
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty) values(2, 1, 'chair b', 2000, 500, '의자 b 입니다', 'Y', 20);
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty) values(3, 1, 'chair c', 3000, 300, '의자 c 입니다', 'Y', 30);
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(7, 1, 'chair d', 4000, 400, '의자 4 입니다', 'Y', 30, 'https://www.namuddl.co.kr/shopimages/namuddl/0160010003883.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(101, 1, 'chair e', 5000, 500, '의자 5 입니다', 'Y', 30, 'https://www.namuddl.co.kr/shopimages/namuddl/0160010003883.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty) values(4, 2, 'bed a', 1100, 100, '침대 a 입니다', 'Y', 5);
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty) values(5, 3, 'desk a', 5100, 1100, '책상 a 입니다', 'Y', 10);
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty) values(6, 4, 'sofa a', 8000, 1000, '소파 a 입니다', 'Y', 15);

-- 카테고리
insert into category(catecode, catename) values(1, 'chair');
insert into category(catecode, catename) values(2, 'bed');
insert into category(catecode, catename) values(3, 'tabledesk');
insert into category(catecode, catename) values(4, 'sofa');
insert into category(catecode, catename) values(5, 'drawer');
insert into category(catecode, catename) values(6, 'tvtable');
insert into category(catecode, catename) values(7, 'shelf');
insert into category(catecode, catename) values(8, 'bookshelf');
insert into category(catecode, catename) values(9, 'closet');
insert into category(catecode, catename) values(0, 'dressingtable');

-- 1. 의자
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(101, 1, 'chair a', 50000, 45000, '의자 a 입니다', 'Y', 30, 'https://www.namuddl.co.kr/shopimages/namuddl/0160010003883.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(102, 1, 'chair b', 40000, 38500, '의자 b 입니다', 'Y', 30, 'https://m.marketb.kr/web/product/big/202208/f9f2a21d363cc2560ba21b5cd8c5a710.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(103, 1, 'chair c', 60000, 50000, '의자 c 입니다', 'Y', 30, 'https://img.77g.com/shopping/prodLimg/w32133.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(104, 1, 'chair d', 55000, 51000, '의자 d 입니다', 'Y', 30, 'https://www.imwood.co.kr/news/photo/201502/12474-2-14774.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(105, 1, 'chair e', 58000, 5200, '의자 e 입니다', 'Y', 30, 'https://www.thediy.co.kr/data/goods/1/2009/03/2028_tmp_14871638490277large.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(106, 1, 'chair f', 100000, 85000, '의자 f 입니다', 'Y', 30, 'https://emons.co.kr/shop/data/goods/main_qk7IiY64Kp7ZiV.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(107, 1, 'chair g', 80000, 75000, '의자 g 입니다', 'Y', 30, 'https://m.abfurniture.co.kr/web/product/big/202103/06d0e6ce5690682073fc8b8b692124cd.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(108, 1, 'chair h', 70000, 65000, '의자 h 입니다', 'Y', 30, 'https://m.25w.co.kr/web/product/big/202301/9c12d93e9d8b192a7186864cbdd2b720.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(109, 1, 'chair i', 150000, 125000, '의자 i 입니다', 'Y', 30, 'https://m.apjrental.com/web/product/medium/201908/69cbaf8be368a3c590ca187d3c860dee.png');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(110, 1, 'chair j', 95000, 88000, '의자 j 입니다', 'Y', 30, 'https://t1.daumcdn.net/cfile/tistory/2637203E5325C0760F');
-- 2. 침대
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(201, 2, 'bed a', 500000, 450000, '침대 a 입니다', 'Y', 30, 'https://m.mosdesign.co.kr/web/product/medium/202203/3c047f2145865534d04d01fe26db6196.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(202, 2, 'bed b', 400000, 385000, '침대 b 입니다', 'Y', 30, 'https://jangin.com/data/product/b_file_15899560228gir3d5899.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(203, 2, 'bed c', 600000, 500000, '침대 c 입니다', 'Y', 30, 'https://www.jangin.com/data/product/b_file_1551681994r2rea5srnr.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(204, 2, 'bed d', 550000, 510000, '침대 d 입니다', 'Y', 30, 'https://www.jangin.com/data/product/b_file_1653985696pksl5mlnv1.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(205, 2, 'bed e', 580000, 52000, '침대 e 입니다', 'Y', 30, 'https://m.plaire.co.kr/web/product/medium/202210/428a1d7f005715f57c9f2cad06b8aa61.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(206, 2, 'bed f', 1000000, 850000, '침대 f 입니다', 'Y', 30, 'https://m.plaire.co.kr/web/product/medium/202209/3a925ef2ee1c16e04685981e088b8168.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(207, 2, 'bed g', 800000, 750000, '침대 g 입니다', 'Y', 30, 'https://www.costco.co.kr/medias/sys_master/images/h06/h2f/87244890865694.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(208, 2, 'bed h', 700000, 650000, '침대 h 입니다', 'Y', 30, 'https://m.plaire.co.kr/web/product/medium/202201/098516c636c8fa3c1fa73b21e0bb9dc7.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(209, 2, 'bed i', 1500000, 1250000, '침대 i 입니다', 'Y', 30, 'https://www.ikea.com/kr/ko/images/products/kopardal-bed-frame-grey__1028815_pe835561_s5.jpg?f=s');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(210, 2, 'bed j', 950000, 880000, '침대 j 입니다', 'Y', 30, 'https://image.hanssem.com/hsimg/gds/368/724/724132_A1.jpg?v=20220824192153');
-- 3. 테이블 책상
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(301, 3, 'tabledesk a', 50000, 45000, '테이블 a 입니다', 'Y', 30, 'https://m.roemfn.co.kr/web/product/big/202008/01ba07a4e056b1ab23919212d5161de2.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(302, 3, 'tabledesk b', 40000, 38500, '테이블 b 입니다', 'Y', 30, 'https://thumbnail.10x10.co.kr/webimage/image/add1/254/A002543353_01.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(303, 3, 'tabledesk c', 60000, 50000, '테이블 c 입니다', 'Y', 30, 'https://thumbnail.10x10.co.kr/webimage/image/basic600/202/B002023511.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(304, 3, 'tabledesk d', 55000, 51000, '테이블 d 입니다', 'Y', 30, 'https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/2665298594/B.jpg?876000000');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(305, 3, 'tabledesk e', 58000, 5200, '테이블 e 입니다', 'Y', 30, 'https://contents.lotteon.com/itemimage/LO/11/90/38/36/10/_1/19/03/83/61/1/LO1190383610_1190383611_1.jpg/dims/optimize/dims/resizemc/400x400');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(306, 3, 'tabledesk f', 100000, 85000, '테이블 f 입니다', 'Y', 30, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-x3r76ZUoNOIKVXt9rr_4fO0rxKbIg3kuzrtxgijcj19zRI6JfaGPpb6OvGTtHl28s2A&usqp=CAU');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(307, 3, 'tabledesk g', 80000, 75000, '테이블 g 입니다', 'Y', 30, 'https://qi-o.qoo10cdn.com/goods_image_big/4/1/2/2/7325794122_l.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(308, 3, 'tabledesk h', 70000, 65000, '테이블 h 입니다', 'Y', 30, 'https://openimage.interpark.com/goods_image_big/6/7/9/1/9244746791c_l.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(309, 3, 'tabledesk i', 150000, 125000, '테이블 i 입니다', 'Y', 30, 'https://contents.lotteon.com/itemimage/_v000819/LO/21/22/41/86/70/_2/12/24/18/67/1/LO2122418670_2122418671_1.jpg/dims/optimize/dims/resizemc/400x400');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(310, 3, 'tabledesk j', 95000, 88000, '테이블 j 입니다', 'Y', 30, 'https://sitem.ssgcdn.com/24/25/69/item/1000519692524_i1_500.jpg');
-- 4. 소파
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(401, 4, 'sofa a', 250000, 145000, '소파 a 입니다', 'Y', 30, 'https://wekino.co.kr/web/product/small/202303/74f746bf96f54f083d9c7749a4ac8eb4.png');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(402, 4, 'sofa b', 2240000, 138500, '소파 b 입니다', 'Y', 30, 'https://www.jangin.com/data/product/b_file_162244383908rqp5zlz8.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(403, 4, 'sofa c', 360000, 250000, '소파 c 입니다', 'Y', 30, 'https://www.jangin.com/data/product/b_file_1586757934r44ojmj447.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(404, 4, 'sofa d', 255000, 151000, '소파 d 입니다', 'Y', 30, 'https://m.younggagu.com/web/product/medium/202112/78ca8fef2b8be59e6155ea4087c02a7e.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(405, 4, 'sofa e', 258000, 115200, '소파 e 입니다', 'Y', 30, 'https://m.oneroommaking.com/web/product/extra/big/202110/a0392ae70698beb5d1d301db4c434c33.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(406, 4, 'sofa f', 120000, 85000, '소파 f 입니다', 'Y', 30, 'https://m.oneroommaking.com/web/product/extra/big/202110/66b8f2849cbca738914f576847549118.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(407, 4, 'sofa g', 380000, 275000, '소파 g 입니다', 'Y', 30, 'https://image.yes24.com/goods/69168393/XL');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(408, 4, 'sofa h', 270000, 165000, '소파 h 입니다', 'Y', 30, 'https://qi-o.qoo10cdn.com/goods_image_big/3/8/4/8/7427983848_l.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(409, 4, 'sofa i', 150000, 125000, '소파 i 입니다', 'Y', 30, 'https://openimage.interpark.com/goods_image_big/9/7/1/8/9181279718_l.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(410, 4, 'sofa j', 295000, 188000, '소파 j 입니다', 'Y', 30, 'https://m.younggagu.com/web/product/medium/201905/b7947c1c64c9fd195e2fd4b1b42d668e.jpg');








select * from product_op_color;
insert into product_op_color values(1, '빨강', '주황', '노랑');
select * from product_op_size;
insert into product_op_size values(1, 'S', 'L', 'XL');
commit;

commit;




select * from notice;




-----------------------------------------------------------------------------------------------

SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
DROP TABLE "PRODUCT_ORD" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCT_OUT" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCT" CASCADE CONSTRAINTS;
DROP TABLE "MEMBER" CASCADE CONSTRAINTS;
DROP TABLE "CATEGORY" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCT_QNA" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCT_QNA_RE" CASCADE CONSTRAINTS;
DROP TABLE "NOTICE" CASCADE CONSTRAINTS;
DROP TABLE "CART" CASCADE CONSTRAINTS;
DROP TABLE "REV_COMMENTS" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCT_REV" CASCADE CONSTRAINTS;
DROP TABLE "PAY" CASCADE CONSTRAINTS;
DROP TABLE "ADMIN" CASCADE CONSTRAINTS;

DROP SEQUENCE "REV_COMMENTS_SEQ";
DROP SEQUENCE "PRODUCT_REV_SEQ";

DROP INDEX "PK_PRODUCT_ORD";


SELECT
    OBJECT_NAME
    ,OBJECT_TYPE
FROM
    USER_OBJECTS
WHERE OBJECT_NAME LIKE '%PRODUCT_ORD%';

select * from notice;





CREATE TABLE "PRODUCT_ORD" (
	"ORDERCODE"	NUMBER(20, 0)		NOT NULL,
	"USERID"	VARCHAR2(30)		NOT NULL,
	"NAME"	VARCHAR2(30)		NULL,
	"POSTCODE"	VARCHAR2(30)		NULL,
	"ADDR"	VARCHAR2(100)		NULL,
	"ETCADDR"	VARCHAR2(100)		NULL,
	"HP"	VARCHAR2(50)		NULL,
	"MEMO"	VARCHAR2(100)		NULL,
	"ORDERDATE"	DATE		NULL,
	"TOTALPRICE"	VARCHAR2(50)		NULL,
	"STATUS"	NUMBER(10)	DEFAULT 1	NULL,
	"CHANGEDATE"	VARCHAR(255)		NULL
);

COMMENT ON COLUMN "PRODUCT_ORD"."STATUS" IS '1:주문, 2:교환, 3:환불, 4:주소';

CREATE TABLE "PRODUCT_OUT" (
	"POCODE"	NUMBER(20)		NOT NULL,
	"ORDERCODE"	NUMBER(20)		NOT NULL,
	"PROCODE"	NUMBER(20)		NOT NULL,
	"AMOUNT"	NUMBER(20)		NULL,
	"STATUS"	NUMBER(10)	DEFAULT 1	NULL,
	"OUTDATE"	DATE		NULL
);

COMMENT ON COLUMN "PRODUCT_OUT"."STATUS" IS '1: 결제대기, 2: 출고대기, 3: 출고, 4: 취소';

CREATE TABLE "PRODUCT" (
	"PROCODE"	NUMBER(20)		NOT NULL,
	"CATECODE"	NUMBER(20)		NOT NULL,
	"PRONAME"	VARCHAR2(30)		NULL,
	"PROPRICE"	VARCHAR2(30)		NULL,
	"PROSALE"	VARCHAR2(30)		NULL,
	"PROINFO"	VARCHAR2(500)		NULL,
	"PROYN"	VARCHAR2(10)	DEFAULT 'Y'	NULL,
	"PROQTY"	NUMBER(30, 0)		NULL,
	"PROTHUMB"	VARCHAR2(500)		NULL,
	"PROIMG"	VARCHAR2(500)		NULL
);

CREATE TABLE "PAY" (
	"PAYCODE"	NUMBER(20)		NOT NULL,
	"ORDERCODE"	NUMBER(20)		NOT NULL,
	"PAYPRICE"	NUMBER(20)		NULL,
	"PAYMENT"	NUMBER(10)		NULL,
	"ISPAID"	NUMBER(10)		NULL,
	"ISREFUND"	NUMBER(10)	DEFAULT 0	NULL
);

COMMENT ON COLUMN "PAY"."PAYMENT" IS '1: 무통장입금, 2: 신용카드, 3: 카카오페이';

CREATE TABLE "MEMBER" (
	"ID"	VARCHAR2(30)		NOT NULL,
	"PWD"	VARCHAR2(200)		NULL,
	"EMAIL"	VARCHAR2(30)		NULL,
	"HP"	VARCHAR2(30)		NULL,
	"NAME"	VARCHAR2(30)		NULL,
	"PCODE"	VARCHAR2(30)		NULL,
	"LOADADDR"	VARCHAR2(100)		NULL,
	"LOTADDR"	VARCHAR2(100)		NULL,
	"EXTRAADDR"	VARCHAR2(100)		NULL,
	"ETCADDR"	VARCHAR2(100)		NULL,
	"ADMIN"	VARCHAR2(10)	DEFAULT 'N'	NULL
);

CREATE TABLE "CATEGORY" (
	"CATECODE"	NUMBER(20)		NOT NULL,
	"CATENAME"	VARCHAR2(30)		NULL,
	"CATECODEREF"	NUMBER(20)		NULL
);

CREATE TABLE "PRODUCT_QNA" (
	"QNACODE"	NUMBER(20)		NOT NULL,
	"PROCODE"	NUMBER(20)		NOT NULL,
	"QNATITLE"	VARCHAR2(100)		NULL,
	"QNACONT"	VARCHAR2(500)		NULL,
	"QNADATE"	DATE		NULL,
	"QNAAUTH"	VARCHAR2(30)		NULL
);

CREATE TABLE "PRODUCT_QNA_RE" (
	"RECODE"	NUMBER(20)		NOT NULL,
	"QNACODE"	NUMBER(20)		NOT NULL,
	"RECONT"	VARCHAR2(500)		NULL,
	"REDATE"	DATE		NULL
);

CREATE TABLE "NOTICE" (
	"NOTICODE"	NUMBER(20)		NOT NULL,
	"NOTITITLE"	VARCHAR2(500)		NULL,
	"NOTICONT"	VARCHAR2(500)		NULL,
	"NOTIDATE"	DATE		NULL,
	"NOTIAUTH"	VARCHAR2(30)		NULL
);

CREATE TABLE "CART" (
	"CARTCODE"	NUMBER(20)		NOT NULL,
	"USERID"	VARCHAR2(30)		NOT NULL,
	"PROCODE"	NUMBER(20)		NOT NULL,
	"AMOUNT"	NUMBER(30)		NULL,
	"ISCHECKED"	NUMBER(10)	DEFAULT 1	NULL,
	"ISPAID"	NUMBER(10)	DEFAULT 0	NULL
);

CREATE TABLE "PRODUCT_REV" (
	"REVCODE"	NUMBER(20)		NOT NULL,
	"PROCODE"	NUMBER(20)		NOT NULL,
	"ID"		VARCHAR2(30)		NOT NULL,
	"REVTITLE"	VARCHAR2(30) 		NULL,
	"REVCONT"	VARCHAR2(500)		NULL,
	"REVAUTH"	VARCHAR2(30)		NULL,
	"REVDATE"	DATE   DEFAULT SYSDATE	NULL,
	"REVHIT"		NUMBER(10)  DEFAULT 0 	NOT NULL
);

CREATE TABLE REV_COMMENTS(
	"REVCODE"	NUMBER(20)		NOT NULL,
	"CMTCODE"	NUMBER(20)		NOT NULL  PRIMARY KEY,
	"CMTCONT"	VARCHAR2(300)		NULL,
	"CMTDATE"	DATE  DEFAULT SYSDATE	NULL

);

CREATE TABLE "ADMIN" (
	"ID"	VARCHAR2(30)		NOT NULL,
	"PWD"	VARCHAR2(200)		NULL,
	"ADMIN"	VARCHAR2(10)	DEFAULT 'Y'	NULL
);

ALTER TABLE "PRODUCT_ORD" ADD CONSTRAINT "PK_PRODUCT_ORD" PRIMARY KEY (
	"ORDERCODE"
);

ALTER TABLE "PRODUCT_OUT" ADD CONSTRAINT "PK_PRODUCT_OUT" PRIMARY KEY (
	"POCODE",
	"ORDERCODE"
);

ALTER TABLE "PRODUCT" ADD CONSTRAINT "PK_PRODUCT" PRIMARY KEY (
	"PROCODE"
);

ALTER TABLE "PAY" ADD CONSTRAINT "PK_PAY" PRIMARY KEY (
	"PAYCODE",
	"ORDERCODE"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"ID"
);

ALTER TABLE "CATEGORY" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY (
	"CATECODE"
);

ALTER TABLE "PRODUCT_QNA" ADD CONSTRAINT "PK_PRODUCT_QNA" PRIMARY KEY (
	"QNACODE"
);

ALTER TABLE "PRODUCT_QNA_RE" ADD CONSTRAINT "PK_PRODUCT_QNA_RE" PRIMARY KEY (
	"RECODE"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NOTICODE"
);

ALTER TABLE "CART" ADD CONSTRAINT "PK_CART" PRIMARY KEY (
	"CARTCODE"
);

ALTER TABLE "PRODUCT_REV" ADD CONSTRAINT "PK_PRODUCT_REV" PRIMARY KEY (
	"REVCODE"
);

ALTER TABLE "ADMIN" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY (
	"ID"
);

ALTER TABLE "PRODUCT_OUT" ADD CONSTRAINT "FK_PRODUCT_ORD_TO_PRODUCT_OUT" FOREIGN KEY (
	"ORDERCODE"
)
REFERENCES "PRODUCT_ORD" (
	"ORDERCODE"
);

ALTER TABLE "PAY" ADD CONSTRAINT "FK_PRODUCT_ORD_TO_PAY" FOREIGN KEY (
	"ORDERCODE"
)
REFERENCES "PRODUCT_ORD" (
	"ORDERCODE"
);

ALTER TABLE "REV_COMMENTS" ADD CONSTRAINT "FK_PRODUCT_REV_TO_REV_COMMENTS" FOREIGN KEY(
	"REVCODE"
)
REFERENCES "PRODUCT_REV"(
	"REVCODE"
);

ALTER TABLE "PRODUCT_OUT" ADD CONSTRAINT "FK_PRODUCT_TO_PRODUCT_OUT" FOREIGN KEY(
	"PROCODE"
)
REFERENCES "PRODUCT"(
	"PROCODE"
);

ALTER TABLE "PRODUCT" ADD CONSTRAINT "FK_CATEGORY_TO_PRODUCT" FOREIGN KEY(
	"CATECODE"
)
REFERENCES "CATEGORY"(
	"CATECODE"
);

ALTER TABLE "CART" ADD CONSTRAINT "FK_PRODUCT_TO_CART" FOREIGN KEY(
	"PROCODE"
)
REFERENCES "PRODUCT"(
	"PROCODE"
);

ALTER TABLE "PRODUCT_QNA" ADD CONSTRAINT "FK_PRODUCT_TO_PRODUCT_QNA" FOREIGN KEY(
	"PROCODE"
)
REFERENCES "PRODUCT"(
	"PROCODE"
);

ALTER TABLE "PRODUCT_REV" ADD CONSTRAINT "FK_PRODUCT_TO_PRODUCT_REV" FOREIGN KEY(
	"PROCODE"
)
REFERENCES "PRODUCT"(
	"PROCODE"
);

ALTER TABLE "PRODUCT_ORD" ADD CONSTRAINT "FK_MEMBER_TO_PRODUCT_ORD" FOREIGN KEY(
	"USERID"
)
REFERENCES "MEMBER"(
	"ID"
);

ALTER TABLE "CART" ADD CONSTRAINT "FK_MEMBER_TO_CART" FOREIGN KEY(
	"USERID"
)
REFERENCES "MEMBER"(
	"ID"
);

ALTER TABLE "PRODUCT_REV" ADD CONSTRAINT "FK_MEMBER_TO_PRODUCT_REV" FOREIGN KEY(
	"ID"
)
REFERENCES "MEMBER"(
	"ID"
);

ALTER TABLE "PRODUCT_QNA_RE" ADD CONSTRAINT "FK_PRODUCT_QNA_TO_QNA_RE" FOREIGN KEY(
	"QNACODE"
)
REFERENCES "PRODUCT_QNA"(
	"QNACODE"
);




CREATE SEQUENCE  PRODUCT_REV_SEQ
MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 NOCYCLE ;

CREATE SEQUENCE  REV_COMMENTS_SEQ
MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 NOCYCLE ;

CREATE SEQUENCE  PRODUCT_QNA_SEQ
MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 NOCYCLE ;

CREATE SEQUENCE QNA_RE_SEQ
MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 NOCYCLE ;

CREATE SEQUENCE NOTICE_SEQ
MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 NOCYCLE ;

CREATE SEQUENCE CART_SEQ
MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 NOCYCLE ;

CREATE SEQUENCE PRODUCT_SEQ
MINVALUE 1 MAXVALUE 9999 INCREMENT BY 20 START WITH 1 NOCYCLE ;

drop sequence product_seq;

ALTER TABLE PRODUCT MODIFY PROPRICE NUMBER(20);
ALTER TABLE PRODUCT MODIFY PROSALE NUMBER(20);


ALTER TABLE PRODUCT_REV DROP COLUMN REVAUTH;
ALTER TABLE PRODUCT_QNA ADD(ID VARCHAR2(30) NOT NULL);
ALTER TABLE PRODUCT_QNA DROP COLUMN QNAAUTH;
ALTER TABLE "PRODUCT_QNA" ADD CONSTRAINT "FK_MEMBER_TO_PRODUCT_QNA" FOREIGN KEY(
	"ID"
)
REFERENCES "MEMBER"(
	"ID"
);

commit;



DROP TABLE PRODUCT_OUT;
DROP TABLE PAY;
ALTER TABLE PRODUCT_ORD MODIFY ORDERCODE VARCHAR2(30);
CREATE TABLE "PRODUCT_OUT" (
	"POCODE"	NUMBER(20)		NOT NULL,
	"ORDERCODE"	VARCHAR2(30)		NOT NULL,
	"PROCODE"	NUMBER(20)		NOT NULL,
	"AMOUNT"	NUMBER(20)		NULL,
	"STATUS"	NUMBER(10)	DEFAULT 1	NULL,
	"OUTDATE"	DATE	DEFAULT SYSDATE	NULL
);
CREATE TABLE "PAY" (
	"PAYCODE"	NUMBER(20)		NOT NULL,
	"ORDERCODE"	VARCHAR2(30)		NOT NULL,
	"PAYPRICE"	NUMBER(20)		NULL,
	"PAYMENT"	NUMBER(10)		NULL,
	"ISPAID"	NUMBER(10)		NULL,
	"ISREFUND"	NUMBER(10)	DEFAULT 0	NULL
);

ALTER TABLE PRODUCT_ORD MODIFY ORDERDATE DATE DEFAULT SYSDATE;
ALTER TABLE PRODUCT_OUT MODIFY OUTDATE DATE DEFAULT SYSDATE;
ALTER TABLE PRODUCT_QNA MODIFY QNADATE DATE DEFAULT SYSDATE;
ALTER TABLE PRODUCT_QNA_RE MODIFY REDATE DATE DEFAULT SYSDATE;
ALTER TABLE NOTICE MODIFY NOTIDATE DATE DEFAULT SYSDATE;
ALTER TABLE PRODUCT_REV MODIFY REVDATE DATE DEFAULT SYSDATE;
ALTER TABLE REV_COMMENTS MODIFY CMTDATE DATE DEFAULT SYSDATE;

ALTER TABLE PRODUCT_ORD MODIFY CHANGEDATE DATE;


ALTER TABLE PRODUCT_ORD DROP CONSTRAINT FK_MEMBER_TO_PRODUCT_ORD;
ALTER TABLE CART DROP CONSTRAINT FK_MEMBER_TO_CART;
ALTER TABLE PRODUCT_REV DROP CONSTRAINT FK_MEMBER_TO_PRODUCT_REV;
ALTER TABLE PRODUCT_QNA DROP CONSTRAINT FK_MEMBER_TO_PRODUCT_QNA;


ALTER TABLE "PRODUCT_ORD" ADD CONSTRAINT "FK_MEMBER_TO_PRODUCT_ORD" FOREIGN KEY(
	"USERID"
)
REFERENCES "MEMBER"(
	"ID"
)
ON DELETE CASCADE;

ALTER TABLE "CART" ADD CONSTRAINT "FK_MEMBER_TO_CART" FOREIGN KEY(
	"USERID"
)
REFERENCES "MEMBER"(
	"ID"
)
ON DELETE CASCADE;

ALTER TABLE "PRODUCT_REV" ADD CONSTRAINT "FK_MEMBER_TO_PRODUCT_REV" FOREIGN KEY(
	"ID"
)
REFERENCES "MEMBER"(
	"ID"
)
ON DELETE CASCADE;

ALTER TABLE "PRODUCT_QNA" ADD CONSTRAINT "FK_MEMBER_TO_PRODUCT_QNA" FOREIGN KEY(
	"ID"
)
REFERENCES "MEMBER"(
	"ID"
)
ON DELETE CASCADE;




DROP TABLE "PRODUCT_OP_COLOR";
DROP TABLE "PRODUCT_OP_SIZE";

CREATE TABLE "PRODUCT_OP_COLOR" (
	"PROCODE"	NUMBER(20)		NOT NULL,
	"COLOR1"	VARCHAR(20)		NULL,
	"COLOR2"	VARCHAR(20)		NULL,
	"COLOR3"	VARCHAR(20)		NULL
);


CREATE TABLE "PRODUCT_OP_SIZE" (
	"PROCODE"	NUMBER(20)		NOT NULL,
	"SIZE1"	    VARCHAR(20)		NULL,
	"SIZE2"	    VARCHAR(20)		NULL,
	"SIZE3"	    VARCHAR(20)		NULL
);

ALTER TABLE "PRODUCT_OP_COLOR" ADD CONSTRAINT "PK_PRODUCT_OP_COLOR" PRIMARY KEY (
	"PROCODE"
);

ALTER TABLE "PRODUCT_OP_SIZE" ADD CONSTRAINT "PK_PRODUCT_OP_SIZE" PRIMARY KEY (
	"PROCODE"
);

ALTER TABLE "PRODUCT_OP_COLOR" ADD CONSTRAINT "FK_PRODUCT_TO_PRODUCT_OP_COLOR" FOREIGN KEY (
	"PROCODE"
)
REFERENCES "PRODUCT" (
	"PROCODE"
)
ON DELETE CASCADE;

ALTER TABLE "PRODUCT_OP_SIZE" ADD CONSTRAINT "FK_PRODUCT_TO_PRODUCT_OP_SIZE" FOREIGN KEY (
	"PROCODE"
)
REFERENCES "PRODUCT" (
	"PROCODE"
)
ON DELETE CASCADE;





ALTER TABLE "PRODUCT_ORD" ADD ("CARTCODE" NUMBER(20) NOT NULL);
ALTER TABLE "PRODUCT_OUT" ADD ("CARTCODE" NUMBER(20) NOT NULL);
ALTER TABLE "PRODUCT_ORD" ADD CONSTRAINT "FK_CART_TO_PRODUCT_ORD" FOREIGN KEY (
	"CARTCODE"
)
REFERENCES "CART" (
	"CARTCODE"
)
ON DELETE CASCADE;

ALTER TABLE "PRODUCT_OUT" ADD CONSTRAINT "FK_CART_TO_PRODUCT_OUT" FOREIGN KEY (
	"CARTCODE"
)
REFERENCES "CART" (
	"CARTCODE"
)
ON DELETE CASCADE;


ALTER TABLE "PAY" MODIFY PAYCODE VARCHAR2(30);
ALTER TABLE "PRODUCT_OUT" MODIFY POCODE VARCHAR2(30);


ALTER TABLE "MEMBER" ADD("SMS" VARCHAR2(10) DEFAULT 'N' NULL);
ALTER TABLE "MEMBER" ADD("EMAILS" VARCHAR2(10) DEFAULT 'N' NULL);
ALTER TABLE "MEMBER" DROP COLUMN ADMIN;

-------------
ALTER TABLE "CART" ADD "COLOR" VARCHAR2(20) NULL;
ALTER TABLE "CART" ADD "SIZE" VARCHAR2(20) NULL;

ALTER TABLE "PRODUCT_OUT" DROP CONSTRAINT "FK_CART_TO_PRODUCT_OUT";
ALTER TABLE "PRODUCT_ORD" DROP CONSTRAINT "FK_CART_TO_PRODUCT_ORD";

ALTER TABLE "CART" MODIFY "CARTCODE" VARCHAR2(50);
ALTER TABLE "PRODUCT_OUT" MODIFY "CARTCODE" VARCHAR2(50);
ALTER TABLE "PRODUCT_ORD" MODIFY "CARTCODE" VARCHAR2(50);

ALTER TABLE "PRODUCT_ORD" ADD CONSTRAINT "FK_CART_TO_PRODUCT_ORD" FOREIGN KEY (
	"CARTCODE"
)
REFERENCES "CART" (
	"CARTCODE"
)
ON DELETE CASCADE;

ALTER TABLE "PRODUCT_OUT" ADD CONSTRAINT "FK_CART_TO_PRODUCT_OUT" FOREIGN KEY (
	"CARTCODE"
)
REFERENCES "CART" (
	"CARTCODE"
)
ON DELETE CASCADE;

ALTER TABLE "CART" RENAME COLUMN "SIZE" TO "PSIZE";

commit;
select * from cart;
delete from cart;

insert into cart values('aaaaaaaaaaaaaaaa', 'test1', 1, 3, 1, 0, '빨강', 'L');

select size from cart;

select psize
from cart;

select cart.color
from cart 
where userid='test1' and procode = 1;
