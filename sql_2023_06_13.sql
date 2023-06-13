



------------------------------------------------




select * from emp;
select * from emp2;
select * from student;
-- 실습문제 A-4
select grade,
       deptno1,
       count(*),
       sum(height) "TOTAL_HEIGHT",
       sum(weight) "TOTAL_WEIGHT"
from student
group by grouping sets(grade, deptno1)
order by grade, deptno1;




-- 실습문제 A-3
select deptno,
       null job,
       round(avg(sal), 1) "AVG_SAL",
       count(*) "CNT_EMP"
from emp
group by deptno
union
select null deptno,
       job,
       round(avg(sal), 1) "AVG_SAL",
       count(*) "CNT_EMP"
from emp
group by job;


-- grouping sets : 집계함수
select deptno,job, round(avg(sal),1) AVG_SAL,count(*) CNT_EMP
from emp
group by grouping sets(deptno, job)
order by deptno;





-- 실습문제 A-2
select deptno,
       job,
       round(avg(sal), 1) "AVG_SAL",
       count(*) "CNT_EMP"
from emp
group by rollup(deptno, job)
union
select null deptno,
       job,
       round(avg(sal), 1) "AVG_SAL",
       count(*) "CNT_EMP"
from emp
group by rollup(job);


select deptno,job, round(avg(sal),1) AVG_SAL,count(*) CNT_EMP
from emp
group by deptno, job
union all
select deptno,null job, round(avg(sal),1) AVG_SAL,count(*) CNT_EMP
from emp
group by deptno
union all
select null deptno, job, round(avg(sal), 1) AVG_SAL, count(*) CNT_EMP
from emp
group by job
union all
select null deptno,null job, round(avg(sal),1)AVG_SAL,count(*) CNT_EMP
from emp
order by deptno, job;

-- cube : 집계함수
select deptno,job, round(avg(sal),1) AVG_SAL,count(*) CNT_EMP
from emp
group by cube(deptno, job)
order by deptno;