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
select * from product;
select * from category;

insert into product(procode, catecode, proname, proprice, proinfo) values(1, 1, 'chair a', '$1000', '의자 a 입니다');
insert into product(procode, catecode, proname, proprice, proinfo) values(2, 1, 'chair b', '$2000', '의자 b 입니다');
insert into product(procode, catecode, proname, proprice, proinfo) values(3, 1, 'chair c', '$3000', '의자 c 입니다');
insert into product(procode, catecode, proname, proprice, proinfo) values(4, 2, 'bed a', '$1100', '침대 a 입니다');
insert into product(procode, catecode, proname, proprice, proinfo) values(5, 3, 'desk a', '$5100', '책상 a 입니다');
insert into product(procode, catecode, proname, proprice, proinfo) values(6, 4, 'sofa a', '$8000', '소파 a 입니다');

insert into category(catecode, catename) values(1, 'chair');
insert into category(catecode, catename) values(2, 'bed');
insert into category(catecode, catename) values(3, 'tabledesk');
insert into category(catecode, catename) values(4, 'sofa');

commit;









