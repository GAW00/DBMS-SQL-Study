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