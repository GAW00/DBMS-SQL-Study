select empno "���",
       ename "����",
       get_annual_sal(empno) "����",
       get_retire_money(empno) "������",
       get_hiredate(empno, 'YYYY-MM-DD') "�Ի���"
from emp;

-- get_hiredate(����� �Ի����ڸ� ���ϴ� function)
-- 1980-12-17
select get_hiredate(7369, 'YYYY-MM-DD') from dual;

-- get_retire_money(����� �����޿��� ���ϴ� function)
-- 33660
select get_retire_money(7369) from dual;

-- get_annual_sal �Լ�(���ϰ��� ���) tkdyd
-- ����� ���� : 9504
select get_annual_sal(7369) from dual;

-- procedure ����
exec adjust_sal('increase', 7369, 10);
exec adjust_sal('', 7369, 10);

-- 800->880->792
select * from emp;