SELECT DEPTNO
     , ROUND(AVG(NVL(SAL,0)), 2) AVG
FROM EMP
GROUP BY DEPTNO
HAVING AVG(NVL(SAL, 0)) >= 2000; -- GROUP BY ���� �������� WHERE �ƴ� HAVING


--�μ���, �������� ��� �޿�
SELECT DEPTNO NO
     , JOB J
     , AVG(SAL)
     , AVG(SAL) AVG_SAL
FROM EMP
GROUP BY DEPTNO, J --GROUP BY ������ ��Ī(ALIAS) ��� x ���� �߻�
ORDER BY DEPTNO;


--�μ���, �������� ��� �޿�
SELECT DEPTNO NO
     , JOB
     , AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB --GROUP�Լ��� �ƴ� �Ӽ����� GROUP BY�� ������� �Ѵ�
ORDER BY DEPTNO;


SELECT DEPTNO
     , AVG(NVL(SAL, 0)) "AVG" --�μ��� �׷��� SAL���
FROM EMP
GROUP BY DEPTNO; --�μ��� �׷�


SELECT AVG(NVL(SAL, 0)) "AVG"
FROM EMP;


--�׷� �Լ��� �ƴϱ� ������ ����
SELECT DEPTNO
     , AVG(NVL(SAL, 0)) "AVG"
FROM EMP;




-- �� Ʃ���� ��
SELECT COUNT(*) 
--     , COUNT(EMPNO)
--     , COUNT(COMM)  -- NULL ���� Ʃ�� ��
--     , SUM(COMM)    -- NULL ���� COMM �Ӽ� ���� ��
--     , AVG(COMM)
--     , AVG(NVL(COMM, 0)) -- NULL �� Ʃ�õ� �и�� ����
     , MAX(SAL)
     , MIN(SAL)
     , MAX(HIREDATE) -- ���� ���� ��¥
     , MIN(HIREDATE) -- ���� ���� ��¥
     , STDDEV(SAL) "STD"   -- ǥ������
     , VARIANCE(SAL) "VAL" -- �л�
FROM EMP;

SELECT *
FROM EMP;



--*.���Խ�(ǥ����, Regular Expression)
--REGEXP_LIKE
--REGEXP_REPLACE
--REGEXP_COUNT(11g~) : Ư�� ������ ������ ���� �Լ�

SELECT TEXT
--a�� ����
--     , REGEXP_COUNT(text, 'a') "C"
     
     
--bc�� ����
--     , REGEXP_COUNT(text, 'bc') "C"
     
     
--12�� ����
--     , REGEXP_COUNT(text, '12') "C"
     

--c�� ����
--     , REGEXP_COUNT(text, 'c') "C"
     
     
--5��° �ڸ����� ������ c�� ����
--     , REGEXP_COUNT(text, 'c', 5) "C"


--ù��° �ڸ����� ������ c�� ����
--     , REGEXP_COUNT(text, 'c', 1) "C"
     
     
--ù��° �ڸ����� ������ c �Ǵ� C�� ����(i => ��ҹ��� ����x)
--     , REGEXP_COUNT(text, 'c', 1, 'i') "C"
     
     
-- . => ��� ����
--     , REGEXP_COUNT(text, '.') "C" --���ڿ� TEXT�� ���̿� ����
--     , LENGTH(TEXT)


-- '.'���ڿ��� ����
--     , REGEXP_COUNT(text, '\.') "C"
     

-- 'aa'���ڿ��� ����(3�� ����)
     , REGEXP_COUNT(text, 'aa') "C"
     , REGEXP_COUNT(text, '(a{2})') "C"
     , REGEXP_COUNT(text, '(a)(a)') "C"
FROM T_REG;



--'(){2,}' => �̻����� ó�� ���� ��
SELECT REGEXP_REPLACE('aaa bb', '( ){2,}', '*') "���� 1"
     , REGEXP_REPLACE('aaa  bb', '( ){2,}', '*') "���� 2"
     , REGEXP_REPLACE('aaa   bb', '( ){2,}', '*') "���� 3"
     , REGEXP_REPLACE('aaa   bb', '( ){2}', '*') "���� 3"
FROM DUAL;



--a, b ���̿� ���� 1��
--b, c ���̿� ���� 2��
--c, d ���̿� ���� 3��
--()���� 1��
--''���� 0��
-- REGEXP_REPLACE(A, B, C) : A���� B�� �ش��ϴ� ���ڿ��� C�� �ٲ۴�
-- => 'aaa b  c   d'���� ���� ��ĭ ¥�� ���ڿ��� ''(�������)���� �ٲ۴�
SELECT REGEXP_REPLACE('aaa bb  c   d', '( ){1}','') "blank"


-- => 'aaa b  c   d'���� ���� ��ĭ ¥�� ���ڿ��� ''(�������)���� �ٲ۴�
     , REGEXP_REPLACE('aaa bb  c   d', '( ){2}','') "blank"
     
     
-- => 'aaa b  c   d'���� ���� ��ĭ ¥�� ���ڿ��� ''(�������)���� �ٲ۴�
     , REGEXP_REPLACE('aaa bb  c   d', '( ){3}','') "blank"
     
     
-- => 'aaa b  c   d'���� ���� ��ĭ �̻��� ���ڿ��� ''(�������)���� �ٲ۴�
     , REGEXP_REPLACE('aaa bb  c   d', '( ){2,}','') "blank"
     
     
-- => 'aaa b  c   d'���� ���� ��ĭ �̻��� ���ڿ��� ''(�������)���� �ٲ۴�
     , REGEXP_REPLACE('aaa bb  c   d', '( ){3,}','') "blank"
     

-- => 'aaa b  c   d'���� ���� ��ĭ �̻��� ���ڿ��� ''(�������)���� �ٲ۴� (ó���� ����)
     , REGEXP_REPLACE('aaa bb  c   d', '( ){1,}','') "blank"
FROM DUAL;



SELECT TEXT
-- ���ڸ� '*'�� ����
--     , REGEXP_REPLACE(TEXT, '[0-9]', '*')


-- ���ڸ� '*'�� ����
     , REGEXP_REPLACE(TEXT, '[[:digit:]]', '*')
FROM T_REG;


SELECT *
FROM T_REG
--�ҹ��ڸ� �����ϴ� Ʃ��
--WHERE REGEXP_LIKE(TEXT, '[a-z]');


--�빮�ڸ� �����ϴ� Ʃ��
--WHERE REGEXP_LIKE(TEXT, '[A-Z]');


--��/�ҹ��ڸ� �����ϴ� Ʃ��
--WHERE REGEXP_LIKE(TEXT, '[a-zA-Z]');


--�ҹ��ڷ� �����ϰ� ���� �ִ� Ʃ��
--WHERE REGEXP_LIKE(TEXT, '[a-z] ');
-- abc 123 : ���� 1��
-- abc  123 : ���� 2��


--�ҹ��� ������ ���� �ִ� Ʃ��
--WHERE REGEXP_LIKE(TEXT, '[a-z][0-9]');
-- a1b2c3
-- aabbcc123


--�ҹ��� ������ ���� 1�� ���� ���� �ִ� Ʃ��
--WHERE REGEXP_LIKE(TEXT, '[a-z] [0-9]');
-- abc 123


--�ҹ��� ������ ���� 2�� ���� ���� �ִ� Ʃ��
--WHERE REGEXP_LIKE(TEXT, '[a-z]  [0-9]');
-- abc  123


--�ҹ��� ������ ���� 3�� ���� ���� �ִ� Ʃ��
--WHERE REGEXP_LIKE(TEXT, '[a-z]   [0-9]');
--����


--������ �ִ� ��� Ʃ��
--WHERE REGEXP_LIKE(TEXT, '[[:space:]]');


--space�� �빮�ڸ� ����
--WHERE REGEXP_LIKE(TEXT, '[[:SPACE:]]');


--�ҹ��� 1�� �̻�
--WHERE REGEXP_LIKE(TEXT, '[a-z]{1}');


--�ҹ��� 2�� �̻�
--WHERE REGEXP_LIKE(TEXT, '[a-z]{2}');


--�ҹ��� 3�� �̻�
--WHERE REGEXP_LIKE(TEXT, '[a-z]{3}');


--�ҹ��� 6�� �̻�
--WHERE REGEXP_LIKE(TEXT, '[a-z]{6}');


--���� 3�� �̻�
--WHERE REGEXP_LIKE(TEXT, '[0-9]{3}');


--���� 6�� �̻�
--WHERE REGEXP_LIKE(TEXT, '[0-9]{6}');


--�ҹ��ڿ� ���� 1�� �̻�
--WHERE REGEXP_LIKE(TEXT, '[a-z][0-9]{1}');


--�ҹ��ڿ� ���� 3�� �̻�
--WHERE REGEXP_LIKE(TEXT, '[a-z][0-9]{3}');


--�빮�� or �ҹ��ڷ� ���� 
--WHERE REGEXP_LIKE(TEXT, '^[A-Za-z]');


--���� or �빮�ڷ� ���� 
--WHERE REGEXP_LIKE(TEXT, '^[0-9A-Z]');


--�ҹ��ڷ� ������ Ʃ��
--WHERE REGEXP_LIKE(TEXT, '[a-z]$');


--�빮�ڷ� ������ Ʃ��
--WHERE REGEXP_LIKE(TEXT, '[A-Z]$');


--���ڷ� ������ Ʃ��
--WHERE REGEXP_LIKE(TEXT, '[0-9]$');


--�ҹ��ڷ� �������� �ʴ� Ʃ��
--WHERE REGEXP_LIKE(TEXT, '^[^a-z]');


--���ڷ� �������� �ʴ� Ʃ��
--WHERE REGEXP_LIKE(TEXT, '^[^0-9]');


--�ҹ��� or ���ڷ� �������� �ʴ� Ʃ��
--WHERE REGEXP_LIKE(TEXT, '^[^a-z0-9]');


--�ҹ��ڷθ� ������ Ʃ�� ����
--WHERE REGEXP_LIKE(TEXT, '[^a-z]');


--�ҹ��ڰ� 1���� ���Ե� Ʃ�� ����
--WHERE NOT REGEXP_LIKE(TEXT, '[a-z]');


--���ĺ��� 1���� ���Ե� Ʃ�� ����
--WHERE NOT REGEXP_LIKE(TEXT, '[a-zA-Z]');


--���ڰ� 1���� ���Ե� Ʃ�� ����
WHERE NOT REGEXP_LIKE(TEXT, '[0-9]');




SELECT NAME
     , ID
FROM STUDENT
--'M'���� �����ϰ� �ڿ� 'a' or 'o' �� ����
WHERE REGEXP_LIKE(ID, '^M(a|o)');






--------------------------------------------------------------------------------
--�ǽ����� 3��-0
SELECT DEPTNO
     , ROUND(AVG(SAL), 2) AVG
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000;



--�ǽ����� 2��-29
SELECT NAME
     , TEL
FROM STUDENT
--WHERE NOT REGEXP_LIKE(SUBSTR(TEL, 1, INSTR(TEL, ')') - 1), '[0-9]{3}')
--      AND REGEXP_LIKE(SUBSTR(TEL, INSTR(TEL, ')') + 1, INSTR(TEL, '-') - 1), '[0-9]{4}');
WHERE REGEXP_LIKE(TEL, '^[0-9]{2}\)[0-9]{4}');



--�ǽ����� NVL-1
SELECT ENAME
     , SAL
     , NVL(COMM, 0) "COMM"
     , TO_CHAR(SAL * 12 + NVL(COMM, 0), '999,999') "TOTAL"
FROM EMP
WHERE DEPTNO = 30;



--�ǽ����� ����ȯ-2
SELECT NAME
     , TO_CHAR(HIREDATE, 'YYYY-MM-DD') "HIREDATE"
     , PAY
     , BONUS
     , TO_CHAR(PAY * 12 + BONUS, '$999,999') "TOTAL"
     , TO_CHAR((PAY * 12 + BONUS) * 0.9, '$999,999') "10%DOWN"
     , TO_CHAR((PAY * 12 + BONUS) * 0.9 * 1200, '9,999,999') "WON"
FROM PROFESSOR
WHERE BONUS IS NOT NULL;




--�ǽ����� ����ȯ-1
SELECT NAME
     , HIREDATE
FROM PROFESSOR
WHERE TO_CHAR(HIREDATE,'MM') IN ('03', '08', '10');




--�ǽ����� REPLACE-2
SELECT ENAME
     , JOB
     , REPLACE(JOB, SUBSTR(JOB, 3, 1), '?') "JOB?"
FROM EMP
WHERE DEPTNO = 20;




--�ǽ����� SUBSTR, INSTR-2
SELECT NAME
     , TEL
     , SUBSTR(TEL, INSTR(TEL, ')') + 1, INSTR(TEL, '-') - INSTR(TEL, ')') - 1) "GUK_NO"
FROM STUDENT
WHERE DEPTNO1 = 101;




--�ǽ����� INSTR-2
SELECT NAME
     , GRADE
     , TEL
     , INSTR(TEL, 6) "6"
FROM STUDENT
WHERE GRADE IN (2, 4);




--�ǽ����� SUBSTR-2
SELECT NAME
     , HEIGHT
     , SUBSTR(JUMIN, 5, 2) "DAY"
FROM STUDENT
WHERE HEIGHT >= 180;




--�ǽ����� CASE-1
SELECT NAME
     , PAY
     , CASE WHEN PAY BETWEEN 1 AND 300 THEN 'GRADE 1'
            WHEN PAY BETWEEN 301 AND 400 THEN 'GRADE 2'
            WHEN PAY BETWEEN 401 AND 500 THEN 'GRADE 3'
            WHEN PAY > 500 THEN 'GRADE 4'
            END "GRADE"
FROM PROFESSOR
ORDER BY PAY DESC;




--�ǽ����� 2��-28
SELECT EMPNO
     , ENAME
     , SAL
     , CASE WHEN SAL BETWEEN 1 AND 1000 THEN 'LEVEL 1'
                               WHEN SAL BETWEEN 1001 AND 2000 THEN 'LEVEL 2'
                               WHEN SAL BETWEEN 2001 AND 3000 THEN 'LEVEL 3'
                               WHEN SAL BETWEEN 3001 AND 4000 THEN 'LEVEL 4'
                               WHEN SAL >= 5000 THEN 'LEVEL 5'
                               END "LEVEL"
FROM EMP
ORDER BY SAL DESC;



--�ǽ����� DECODE-1
SELECT NAME, TEL, REPLACE(TEL, SUBSTR(TEL, 1, INSTR(TEL, '-') -1), RPAD(SUBSTR(TEL, 1, INSTR(TEL, ')')), 7, '*')) "REPLACE"
FROM EMP2;

SELECT NAME, TEL, DECODE(INSTR(TEL, '-') - INSTR(TEL, ')'), 5, (REPLACE(TEL, SUBSTR(TEL, INSTR(TEL, ')') + 1, 4), '****')), (REPLACE(TEL, SUBSTR(TEL, INSTR(TEL, ')') + 1, 3), '***'))) "REPLACE"
FROM EMP2;



--�ǽ����� 4-6
SELECT NAME, PAY, BONUS
FROM PROFESSOR
WHERE (PAY >= 300 AND BONUS IS NULL) OR PAY >= 500;



--�ǽ����� 4-5
SELECT PROFNO, NAME, PAY, BONUS, PAY * 12 + BONUS "TOTAL", DEPTNO
FROM PROFESSOR
WHERE BONUS IS NOT NULL
ORDER BY DEPTNO DESC, TOTAL;



--�ǽ����� 4-4
SELECT NAME, ID, POSITION
FROM PROFESSOR
WHERE ID LIKE '%er';



--�ǽ����� 4-3
SELECT NAME, PAY, HIREDATE
FROM PROFESSOR
WHERE PAY >= 300 AND PAY <= 500;
--WHERE PAY BETWEEN 300 AND 500;



--�ǽ����� 4-2
SELECT NAME, ID, HPAGE
FROM PROFESSOR
WHERE DEPTNO = '102' AND HPAGE IS NOT NULL;



--�ǽ����� 4-1
SELECT NAME, PAY, BONUS
FROM PROFESSOR
WHERE BONUS > 80
ORDER BY PAY DESC;