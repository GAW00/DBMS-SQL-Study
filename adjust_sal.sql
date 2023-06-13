--사원 급여 조정 procedure 
create or replace procedure adjust_sal
--변수와 타입
(v_flag varchar2, v_empno number, v_pct number) as 
begin
    if v_flag = 'increase' then
        update emp set sal = sal+(sal * (v_pct/100))
            where empno = v_empno;
        else 
            update emp set sal = sal-(sal * (v_pct/100))
            where empno = v_empno;
    end if;
end;