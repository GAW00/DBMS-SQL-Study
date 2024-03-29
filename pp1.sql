CREATE TABLE "USERS" (
	"ID"	VARCHAR2(30)		NOT NULL,
	"PW"	VARCHAR2(200)		NOT NULL,
	"NAME"	VARCHAR2(20)		NULL,
	"PHONE"	VARCHAR2(30)		NULL,
	"ADMIN"	VARCHAR2(10)	DEFAULT 'N'	NULL
);


CREATE TABLE "CLUB" (
	"CLUBNO"	NUMBER(20)		NOT NULL,
	"CHAIRMAN"	VARCHAR2(20)		NULL,
	"CLUBNAME"	VARCHAR2(30)		NULL,
	"DUES"	NUMBER(20)		NULL,
	"ACCOUNT"	VARCHAR2(30)		NULL,
	"ACCOUNTBANK"	VARCHAR2(30)		NULL,
	"LEFTOVER"	NUMBER(20)		NULL,
	"REGULATION"	VARCHAR2(1000)		NULL
);


CREATE TABLE "MEMBER" (
	"CLUBNO"	NUMBER(20)		NOT NULL,
	"ID"	VARCHAR2(30)		NOT NULL,
	"TOTALPAY"	NUMBER(20)		NULL,
	"CLUBSPOT"	VARCHAR2(10)	DEFAULT 'N'	NULL
);


CREATE TABLE "ACCOUNTBOOK" (
	"IONO"	NUMBER(20)		NOT NULL,
	"CLUBNO"	NUMBER(20)		NOT NULL,
	"DATE"	DATE	DEFAULT SYSDATE	NULL,
	"CONTENT"	VARCHAR2(500)		NULL,
	"IO"	VARCHAR2(20)		NULL,
	"AMOUNT"	NUMBER(20)		NULL
);


CREATE TABLE "NOTICE" (
	"NOTICODE"	NUMBER(20)		NOT NULL,
	"CLUBNO"	NUMBER(20)		NOT NULL,
	"TITLE"	VARCHAR2(50)		NULL,
	"CONTENT"	VARCHAR2(500)		NULL,
	"AUTH"	VARCHAR2(30)		NULL,
	"DATE"	DATE	DEFAULT SYSDATE	NULL
);


CREATE TABLE "COMMUNITY" (
	"POSTCODE"	NUMBER(20)		NOT NULL,
	"CLUBNO"	NUMBER(20)		NOT NULL,
	"TITLE"	VARCHAR2(50)		NULL,
	"CONTENT"	VARCHAR2(500)		NULL,
	"AUTH"	VARCHAR2(30)		NULL,
	"DATE"	DATE	DEFAULT SYSDATE	NULL
);

CREATE SEQUENCE  CLUB_SEQ
MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 NOCYCLE ;

CREATE SEQUENCE  IO_SEQ
MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 NOCYCLE ;

CREATE SEQUENCE  NOTICE_SEQ
MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 NOCYCLE ;

CREATE SEQUENCE  POST_SEQ
MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 NOCYCLE ;



select * from club;
select * from member;
select * from users;

commit;

insert into users values('test', 'test', 'ttest', '01012345678', 'N');
insert into users values('test2', 'test2', 'ttest2', '01012345679', 'N');
insert into club values(club_seq.nextval, 'test', '���ȸ', 10000, '1234-56-78910', '����', 180000, '1�� 1�� ~ 2�� 2�� !');
insert into club values(club_seq.nextval, 'test2', '���ȸ2', 20000, '1234-56-78911', '����', 180000, '1�� 1�� ~ 2�� 2�� !');
insert into member values(41, 'test', 50000, 'Y');
club_seq.nextval;



DROP TABLE "USERS";
DROP TABLE "CLUB";
DROP TABLE "MEMBER";
DROP TABLE "ACCOUNTBOOK";
DROP TABLE "NOTICE";
DROP TABLE "COMMUNITY";