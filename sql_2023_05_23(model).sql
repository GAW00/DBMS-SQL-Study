-- ANSI(American National Standards Institute) JOIN(������ ���̽��� Ư���� Ÿ�� ���� : ����Ŭ�� �ƴϾ ��� ����)
SELECT A.EMPNO
     , A.ENAME
     , B.DNAME
FROM EMP A JOIN DEPT B
ON A.DEPTNO = B.DEPTNO; -- A.DEPTNO : FK, B.DEPTNO : PK



-- ORACLE JOIN
-- � ����(EQUI(valent) JOIN)
-- 12�� : ����� �� �μ��� �����ؼ� ��ȸ��
SELECT A.EMPNO
     , A.ENAME
     , B.DNAME
FROM EMP A, DEPT B1
-- ����(JOIN) ���� : �����ϴ� ���̺� �� �� ���� PK���� �Ѵ�
WHERE A.DEPTNO = B.DEPTNO; -- A.DEPTNO : FK, B.DEPTNO : PK


-- 48�� �ߺ� ������ ��
SELECT A.EMPNO
     , A.ENAME
     , B.DNAME
FROM EMP A
   , DEPT B;



-- ���� �Ӽ����� ��Ī���� ���̺� �����ؼ� ���� ����
-- DEPTNO(EMP), DEPTNO_1(DEPT)
SELECT *
FROM EMP A, DEPT B
--ORDER BY A.DEPTNO; -- EMP.DEPTNO
ORDER BY B.DEPTNO; -- DEPT.DEPTNO1



-- īƼ�� ���δ�Ʈ(CARTESIAN PRODUCT)
-- 48��(4 * 12) ������ �̸��� ��� �ߺ�
SELECT *
FROM  EMP
    , DEPT
ORDER BY ENAME;

-- 4
SELECT COUNT(*) FROM DEPT;

-- 12
SELECT COUNT(*) FROM EMP;



-- ERD(ENTITY RELATIONSHIP DIAGRAM) : ��ü ���赵(�𵨸�) -> ����
-- ����(�� : �ѱ۷� �ۼ�/���� : �������� �ۼ�) -> ���̺��� ������(��ƼƼ�� ����)
-- �ǹ������� ERwin ���� ���, ��������� ����Ŭ ������ �𵨷�(Ư�� ���� �̻� ���� SQL Developer �� ����)

-- ���赵�� ������ �ǹ��� �����(ddl -> table)
-- �ݴ�� �۾� => �ǹ��� ������ ���赵�� �����(table -> ddl)



-------------------------------------------------



SELECT * FROM GIFT;
SELECT * FROM CUSTOMER;
SELECT * FROM STUDENT;
SELECT * FROM PROFESSOR;
SELECT * FROM DEPARTMENT;
-- �ǽ����� 8��-4
-- �� ����(NON-EQUI JOIN) => ����(BETWEEN ~, <, >, <=, >=)
SELECT C.GNAME CUST_NAME
     , TO_CHAR(C.POINT, '999,999') POINT
     , G.GNAME GIFT_NAME
FROM CUSTOMER C , GIFT G
WHERE C.POINT >= G.G_START AND C.POINT <= G.G_END;
--WHERE C.POINT BETWEEN G.G_START AND G.G_END;

SELECT C.GNAME CUST_NAME
     , TO_CHAR(C.POINT, '999,999') POINT
     , G.GNAME GIFT_NAME
FROM CUSTOMER C JOIN GIFT G
ON C.POINT >= G.G_START AND C.POINT <= G.G_END;
--ON C.POINT BETWEEN G.G_START AND G.G_END;





-- �ǽ����� 8��-3
SELECT S.NAME STU_NAME
     , P.NAME PROF_NAME
  FROM STUDENT S
     , PROFESSOR P
 WHERE S.PROFNO = P.PROFNO
   AND S.DEPTNO1 = '101';


SELECT S.NAME STU_NAME
     , P.NAME PROF_NAME
  FROM STUDENT S JOIN PROFESSOR P
    ON S.PROFNO = P.PROFNO
 WHERE S.DEPTNO1 = '101';





-- �ǽ����� 8��-2
-- 2���̻��� ���̺� ���ν� �������̺� ������ ������ �Ǵ�
SELECT S.NAME STU_NAME
     , D.DNAME DEPT_NAME
     , P.NAME PROF_NAME
  FROM STUDENT S
     , DEPARTMENT D
     , PROFESSOR P
 WHERE S.DEPTNO1 = D.DEPTNO -- STUDENT ���̺�(���� ���̺�)�� DEPARTMENT ���̺�(DEPTNO PK) ����
   AND S.PROFNO = P.PROFNO; -- STUDENT ���̺�(���� ���̺�)�� PROFESSOR ���̺�(PROFNO PK) ����



SELECT S.NAME STU_NAME
     , D.DNAME DEPT_NAME
     , P.NAME PROF_NAME
FROM STUDENT S JOIN PROFESSOR P
               ON S.PROFNO = P.PROFNO
               JOIN DEPARTMENT D
               ON P.DEPTNO = D.DEPTNO
ORDER BY D.DNAME;




-- �ǽ����� 8��-1
-- 15�� => STUDENT ���̺� 20��, PROFESSOR ���̺� 16�� => STUDENT ���̺��� PROFNO �Ӽ��� NULL�� Ʃ���� ���ϰ�(5��) ���� ���
SELECT STU.NAME STU_NAME
     , PROF.NAME PROF_NAME
FROM STUDENT STU, PROFESSOR PROF
WHERE STU.PROFNO = PROF.PROFNO;


SELECT STU.NAME STU_NAME
     , PROF.NAME PROF_NAME
FROM STUDENT STU JOIN PROFESSOR PROF
ON STU.PROFNO = PROF.PROFNO;