select * from emp;
-- 792->712.8
exec emp_mgmt.adjust_sal('D', 7369, 10);

select emp_mgmt.get_hiredate(7369, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;