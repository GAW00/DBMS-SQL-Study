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
select rownum, a.* from(select * from boardt) a;
DELETE FROM BOARDT where b_id=1;

CREATE TABLE boardT(
    B_ID NUMBER(5) primary key, -- 1. �۹�ȣ
    B_NAME VARCHAR2(20),        -- 2. �۾���
    B_EMAIL VARCHAR2(50),       -- 3. �۾��� ���� �ּ�
    B_TITLE VARCHAR2(80),       -- 4. �� ����
    B_CONTENT VARCHAR2(3000),   -- 5. �� ����
    B_DATE DATE,                -- 6. �ۼ�����
    B_HIT number(5) default 0,  -- 7. ��ȸ��
    B_PWD varchar2(12)          -- 8. ��й�ȣ
);


COMMIT;
