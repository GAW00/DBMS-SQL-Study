-- ��� ������ ���� �ϴ� procedure
create or replace procedure remove_emp
(v_empno number)as
begin
    delete from emp
    where empno = v_empno;
end;