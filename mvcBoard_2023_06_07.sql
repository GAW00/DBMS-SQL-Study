delete from mvc_board;

drop table mvc_board;
drop sequence mvc_board_seq;

CREATE SEQUENCE  MVC_BOARD_SEQ  
MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 NOCYCLE ;

insert into mvc_board values(1, 'a', 'aa', 'aaa', sysdate, 0);
insert into mvc_board values(4, 'd', 'dd', 'ddd', sysdate, 0);

select bid, bname, btitle, bcontent, bdate, bhit from mvc_board;

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










