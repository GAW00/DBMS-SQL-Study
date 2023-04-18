--실습문제 2장-13
SELECT EMPNO
     , ENAME
     , SAL
     , comm
     , TO_CHAR((SAL * 12) + COMM, '999,999') "SALARY"
FROM EMP
WHERE ENAME = 'ALLEN';

--실습문제 2장-12
SELECT EMPNO
     , ENAME
     , HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE, 'MM') IN (01, 02, 03);


--실습문제 2장-11
SELECT STUDNO
     , NAME
     , BIRTHDAY
FROM STUDENT
WHERE TO_CHAR(BIRTHDAY, 'MM') = '01';

SELECT 2
--     , '2'
----'2'가 숫자로 변환 해서 계산
----자동(묵시적) 변환
--     , 2 + '2'
----수동(명시적) 변환
--     , 2 + TO_NUMBER('2')
----문자는 유니코드로 계산하지 않고 오류
--     , 2 + 'A'
     , SYSDATE
--4자리 연도
     , TO_CHAR(SYSDATE, 'YYYY')
--마지막 2자리 연도
     , TO_CHAR(SYSDATE, 'YY')
--연도를 영문 이름으로
     , TO_CHAR(SYSDATE, 'YEAR')
--해당 월이 2자리 수로 나옴(EX> 04)
     , TO_CHAR(SYSDATE, 'MM')
--해당 월 뒤에 '월'이 붙어 나옴
     , TO_CHAR(SYSDATE, 'MON')
--해당 일이 2자리 수로 나옴
     , TO_CHAR(SYSDATE, 'DD')
--해당 일의 요일로 나옴
     , TO_CHAR(SYSDATE, 'DAY')
--해당 일이 2자리 수로 나오고, 달중 몇번째 날인지 ST, ND, RD, TH를 붙여 나옴
     , TO_CHAR(SYSDATE - 10, 'DDTH')
--실무에서 많이 쓰는 날짜 표기법
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD')
--실무에서 많이 쓰는 날짜 표기법
--     , TO_CHAR(SYSDATE, '
FROM DUAL;

SELECT '14/09/30'
--날짜간 차이(달 간격)
     , MONTHS_BETWEEN('14/09/30', '14/08/31')
     , MONTHS_BETWEEN('14/08/31', '14/09/30')
--금일 날짜
     , SYSDATE
--금일 날짜 + 1개월
     , ADD_MONTHS(SYSDATE, 1)
--돌아오는 '수'요일
     , NEXT_DAY(SYSDATE, '수')
--돌아오는 '화'요일
     , NEXT_DAY(SYSDATE, '화')
--해당 달의 마지막 날짜
     , LAST_DAY(SYSDATE)
     , LAST_DAY('23/05/01')
FROM DUAL;

SELECT 987.654 "N"
--반올림
     , ROUND(987.654, 2)
     , ROUND(987.654, 0)
     , ROUND(987.654, -1)
     , ROUND(987.654, -2)
--(소수점 OR 시간)버림
     , TRUNC(987.654, 2)
     , TRUNC(987.654, 0)
     , TRUNC(987.654, -1)
--나머지
     , MOD(121, 10)
--올림
     , CEIL(123.45)
--버림(자바 INT)
     , FLOOR(123.45)
--승수
     , POWER(2, 3)
FROM DUAL;

--실습문제 2장-10
SELECT NAME
     , TEL
     , REPLACE(TEL, SUBSTR(TEL, INSTR(TEL, '-') + 1), '****') "REPLACE"
FROM STUDENT
WHERE DEPTNO1 = 101;

--실습문제 2장-9
SELECT NAME
     , TEL
     , REPLACE(TEL, SUBSTR(TEL, INSTR(TEL, ')') + 1, 3), '***') "REPLACE"
FROM STUDENT
WHERE DEPTNO1 = 102;

--실습문제 2장-8
SELECT NAME
     , JUMIN
     , REPLACE(JUMIN, SUBSTR(JUMIN, 7), '-/-/-/-') "REPALCE"
FROM STUDENT
WHERE DEPTNO1 = 101;


--실습문제 2장-7
SELECT ENAME
     , REPLACE(ENAME, SUBSTR(ENAME, 2, 2), '--') "REPALCE"
FROM EMP
WHERE DEPTNO = 20;

SELECT ENAME
--값의 가장 왼쪽에 C문자 있으면 제거 (CLARK -> LARK)
     , LTRIM(ENAME, 'C')
--값의 가장 오른쪽에 R문자 있으면 제거(MILLER -> MILLE)
     , RTRIM(ENAME, 'R')
--1, 2번째 문자를 '**'로 대체 ===> REPLACE(변경할 속성, 변경시킬 값, 대체하는 값)
     , REPLACE(ENAME, SUBSTR(ENAME, 1, 2), '**')
FROM EMP;

--실습문제 2장-6
SELECT RPAD(ENAME, 9, SUBSTR('123456789', LENGTH(ENAME) + 1)) "RPAD"
FROM EMP
WHERE DEPTNO = 10;


SELECT ENAME
--10자리 기준으로 빈자리는 오른쪽에 '~'을 채움
     , RPAD(ENAME, 10, '~')
FROM EMP;

--실습문제 2장-5
SELECT LPAD(ENAME, 9, '123456789') "LPAD"
FROM EMP
WHERE DEPTNO = 10;


SELECT NAME
     , ID
--10자리 기준으로 빈자리는 왼쪽에 '*'을 채움
     , LPAD(ID, 10, '*')
FROM STUDENT;

--실습문제 2장-4
SELECT NAME
     , TEL
     , SUBSTR(TEL, 1, INSTR(TEL, ')', 1, 1) - 1) "AREA CODE"
FROM STUDENT
WHERE DEPTNO1 = 201;

--실습문제 2장-3
SELECT NAME
     , TEL
     , INSTR(TEL, '8', 1, 2)
FROM STUDENT
WHERE DEPTNO1 = 101;

--실습문제 2장-2
SELECT NAME
     , TEL
     , INSTR(TEL, ')', 1, 1)
FROM STUDENT
WHERE DEPTNO1 = 201;

SELECT 'A-B-C-D'
--'-' 를 찾는데 첫번째 시작해서 -가 3번째로 나온 위치
            , INSTR('A-B-C-D','-',1,3) "INSTR"
--'-' 를 찾는데 뒤에서 첫번째 시작해서 -가 3번째(우측에서 좌측)로 나온 위치
            , INSTR('A-B-C-D','-',-1,3) "INSTR"
--'-' 를 찾는데 뒤에서 세번째 시작해서 -가 1번째(우측에서 좌측)로 나온 위치
            , INSTR('A-B-C-D','-',-3,1) "INSTR"
--'-' 를 찾는데 뒤에서 여섯번째 시작해서 -가 1번째(우측에서 좌측)로 나온 위치
            , INSTR('A-B-C-D','-',-6,1) "INSTR"
--'-' 를 찾는데 뒤에서 여섯번째 시작해서 -가 2번째(우측에서 좌측)로 나온 위치
            , INSTR('A-B-C-D','-',-6,2) "INSTR"
   FROM dual; 
   
SELECT 'A-B-C-D'
--- 를 찾는데 첫번째 시작해서 -가 3번째로 나온 위치
            , INSTR('A-B-C-D','-',1,3) "INSTR"
--- 를 찾는데 세번째 시작해서 -가 1번째로 나온 위치
            , INSTR('A-B-C-D','-',3,1) "INSTR"
--,1 이 생략
            , INSTR('A-B-C-D','-',3) "INSTR"
--,1,1 이 생략
            , INSTR('A-B-C-D','-') "INSTR"
   FROM dual; 
   
SELECT '서진수' "NAME"
            , SUBSTR('서진수',1,2) "NAME"
            , SUBSTRB('서진수',1,2) "NAME" --2바이트로는 한글 못만듦
            , SUBSTRB('서진수',1,3) "NAME"
   FROM dual; 
   
SELECT '서진수' "NAME"
            , LENGTH('서진수') "NAME"
            , LENGTHB('서진수') "NAME" --한글을 3바이트로 인식
   FROM dual; 
   
SELECT 1
            , ABS(-352) --절대값
            , SYSDATE --오늘날짜
--테이블 목록에는 없음(오라클에서 있는 임시 테이블)
--원하는 값/함수 출력
   FROM dual; 
   
SELECT name
            , LOWER(name) -- 전체 소문자
            , UPPER(name) -- 전체 대문자
   FROM professor;

SELECT JOB
--            , SUBSTR(JOB,3,2) --3번째에서 2자
--            , SUBSTR(JOB,6,2) --없으면 NULL(SQL DEVELOPER 기준)
--            , SUBSTR(JOB,4) --4번째에서 끝까지
            , SUBSTR(JOB,-3,2) --뒤에서 3번째에서 2자
            , SUBSTR(JOB,-5,3) --뒤에서 5번째에서 3자
   FROM EMP;
   
SELECT ENAME
            , JOB
            , CONCAT(ename, job) --|| 와 동일
   FROM EMP;
   
SELECT ENAME
            , LENGTH(ENAME) --길이
            , LENGTHB(ENAME) --길이(영문자는 LENGTH와 동일함)
   FROM EMP;
   
SELECT ENAME
            , DEPTNO
            , ENAME -- ENAME_1 (이름 중복시 자동으로 컬럼명 생성)
            , INITCAP(ENAME) -- 첫글자만 대문자
   FROM EMP
 WHERE DEPTNO = 10;

SELECT * FROM EMP;
