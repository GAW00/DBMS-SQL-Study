select job
     , substr(job, 3, 2) -- 3��°���� 2����
     , substr(job, 6, 2) -- ������ null(sql developer ����)
     , substr(job, 4)    -- 4��°���� ������
     , substr(job, -3, 2) -- �ڿ��� 3��°���� 2����
     , substr(job, -5, 3) -- �ڿ��� 5��°���� 3����
from emp;

select ename
     , job
     , concat(ename, job)--||�� ������ ����
from emp;

select '������' "NAME"
     , length(ME"
     , lengthb('������') '������') "NA"NAME" -- �ѱ��� 3����Ʈ�� �ν�
from dual;

SELECT 1
    , ABS(-352) -- ���밪
    , SYSDATE   -- ���ó�¥
-- ���̺� ��Ͽ��� ����(����Ŭ�� �ִ� �ӽ� ���̺�)
-- ���ϴ� ��/�Լ� ���
FROM dual;

select ename
     , length(ename) -- ����
     , lengthb(ename) -- ����(���� ���� -> ����� ���� ����)
from emp;

SELECT
    name
    , LOWER(name) --��ü �ҹ���
    , UPPER(name) --��ü �빮��
FROM
    professor;
    
    
select * from student;
select name, substr(jumin, 3, 2) �����, substr(jumin, 5, 2) ����� from student where deptno1 = 101;
select name, substr(jumin, 3, 4) BIRTHDAY from student where deptno1 = 101;

select '������' "NAME"
     , substr('������', 1, 2) "NAME"
     , substrb('������', 1, 2) "NAME" -- 2����Ʈ�δ� �ѱ� �� ����
     , substrb('������', 1, 3) "NAME" --
from dual;"

select 'A-B-C-D'
-- '-'�� ã�µ� '1'��°���ں��� ������ '3'��°�� ���� '-'�� ��ġ index
     , instr('A-B-C-D', '-', 1, 3) "INSTR"
     , instr('A-B-C-D', '-', 3, 1) "INSTR"
     , instr('A-B-C-D', '-', 3) "INSTR" -- (3, 1)
     , instr('A-B-C-D', '-') "INSTR"    -- (1, 1)
     , instr('A-B-C-D', '-', -1, 3) "INSTR"
     , instr('A-B-C-D', '-', -3, 1) "INSTR"
     , instr('A-B-C-D', '-', -6, 1) "INSTR"
     , instr('A-B-C-D', '-', -6, 2) "INSTR"
from dual;













