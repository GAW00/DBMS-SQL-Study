-- 사원의 연봉을 구하는 function
create or replace function get_annual_sal
-- 변수명과 타입
(v_empno number)
-- 리턴 변수명은 V_SAL 이고 타입은 NUMBER, 초기값은 0(생략 가능)
--return number is v_sal number := 0;
return number is v_sal number;
begin
    select (sal + nvl(comm, 0)) * 12 into v_sal
    from emp
    where empno = v_empno;
    return v_sal;
end;