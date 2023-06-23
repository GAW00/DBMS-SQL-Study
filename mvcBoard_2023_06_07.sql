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






select * from product;
select * from category;
select * from member;

update product set proimg = 'https://img.77g.com/shopping/prodLimg/w32133.jpg' where proname = 'chair a';
update product set proimg = 'https://www.imwood.co.kr/news/photo/201502/12474-2-14774.jpg' where proname = 'chair b';
update product set proimg = 'https://www.thediy.co.kr/data/goods/1/2009/03/2028_tmp_14871638490277large.jpg' where proname = 'chair c';
update product set proimg = 'https://emons.co.kr/shop/data/goods/main_qk7IiY64Kp7ZiV.jpg' where proname = 'bed a';

insert into member(id, pwd, email, hp, name) values('test1', 'test1', 'test1@test.com', '010-xxxx-xxxx', '홍길동');
insert into product_rev(id, pwd, email, hp, name) values('test1', 'test1', 'test1@test.com', '010-xxxx-xxxx', '홍길동');


delete from product;

insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty) values(1, 1, 'chair a', 1000, 500, '의자 a 입니다', 'Y', 10);
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty) values(2, 1, 'chair b', 2000, 500, '의자 b 입니다', 'Y', 20);
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty) values(3, 1, 'chair c', 3000, 300, '의자 c 입니다', 'Y', 30);
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty, proimg) values(7, 1, 'chair d', 4000, 400, '의자 4 입니다', 'Y', 30, 'https://www.namuddl.co.kr/shopimages/namuddl/0160010003883.jpg');
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty) values(4, 2, 'bed a', 1100, 100, '침대 a 입니다', 'Y', 5);
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty) values(5, 3, 'desk a', 5100, 1100, '책상 a 입니다', 'Y', 10);
insert into product(procode, catecode, proname, proprice, prosale, proinfo, proyn, proqty) values(6, 4, 'sofa a', 8000, 1000, '소파 a 입니다', 'Y', 15);

insert into category(catecode, catename) values(1, 'chair');
insert into category(catecode, catename) values(2, 'bed');
insert into category(catecode, catename) values(3, 'tabledesk');
insert into category(catecode, catename) values(4, 'sofa');

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
del





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