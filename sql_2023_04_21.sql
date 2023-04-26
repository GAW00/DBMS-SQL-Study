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

DROP TABLE memberT;
DROP TABLE BOARDT;

select * from boardt;
DELETE FROM BOARDT;

CREATE TABLE boardT(
    B_ID NUMBER(5) primary key, -- 1. 글번호
    B_NAME VARCHAR2(20),        -- 2. 글쓴이
    B_EMAIL VARCHAR2(50),       -- 3. 글쓴이 메일 주소
    B_TITLE VARCHAR2(80),       -- 4. 글 제목
    B_CONTENT VARCHAR2(3000)    -- 5. 글 내용
);

INSERT INTO BOARDT(B_ID, B_NAME, B_EMAIL, B_TITLE, B_CONTENT) VALUES((SELECT NVL(MAX(B_ID), 0) + 1 FROM BOARDT), 'A', 'A', 'A', 'A');

COMMIT;