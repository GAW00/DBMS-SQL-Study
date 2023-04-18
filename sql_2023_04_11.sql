--�ǽ����� 2��-13
SELECT EMPNO
     , ENAME
     , SAL
     , comm
     , TO_CHAR((SAL * 12) + COMM, '999,999') "SALARY"
FROM EMP
WHERE ENAME = 'ALLEN';

--�ǽ����� 2��-12
SELECT EMPNO
     , ENAME
     , HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE, 'MM') IN (01, 02, 03);


--�ǽ����� 2��-11
SELECT STUDNO
     , NAME
     , BIRTHDAY
FROM STUDENT
WHERE TO_CHAR(BIRTHDAY, 'MM') = '01';

SELECT 2
--     , '2'
----'2'�� ���ڷ� ��ȯ �ؼ� ���
----�ڵ�(������) ��ȯ
--     , 2 + '2'
----����(�����) ��ȯ
--     , 2 + TO_NUMBER('2')
----���ڴ� �����ڵ�� ������� �ʰ� ����
--     , 2 + 'A'
     , SYSDATE
--4�ڸ� ����
     , TO_CHAR(SYSDATE, 'YYYY')
--������ 2�ڸ� ����
     , TO_CHAR(SYSDATE, 'YY')
--������ ���� �̸�����
     , TO_CHAR(SYSDATE, 'YEAR')
--�ش� ���� 2�ڸ� ���� ����(EX> 04)
     , TO_CHAR(SYSDATE, 'MM')
--�ش� �� �ڿ� '��'�� �پ� ����
     , TO_CHAR(SYSDATE, 'MON')
--�ش� ���� 2�ڸ� ���� ����
     , TO_CHAR(SYSDATE, 'DD')
--�ش� ���� ���Ϸ� ����
     , TO_CHAR(SYSDATE, 'DAY')
--�ش� ���� 2�ڸ� ���� ������, ���� ���° ������ ST, ND, RD, TH�� �ٿ� ����
     , TO_CHAR(SYSDATE - 10, 'DDTH')
--�ǹ����� ���� ���� ��¥ ǥ���
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD')
--�ǹ����� ���� ���� ��¥ ǥ���
--     , TO_CHAR(SYSDATE, '
FROM DUAL;

SELECT '14/09/30'
--��¥�� ����(�� ����)
     , MONTHS_BETWEEN('14/09/30', '14/08/31')
     , MONTHS_BETWEEN('14/08/31', '14/09/30')
--���� ��¥
     , SYSDATE
--���� ��¥ + 1����
     , ADD_MONTHS(SYSDATE, 1)
--���ƿ��� '��'����
     , NEXT_DAY(SYSDATE, '��')
--���ƿ��� 'ȭ'����
     , NEXT_DAY(SYSDATE, 'ȭ')
--�ش� ���� ������ ��¥
     , LAST_DAY(SYSDATE)
     , LAST_DAY('23/05/01')
FROM DUAL;

SELECT 987.654 "N"
--�ݿø�
     , ROUND(987.654, 2)
     , ROUND(987.654, 0)
     , ROUND(987.654, -1)
     , ROUND(987.654, -2)
--(�Ҽ��� OR �ð�)����
     , TRUNC(987.654, 2)
     , TRUNC(987.654, 0)
     , TRUNC(987.654, -1)
--������
     , MOD(121, 10)
--�ø�
     , CEIL(123.45)
--����(�ڹ� INT)
     , FLOOR(123.45)
--�¼�
     , POWER(2, 3)
FROM DUAL;

--�ǽ����� 2��-10
SELECT NAME
     , TEL
     , REPLACE(TEL, SUBSTR(TEL, INSTR(TEL, '-') + 1), '****') "REPLACE"
FROM STUDENT
WHERE DEPTNO1 = 101;

--�ǽ����� 2��-9
SELECT NAME
     , TEL
     , REPLACE(TEL, SUBSTR(TEL, INSTR(TEL, ')') + 1, 3), '***') "REPLACE"
FROM STUDENT
WHERE DEPTNO1 = 102;

--�ǽ����� 2��-8
SELECT NAME
     , JUMIN
     , REPLACE(JUMIN, SUBSTR(JUMIN, 7), '-/-/-/-') "REPALCE"
FROM STUDENT
WHERE DEPTNO1 = 101;


--�ǽ����� 2��-7
SELECT ENAME
     , REPLACE(ENAME, SUBSTR(ENAME, 2, 2), '--') "REPALCE"
FROM EMP
WHERE DEPTNO = 20;

SELECT ENAME
--���� ���� ���ʿ� C���� ������ ���� (CLARK -> LARK)
     , LTRIM(ENAME, 'C')
--���� ���� �����ʿ� R���� ������ ����(MILLER -> MILLE)
     , RTRIM(ENAME, 'R')
--1, 2��° ���ڸ� '**'�� ��ü ===> REPLACE(������ �Ӽ�, �����ų ��, ��ü�ϴ� ��)
     , REPLACE(ENAME, SUBSTR(ENAME, 1, 2), '**')
FROM EMP;

--�ǽ����� 2��-6
SELECT RPAD(ENAME, 9, SUBSTR('123456789', LENGTH(ENAME) + 1)) "RPAD"
FROM EMP
WHERE DEPTNO = 10;


SELECT ENAME
--10�ڸ� �������� ���ڸ��� �����ʿ� '~'�� ä��
     , RPAD(ENAME, 10, '~')
FROM EMP;

--�ǽ����� 2��-5
SELECT LPAD(ENAME, 9, '123456789') "LPAD"
FROM EMP
WHERE DEPTNO = 10;


SELECT NAME
     , ID
--10�ڸ� �������� ���ڸ��� ���ʿ� '*'�� ä��
     , LPAD(ID, 10, '*')
FROM STUDENT;

--�ǽ����� 2��-4
SELECT NAME
     , TEL
     , SUBSTR(TEL, 1, INSTR(TEL, ')', 1, 1) - 1) "AREA CODE"
FROM STUDENT
WHERE DEPTNO1 = 201;

--�ǽ����� 2��-3
SELECT NAME
     , TEL
     , INSTR(TEL, '8', 1, 2)
FROM STUDENT
WHERE DEPTNO1 = 101;

--�ǽ����� 2��-2
SELECT NAME
     , TEL
     , INSTR(TEL, ')', 1, 1)
FROM STUDENT
WHERE DEPTNO1 = 201;

SELECT 'A-B-C-D'
--'-' �� ã�µ� ù��° �����ؼ� -�� 3��°�� ���� ��ġ
            , INSTR('A-B-C-D','-',1,3) "INSTR"
--'-' �� ã�µ� �ڿ��� ù��° �����ؼ� -�� 3��°(�������� ����)�� ���� ��ġ
            , INSTR('A-B-C-D','-',-1,3) "INSTR"
--'-' �� ã�µ� �ڿ��� ����° �����ؼ� -�� 1��°(�������� ����)�� ���� ��ġ
            , INSTR('A-B-C-D','-',-3,1) "INSTR"
--'-' �� ã�µ� �ڿ��� ������° �����ؼ� -�� 1��°(�������� ����)�� ���� ��ġ
            , INSTR('A-B-C-D','-',-6,1) "INSTR"
--'-' �� ã�µ� �ڿ��� ������° �����ؼ� -�� 2��°(�������� ����)�� ���� ��ġ
            , INSTR('A-B-C-D','-',-6,2) "INSTR"
   FROM dual; 
   
SELECT 'A-B-C-D'
--- �� ã�µ� ù��° �����ؼ� -�� 3��°�� ���� ��ġ
            , INSTR('A-B-C-D','-',1,3) "INSTR"
--- �� ã�µ� ����° �����ؼ� -�� 1��°�� ���� ��ġ
            , INSTR('A-B-C-D','-',3,1) "INSTR"
--,1 �� ����
            , INSTR('A-B-C-D','-',3) "INSTR"
--,1,1 �� ����
            , INSTR('A-B-C-D','-') "INSTR"
   FROM dual; 
   
SELECT '������' "NAME"
            , SUBSTR('������',1,2) "NAME"
            , SUBSTRB('������',1,2) "NAME" --2����Ʈ�δ� �ѱ� ������
            , SUBSTRB('������',1,3) "NAME"
   FROM dual; 
   
SELECT '������' "NAME"
            , LENGTH('������') "NAME"
            , LENGTHB('������') "NAME" --�ѱ��� 3����Ʈ�� �ν�
   FROM dual; 
   
SELECT 1
            , ABS(-352) --���밪
            , SYSDATE --���ó�¥
--���̺� ��Ͽ��� ����(����Ŭ���� �ִ� �ӽ� ���̺�)
--���ϴ� ��/�Լ� ���
   FROM dual; 
   
SELECT name
            , LOWER(name) -- ��ü �ҹ���
            , UPPER(name) -- ��ü �빮��
   FROM professor;

SELECT JOB
--            , SUBSTR(JOB,3,2) --3��°���� 2��
--            , SUBSTR(JOB,6,2) --������ NULL(SQL DEVELOPER ����)
--            , SUBSTR(JOB,4) --4��°���� ������
            , SUBSTR(JOB,-3,2) --�ڿ��� 3��°���� 2��
            , SUBSTR(JOB,-5,3) --�ڿ��� 5��°���� 3��
   FROM EMP;
   
SELECT ENAME
            , JOB
            , CONCAT(ename, job) --|| �� ����
   FROM EMP;
   
SELECT ENAME
            , LENGTH(ENAME) --����
            , LENGTHB(ENAME) --����(�����ڴ� LENGTH�� ������)
   FROM EMP;
   
SELECT ENAME
            , DEPTNO
            , ENAME -- ENAME_1 (�̸� �ߺ��� �ڵ����� �÷��� ����)
            , INITCAP(ENAME) -- ù���ڸ� �빮��
   FROM EMP
 WHERE DEPTNO = 10;

SELECT * FROM EMP;
