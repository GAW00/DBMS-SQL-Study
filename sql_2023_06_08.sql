-- 12�� ���(3, 3, 6)
select *
from emp
order by deptno;

-- ��:4�� ���, ����:0�� ���
select *
from dept
where exists (select deptno
                 from dept
                 where deptno = 20);
                 
-- ��:1�� ���, ����:0�� ���
select *
from dept
where deptno in (select deptno
                 from dept
                 where deptno = 20);

select * 
from dept
where deptno = 20;


-- ���Ǿ� ����
drop synonym e;

-- ORA-01031: insufficient privileges (���� �����)
-- cmd â -> sqlplus -> user-name : system -> password : 1234 -> grant create synonym to scott;
create synonym e for emp;

-- �����ͻ��� : ���Ǿ� ����
select * from user_synonyms;
-- synonym e ������ �����
select * from e;
select * from emp;

-- 0 -> 20 (maxvalue 20, minvalue 0 �� cycle �� �������� 0�Ʒ��� �������� �ٽ� 20���� ���ư�)
select jno_seq_rev.nextval from dual;

create sequence jno_seq_rev
increment by -2
start with 10
maxvalue 20
minvalue 0
cycle
cache 2;


-- ������ ����
drop sequence jno_seq;

-- ������ ����
alter sequence jno_seq
maxvalue 120
nocycle
cache 10;

-- nextval ���� ���� �� ��ȸ��
-- ORA-08002:sequence JNO_SEQ.CURRVAL is not yet defined in this session
select jno_seq.currval from dual;

-- ���� ��ȣ(���� ����). �ش� ���� �����ؾ� �� ������ ����X ==> 100 -> 101 -> ... (1�� ����)
-- MAXVALUE ����� ����
-- ORA-08004: sequence JNO_SEQ.NEXTVAL exceeds MAXVALUE and cannot be instantiated
select jno_seq.nextval from dual;

-- ������ ����
create sequence jno_seq
increment by 1
start with 100
maxvalue 110
minvalue 90
cycle
cache 2; -- ��ȣ 2���� �޸𸮿� �÷��ΰ�(�ΰ��� ���̺��� ���� ����ϴ��� �ӵ� ������)

-- ������ ���� : ������ ����
select * from user_sequences;



-------------------------------------



select * from student;
select * from department;
select * from professor;
select * from emp2;
select * from dept2;
select * from emp;
-- �ǽ����� A-1
-- rollup : �����Լ�
select deptno,
       job,
       round(avg(sal), 1) "AVG_SAL",
       count(*) "CNT_EMP"
from emp
group by rollup(deptno, job);


select deptno,job, round(avg(sal),1) AVG_SAL,count(*) CNT_EMP
from emp
group by deptno, job
union all
select deptno,null job, round(avg(sal),1) AVG_SAL,count(*) CNT_EMP
from emp
group by deptno
union all
select null deptno,null job, round(avg(sal),1)AVG_SAL,count(*) CNT_EMP
from emp
order by deptno, job;





-- �ǽ����� 11��-12
select name,
       (select dname
        from dept2 d
        where e.deptno = d.dcode) "DNAME"
from emp2 e;


select e.name,
       d.dname
from emp2 e, dept2 d
where e.deptno = d.dcode;





-- �ǽ����� 11��-11
select name,
       position,
       to_char(pay, '$999,999,999') "SALARY"
from emp2
where (position, pay) in (select position,
                                 max(pay)
                          from emp2
                          group by position)
order by pay;





-- �ǽ����� 11��-10
select p.profno,
       p.name "PROF_NAME",
       to_char(p.hiredate, 'yyyy-MM-dd') "HIREDATE",
       d.dname
from professor p, department d
where p.deptno = d.deptno
      and
      (p.deptno, p.hiredate) in (select deptno,
                                        min(hiredate)
                                 from professor
                                 group by deptno)
order by 3;





-- �ǽ����� 11��-9
select grade,
       name,
       weight
from student
where (grade, weight) in (select grade,
                                 max(weight)
                          from student
                          group by grade)
order by grade;


select grade,
       name,
       weight
from student
where weight in (select max(weight)
                from student
                group by grade)
order by grade;





-- �ǽ����� 11��-8
select d.dname,
       e.name,
       to_char(e.pay,'$99,999,999') salary
from dept2 d, emp2 e
where d.dcode = e.deptno
      and
      e.pay < All (select avg(pay)
                   from emp2
                   group by deptno)
order by 3;





-- �ǽ����� 11��-7
select name,
       grade,
       weight
from student
where weight < All(select weight
                from student
                where grade = 2)
order by name;


select name,
       grade,
       weight
from student
where weight < (select min(weight)
                from student
                where grade = 2)
order by name;





-- �ǽ����� 11��-6
select name,
       position,
       to_char(pay, '$999,999,999') salary
from emp2
where pay > Any(select pay
             from emp2
             where position = 'Section head')
order by pay desc;


select name,
       position,
       to_char(pay, '$999,999,999') salary
from emp2
where pay > (select min(pay)
             from emp2
             where position = 'Section head')
order by pay desc;





-- �ǽ����� 11��-5
select empno,
       name,
       deptno
from emp2
where deptno in (select dcode
                  from dept2
                  where area = 'Pohang Main Office');





-- �ǽ����� 11��-4
select name,
       weight
from student
where weight > (select avg(weight)
                from student
                where deptno1 = 201);





-- �ǽ����� 11��-3
select p.name PROF_NAME,
       p.hiredate,
       d.dname DEPT_NAME
from professor p, department d
where p.deptno = d.deptno
      and
      p.hiredate > (select hiredate
                    from professor
                    where name = 'Meg Ryan');





-- �ǽ����� 11��-2
select s.name STUD_NAME,
       d.dname DEPT_NAME
from student s, department d
where s.deptno1 = (select deptno1
                   from student
                   where name = 'Anthony Hopkins')
      and s.deptno1 = d.deptno;





-- �ǽ����� 11��-1
select name,
       position,
       to_char(pay, '$999,999,999') salary
from emp2 a
where pay >= (select avg(pay)
              from emp2 b
              where a.position = b.position);


select distinct e1.name,
       e1.position,
       e1.pay salary
from(select position,
            avg(pay) over(partition by position) salary
     from emp2) e2, emp2 e1
where e1.pay >= e2.salary and e1.position = e2.position
order by e1.pay desc;





-- �ǽ����� 9��-7
select rownum "Ranking",
       name,
       pay
from (select name,
             pay
      from professor
      order by 2 desc)
where rownum between 1 and 5;


select p1.ranking,
       p2.name,
       p2.pay
from (select pay,
             rank() over(order by pay desc) ranking
      from professor) p1, professor p2
where ranking <= 5 and p1. pay = p2.pay
order by ranking;




-- �ǽ����� 9��-6
select s.grade,
       s.name,
       s.height,
       a.avg_height
from (select grade,
             avg(height) avg_height
      from student
      group by grade) a, student s
where a.grade = s.grade and s.height > a.avg_height
order by 1;