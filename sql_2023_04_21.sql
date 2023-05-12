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
    B_ID NUMBER(5) primary key, -- 1. �۹�ȣ
    B_NAME VARCHAR2(20),        -- 2. �۾���
    B_EMAIL VARCHAR2(50),       -- 3. �۾��� ���� �ּ�
    B_TITLE VARCHAR2(80),       -- 4. �� ����
    B_CONTENT VARCHAR2(3000),   -- 5. �� ����
    B_DATE DATE,                -- 6. �ۼ�����
    B_HIT NUMBER(5) DEFAULT 0,  -- 7. ��ȸ��
    B_PWD VARCHAR2(12),         -- 8. ��й�ȣ
    B_IP VARCHAR2(15),          -- 9. ip�ּ�
    B_REF NUMBER(5),            -- 10. �� �׷�
    B_STEP NUMBER(5),           -- 11. �� ��ġ
    B_LEVEL NUMBER(5),          -- 12. �� ����
    B_FNAME VARCHAR2(100),      -- 13. ���ϸ�
    B_FSIZE NUMBER(10),         -- 14. ���� ũ��
    B_RFNAME VARCHAR2(100)      -- 15. ���� ���ϸ�
);


COMMIT;



-----------------------------------------------

--*.������ ���� (USER_ �� ���۵Ǵ� ���� ����)
SELECT * FROM USER_TAB_COLUMNS;
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, NULLABLE FROM USER_TAB_COLUMNS;



