select * from member2;

desc member2;

SELECT NAME, CLASS, TEL FROM MEMBER2 WHERE ID = ?;

UPDATE MEMBER2 SET NAME = 'aaa' WHERE ID = 'aaa';

rollback;

commit;

select * from memberT;
desc memberT;
CREATE TABLE memberT(
    mem_uid varchar2(15) primary key not null,
    mem_pwd varchar2(15) not null,
    mem_name varchar2(10) not null,
    mem_email varchar2(50) not null,
    mem_addr varchar2(100)
);

INSERT INTO memberT VALUES('abc', '123', 'ABC', 'abc@abc.com', 'a-b-c');
UPDATE MEMBERT SET MEM_UID = 'ZZZ', MEM_NAME = 'XXX' WHERE MEM_UID = 'abc';

DROP TABLE memberT;

--=============================

DROP TABLE BOARDT;

select * from boardt;
SELECT B_ID, B_NAME, B_EMAIL, B_TITLE, B_CONTENT, TO_CHAR(B_DATE,'YYYY-MM-DD HH24:MM') B_DATE, B_HIT, B_PWD, B_IP, B_REF, B_STEP, B_LEVEL FROM BOARDT ORDER BY B_REF, B_LEVEL, B_STEP, B_ID;

select rownum, a.* from(select * from boardt) a;
DELETE FROM BOARDT where b_id=2;

CREATE TABLE boardT(
    B_ID NUMBER(5) primary key, -- 1. 글번호
    B_NAME VARCHAR2(20),        -- 2. 글쓴이
    B_EMAIL VARCHAR2(50),       -- 3. 글쓴이 메일 주소
    B_TITLE VARCHAR2(80),       -- 4. 글 제목
    B_CONTENT VARCHAR2(3000),   -- 5. 글 내용
    B_DATE DATE,                -- 6. 작성일자
    B_HIT NUMBER(5) DEFAULT 0,  -- 7. 조회수
    B_PWD VARCHAR2(12),         -- 8. 비밀번호
    B_IP VARCHAR2(15),          -- 9. ip주소
    B_REF NUMBER(5),            -- 10. 글 그룹
    B_STEP NUMBER(5),           -- 11. 글 위치
    B_LEVEL NUMBER(5),          -- 12. 글 레벨
    B_FNAME VARCHAR2(100),      -- 13. 파일명
    B_FSIZE NUMBER(10),         -- 14. 파일 크기
    B_RFNAME VARCHAR2(100)      -- 15. 실제 파일명
);


COMMIT;



-----------------------------------------------

--*.데이터 사전 (USER_ 로 시작되는 것이 있음)
SELECT * FROM USER_TAB_COLUMNS;
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, NULLABLE FROM USER_TAB_COLUMNS;



