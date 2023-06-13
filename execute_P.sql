select empno "사번",
       ename "성명",
       get_annual_sal(empno) "연봉",
       get_retire_money(empno) "퇴직금",
       get_hiredate(empno, 'YYYY-MM-DD') "입사일"
from emp;

-- get_hiredate(사원의 입사일자를 구하는 function)
-- 1980-12-17
select get_hiredate(7369, 'YYYY-MM-DD') from dual;

-- get_retire_money(사원의 퇴직급여를 구하는 function)
-- 33660
select get_retire_money(7369) from dual;

-- get_annual_sal 함수(리턴값을 출력) tkdyd
-- 사원의 연봉 : 9504
select get_annual_sal(7369) from dual;

-- procedure 실행
exec adjust_sal('increase', 7369, 10);
exec adjust_sal('', 7369, 10);

-- 800->880->792
select * from emp;