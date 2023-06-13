--사원의 퇴직급여를 구하는 function
create or replace function get_retire_money
(v_empno number)
return number is v_sal number;
begin
    select round((sal+nvl(comm,0)) 
           * round(months_between(sysdate, hiredate),0) / 12, 0) into v_sal
    from emp
    where empno = v_empno;
    return v_sal;
end;