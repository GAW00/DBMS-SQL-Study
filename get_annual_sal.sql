-- ����� ������ ���ϴ� function
create or replace function get_annual_sal
-- ������� Ÿ��
(v_empno number)
-- ���� �������� V_SAL �̰� Ÿ���� NUMBER, �ʱⰪ�� 0(���� ����)
--return number is v_sal number := 0;
return number is v_sal number;
begin
    select (sal + nvl(comm, 0)) * 12 into v_sal
    from emp
    where empno = v_empno;
    return v_sal;
end;