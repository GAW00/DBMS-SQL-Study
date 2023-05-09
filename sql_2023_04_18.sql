

--SELECT CASE A WHEN B THEN C : A == B �̸� C, A != B �̸� D, �Ӽ����� E
--       ELSE D
--       END E
SELECT CASE 'A' WHEN 'A' THEN '1'
       ELSE '2'
       END "AA"
       
     , CASE 'A' WHEN 'B' THEN '1'
       ELSE '2'
       END "BB"
       
     , CASE 'A' WHEN 'B' THEN '11' -- : 'A' == 'B' �̸� '11', 'A' == 'A' �� '12', �Ѵ� �ƴϸ� '13'
                WHEN 'A' THEN '12'
       ELSE '13'
       END "CC"
       
     , CASE 'A' WHEN 'B' THEN '11'
                WHEN 'C' THEN '12'
       ELSE '13'
       END "DD"
       
     , CASE WHEN 'A' = 'A' THEN '21' -- : 
            WHEN 'A' = 'B' THEN '22'
       ELSE '23'
       END "EE"
       
     , CASE WHEN 'A' = 'B' THEN '31'
            WHEN 'A' = 'A' THEN '32'
       ELSE '33'
       END "FF"
FROM DUAL;



SELECT 5 "D"
--DECODE(A, B, DECODE(C, D, E, F)) : 1)   A == B �̸�
--                                   1-1) C == D �̸� E
--                                   1-2) C != D �̸� F
--                                   2)   A != B �̸� NULL
     , DECODE('A', 'A', DECODE('B', 'B', '1', '2')) "D"
     , DECODE('A', 'A', DECODE('B', 'C', '1', '2')) "D"
     , DECODE('A', 'Z', DECODE('B', 'C', '1', '2')) "D"
     , DECODE('A', 'Z', DECODE('B', 'C', '1', '2'), '9') "D"     
FROM DUAL;



SELECT 5 "D"
--DECODE(A, B, DECODE(C, D, E, F)) : 1)   A == B �̸�
--                                   1-1) C == D �̸� E
--                                   1-2) C != D �̸� F
--                                   2)   A != B �̸� NULL
     , DECODE('A', 'A', DECODE('B', 'B', '1', '2')) "D"
     , DECODE('A', 'A', DECODE('B', 'C', '1', '2')) "D"
FROM DUAL;



SELECT 5 "D"
--DECODE(A, B, C, D, E, F) : A == B �̸� C
--                           A != B �̰� A == D �̸� E
--                           A != B �̰� A != D �̸� F
     , DECODE('A', 'A', '1', 'C', '2', '3') "D"
     , DECODE('A', 'B', '1', 'A', '2', '3') "D"
     , DECODE('A', 'B', '1', 'C', '2', '3') "D"
FROM DUAL;



--DECODE(A, B, C) : A == B�̸� C, A != B�̸� NULL
SELECT 5 "D"
--�ǹ����� ���� ���
     , DECODE('A', 'A', '1')
     , DECODE('A', 'B', '1')
--DECODE(A, B, C, D) : A == B �̸� C �̰� A != B �̸� D
     , DECODE('A', 'A', '1', '2') "D"
     , DECODE('A', 'B', '1', '2') "D"     
FROM DUAL;



--NVL2(�Ӽ�, �Ӽ��� NULL�϶� ��ȯ ��, �Ӽ��� NULL�� �ƴҶ� ��ȯ ��)
SELECT ENAME
     , COMM
     , SAL
--   NULL�� �ƴϸ� SAL + COMM, COMM �� NULL�̸� SAL * 0
     , NVL2(COMM, SAL + COMM, SAL * 0) "NVL2"
FROM EMP;



--NVL(�Ӽ�, �Ӽ��� NULL�϶� ��ȯ ��)
SELECT ENAME
     , COMM
--   COMM �� NULL �̸� 0
     , NVL(COMM, 0)
--   COMM �� NULL �̸� 100
     , NVL(COMM, 100)
FROM EMP;



--TO_NUMBER(���� ���ڿ�), TO_DATE(��¥ ���ڿ�)
SELECT 5
     , '5'
--   ���ڸ� ���ڷ� ����� ��ȯ
     , TO_NUMBER('5')
     , '2014-05-31'
--   ���ڸ� ��¥�� ����� ��ȯ
     , TO_DATE('2014-05-31')
FROM DUAL;



--------------------------------------------------------------------
--------------------------------------------------------------------



SELECT * FROM PROFESSOR;
SELECT * FROM EMP;
SELECT * FROM CUSTOMER;
SELECT * FROM DEPT;
SELECT * FROM STUDENT;



--�ǽ����� 2��-27
SELECT NAME
     , SUBSTR(JUMIN, 3, 2) "MONTH"
     , CASE WHEN SUBSTR(JUMIN, 3, 2) BETWEEN '01' AND '03' THEN '1/4'
            WHEN SUBSTR(JUMIN, 3, 2) BETWEEN '04' AND '06' THEN '2/4'
            WHEN SUBSTR(JUMIN, 3, 2) BETWEEN '07' AND '09' THEN '3/4'
            WHEN SUBSTR(JUMIN, 3, 2) BETWEEN '10' AND '12' THEN '4/4'
      END "QUARTER"
FROM STUDENT;


--�ǽ����� 2��-26
SELECT NAME
     , TEL
     , CASE SUBSTR(TEL, 1, INSTR(TEL, ')') - 1) WHEN '02' THEN 'SEOUL'
                                                WHEN '031' THEN 'GYEONGGI'
                                                WHEN '051' THEN 'BUSAN'
                                                WHEN '052' THEN 'ULSAN'
                                                WHEN '055' THEN 'GYEONGNAM'
       ELSE 'ETC'
       END "LOC"
FROM STUDENT
WHERE DEPTNO1 = 201;



--�ǽ����� 2��-25
SELECT NAME
     , TEL
     , DECODE(SUBSTR(TEL, 1, INSTR(TEL, ')') - 1), '02', 'SEOUL'
                                                 , '031', 'GYEONGGI'
                                                 , '051', 'BUSAN'
                                                 , '052', 'ULSAN'
                                                 , '055', 'GYEONGNAM')
FROM STUDENT
WHERE DEPTNO1 = 101;



--�ǽ����� 2��-24
SELECT NAME
     , JUMIN
     , DECODE(SUBSTR(JUMIN, 7, 1), '1', 'MAN'
                                 , '2', 'WOMAN') "GENDER"
FROM STUDENT
WHERE DEPTNO1 = 101;



---�ǽ����� 2��-23
SELECT DEPTNO
     , NAME
     , DECODE(DEPTNO, 101, DECODE(NAME, 'Audie Murphy', 'BEST!', 'GOOD!'), 'N/A') "ETC"
FROM PROFESSOR;



--�ǽ����� 2��-22
SELECT DEPTNO
     , NAME
     , DECODE(DEPTNO, 101, DECODE(NAME, 'Audie Murphy', 'BEST!', 'GOOD!')) "ETC"
FROM PROFESSOR;



--�ǽ����� 2��-21
SELECT DEPTNO
     , NAME
     , DECODE(DEPTNO, 101, DECODE(NAME, 'Audie Murphy', 'BEST!')) "ETC"
FROM PROFESSOR;



--�ǽ����� 2��-20
SELECT DEPTNO
     , NAME
     , DECODE(DEPTNO, 101, 'Computer Engineering'
                    , 102, 'Multimedia Engineering'
                    , 103, 'Software Engineering'
                    , 'ETC') "DNAME"
FROM PROFESSOR;



--�ǽ����� 2��-19
SELECT DEPTNO
     , NAME
     , DECODE(DEPTNO, 101, 'Computer Engineering', 'ETC') "DNAME"
FROM PROFESSOR;




--�ǽ����� 2��-18
SELECT DEPTNO
     , NAME
     , DECODE(DEPTNO, 101, 'Computer Engineering') "DNAME"
FROM PROFESSOR;



--�ǽ����� 2��-17
SELECT EMPNO
     , ENAME
     , COMM
     , NVL2(COMM, 'Exist', 'NULL') "NVL2"
FROM EMP
WHERE DEPTNO = 30;



--�ǽ����� 2��-16
SELECT PROFNO
     , NAME
     , PAY
     , NVL(BONUS, 0)
     , TO_CHAR(PAY * 12 + NVL(BONUS, 0), '999,999') "TOTAL"
FROM PROFESSOR
WHERE DEPTNO = 201;



--�ǽ����� 2��-15
SELECT EMPNO
     , ENAME
     , TO_CHAR(HIREDATE, 'yyyy-MM-dd') "HIREDATE"
     , TO_CHAR(SAL * 12 + COMM, '$99,999') "SAL"
     , TO_CHAR((SAL * 12 + COMM) * 1.15, '$99,999') "15% UP"
FROM EMP
WHERE COMM IS NOT NULL;
     


UPDATE EMP SET COMM = 0 WHERE ENAME = 'TURNER';

--�ǽ����� 2��-14
SELECT NAME
     , PAY
     , BONUS
     , TO_CHAR((PAY * 12) + BONUS, '999,999') "TOTAL"
FROM PROFESSOR
WHERE DEPTNO = 201;



--�ǽ����� 2B-9
SELECT NAME
     , HPAGE
     , REPLACE(HPAGE, SUBSTR(HPAGE, INSTR(HPAGE, '.', 1, 2) + 1, 2), 'OK') "OK"
FROM PROFESSOR
WHERE HPAGE IS NOT NULL;



--�ǽ����� 2B-8
SELECT GNAME
     , JUMIN
     , REPLACE(GNAME, SUBSTR(GNAME, 4, 3), '337') "337"
FROM CUSTOMER
WHERE SUBSTR(JUMIN, 1, 2) < 77;



--�ǽ����� 2B-7
SELECT DNAME
     , LPAD(DNAME, 9, 123456789) "LPAD"
     , LOC
     , RPAD(LOC, 9, SUBSTR('123456789', LENGTH(LOC) + 1)) "RPAD"
FROM DEPT;




--�ǽ����� 2B-6
SELECT NAME
     , EMAIL
     , SUBSTR(EMAIL, INSTR(EMAIL, '@') + 1, INSTR(EMAIL, '.') - INSTR(EMAIL, '@') - 1) "DOMAIN"
FROM PROFESSOR
WHERE EMAIL IS NOT NULL;



--�ǽ����� 2B-5
SELECT NAME
     , EMAIL
     , INSTR(EMAIL, '@') "@"
FROM PROFESSOR
WHERE EMAIL IS NOT NULL;



--�ǽ����� 2B-4
SELECT GNAME
     , SUBSTR(JUMIN, 1, 2) "YEAR"
     , POINT
FROM CUSTOMER
WHERE POINT >= 100000
ORDER BY POINT DESC;



--�ǽ����� 2B-3
SELECT UPPER(NAME) "NAME"
     , LOWER(ID) "ID"
     , INITCAP(POSITION) "POSITION"
     , LENGTH(EMAIL) "EMAIL_SIZE"
FROM PROFESSOR;



--�ǽ����� 2B-2
SELECT PROFNO
     , NAME
     , SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1) "EMAIL_ID"
FROM PROFESSOR
WHERE EMAIL IS NOT NULL;



--�ǽ����� 2B-1
SELECT PROFNO
     , NAME
     , HPAGE
     , INSTR(HPAGE, '.', 1, 2) "HTTP"
FROM PROFESSOR
WHERE HPAGE IS NOT NULL;



--�ǽ����� 2A-7
SELECT ENAME
     , SAL
     , COMM
FROM EMP
WHERE (SAL >= 1000 AND COMM IS NOT NULL) OR SAL >= 3000;




--�ǽ����� 2A-6
SELECT ENAME
     , DEPTNO
     , SAL
     , SAL * 12
FROM EMP
ORDER BY DEPTNO DESC, SAL * 12;



--�ǽ����� 2A-5
SELECT ENAME
     , JOB
     , DEPTNO
FROM EMP
WHERE COMM IS NULL;



--�ǽ����� 2A-4
SELECT ENAME
     , JOB
     , DEPTNO
FROM EMP
WHERE ENAME LIKE 'JA%';



--�ǽ����� 2A-3
SELECT ENAME, JOB, SAL
FROM EMP
--WHERE SAL BETWEEN 2000 AND 3000;
WHERE SAL >= 2000 AND SAL <= 3000;



--�ǽ����� 2A-2
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20 AND SAL >= 1000;


--�ǽ�����2A-1
SELECT ENAME
     , JOB
     , SAL    
FROM EMP
WHERE SAL > 2000
ORDER BY SAL DESC;


--�ǽ����� 1B-8
SELECT NAME
     , PAY
     , PAY * 12 "Y_PAY"
FROM PROFESSOR;


--�ǽ����� 1B-7
SELECT NAME || '������ �̸�����' ||
       EMAIL || '�̰�, Ȩ�������� ' ||
       HPAGE || '�̴�'
       "PARAGRAPH"
FROM PROFESSOR;


--�ǽ����� 1B-6
SELECT PROFNO "������ȣ"
     , NAME "������"
     ,POSITION "��ġ"
     , HPAGE "Ȩ������"
FROM PROFESSOR;


--�ǽ����� 1B-5
SELECT DISTINCT DEPTNO
FROM PROFESSOR;


--�ǽ����� 1B-4
SELECT NAME
     , ID
     , EMAIL
FROM PROFESSOR;


--�ǽ����� 1B-3
SELECT *
FROM PROFESSOR;


--�ǽ����� 1B-2
DESC PROFESSOR;


--�ǽ����� 1B-1
SELECT *
FROM TAB;

select * from all_tables;
select * from user_tables;