SELECT DEPTNO
     , ROUND(AVG(NVL(SAL,0)), 2) AVG
FROM EMP
GROUP BY DEPTNO
HAVING AVG(NVL(SAL, 0)) >= 2000; -- GROUP BY 절의 조건절은 WHERE 아닌 HAVING


--부서별, 직업별의 평균 급여
SELECT DEPTNO NO
     , JOB J
     , AVG(SAL)
     , AVG(SAL) AVG_SAL
FROM EMP
GROUP BY DEPTNO, J --GROUP BY 에서는 별칭(ALIAS) 사용 x 오류 발생
ORDER BY DEPTNO;


--부서별, 직업별의 평균 급여
SELECT DEPTNO NO
     , JOB
     , AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB --GROUP함수가 아닌 속성들은 GROUP BY로 묶어줘야 한다
ORDER BY DEPTNO;


SELECT DEPTNO
     , AVG(NVL(SAL, 0)) "AVG" --부서별 그룹의 SAL평균
FROM EMP
GROUP BY DEPTNO; --부서별 그룹


SELECT AVG(NVL(SAL, 0)) "AVG"
FROM EMP;


--그룹 함수가 아니기 때문에 오류
SELECT DEPTNO
     , AVG(NVL(SAL, 0)) "AVG"
FROM EMP;




-- 총 튜플의 수
SELECT COUNT(*) 
--     , COUNT(EMPNO)
--     , COUNT(COMM)  -- NULL 제외 튜플 수
--     , SUM(COMM)    -- NULL 제외 COMM 속성 값의 합
--     , AVG(COMM)
--     , AVG(NVL(COMM, 0)) -- NULL 인 튜플도 분모로 포함
     , MAX(SAL)
     , MIN(SAL)
     , MAX(HIREDATE) -- 가장 뒤의 날짜
     , MIN(HIREDATE) -- 가장 앞의 날짜
     , STDDEV(SAL) "STD"   -- 표준편차
     , VARIANCE(SAL) "VAL" -- 분산
FROM EMP;

SELECT *
FROM EMP;



--*.정규식(표현식, Regular Expression)
--REGEXP_LIKE
--REGEXP_REPLACE
--REGEXP_COUNT(11g~) : 특정 문자의 개수를 세는 함수

SELECT TEXT
--a의 개수
--     , REGEXP_COUNT(text, 'a') "C"
     
     
--bc의 개수
--     , REGEXP_COUNT(text, 'bc') "C"
     
     
--12의 개수
--     , REGEXP_COUNT(text, '12') "C"
     

--c의 개수
--     , REGEXP_COUNT(text, 'c') "C"
     
     
--5번째 자리부터 나오는 c의 개수
--     , REGEXP_COUNT(text, 'c', 5) "C"


--첫번째 자리부터 나오는 c의 개수
--     , REGEXP_COUNT(text, 'c', 1) "C"
     
     
--첫번째 자리부터 나오는 c 또는 C의 개수(i => 대소문자 구별x)
--     , REGEXP_COUNT(text, 'c', 1, 'i') "C"
     
     
-- . => 모든 문자
--     , REGEXP_COUNT(text, '.') "C" --문자열 TEXT의 길이와 같다
--     , LENGTH(TEXT)


-- '.'문자열의 개수
--     , REGEXP_COUNT(text, '\.') "C"
     

-- 'aa'문자열의 개수(3개 동일)
     , REGEXP_COUNT(text, 'aa') "C"
     , REGEXP_COUNT(text, '(a{2})') "C"
     , REGEXP_COUNT(text, '(a)(a)') "C"
FROM T_REG;



--'(){2,}' => 이상으로 처리 했을 때
SELECT REGEXP_REPLACE('aaa bb', '( ){2,}', '*') "공백 1"
     , REGEXP_REPLACE('aaa  bb', '( ){2,}', '*') "공백 2"
     , REGEXP_REPLACE('aaa   bb', '( ){2,}', '*') "공백 3"
     , REGEXP_REPLACE('aaa   bb', '( ){2}', '*') "공백 3"
FROM DUAL;



--a, b 사이에 공백 1개
--b, c 사이에 공백 2개
--c, d 사이에 공백 3개
--()공백 1개
--''공백 0개
-- REGEXP_REPLACE(A, B, C) : A에서 B에 해당하는 문자열을 C로 바꾼다
-- => 'aaa b  c   d'에서 공백 한칸 짜리 문자열을 ''(공백없음)으로 바꾼다
SELECT REGEXP_REPLACE('aaa bb  c   d', '( ){1}','') "blank"


-- => 'aaa b  c   d'에서 공백 두칸 짜리 문자열을 ''(공백없음)으로 바꾼다
     , REGEXP_REPLACE('aaa bb  c   d', '( ){2}','') "blank"
     
     
-- => 'aaa b  c   d'에서 공백 세칸 짜리 문자열을 ''(공백없음)으로 바꾼다
     , REGEXP_REPLACE('aaa bb  c   d', '( ){3}','') "blank"
     
     
-- => 'aaa b  c   d'에서 공백 두칸 이상인 문자열을 ''(공백없음)으로 바꾼다
     , REGEXP_REPLACE('aaa bb  c   d', '( ){2,}','') "blank"
     
     
-- => 'aaa b  c   d'에서 공백 세칸 이상인 문자열을 ''(공백없음)으로 바꾼다
     , REGEXP_REPLACE('aaa bb  c   d', '( ){3,}','') "blank"
     

-- => 'aaa b  c   d'에서 공백 한칸 이상인 문자열을 ''(공백없음)으로 바꾼다 (처음과 같다)
     , REGEXP_REPLACE('aaa bb  c   d', '( ){1,}','') "blank"
FROM DUAL;



SELECT TEXT
-- 숫자를 '*'로 변경
--     , REGEXP_REPLACE(TEXT, '[0-9]', '*')


-- 숫자를 '*'로 변경
     , REGEXP_REPLACE(TEXT, '[[:digit:]]', '*')
FROM T_REG;


SELECT *
FROM T_REG
--소문자를 포함하는 튜플
--WHERE REGEXP_LIKE(TEXT, '[a-z]');


--대문자를 포함하는 튜플
--WHERE REGEXP_LIKE(TEXT, '[A-Z]');


--대/소문자를 포함하는 튜플
--WHERE REGEXP_LIKE(TEXT, '[a-zA-Z]');


--소문자로 시작하고 공백 있는 튜플
--WHERE REGEXP_LIKE(TEXT, '[a-z] ');
-- abc 123 : 공백 1개
-- abc  123 : 공백 2개


--소문자 다음에 숫자 있는 튜플
--WHERE REGEXP_LIKE(TEXT, '[a-z][0-9]');
-- a1b2c3
-- aabbcc123


--소문자 다음에 공백 1개 오고 숫자 있는 튜플
--WHERE REGEXP_LIKE(TEXT, '[a-z] [0-9]');
-- abc 123


--소문자 다음에 공백 2개 오고 숫자 있는 튜플
--WHERE REGEXP_LIKE(TEXT, '[a-z]  [0-9]');
-- abc  123


--소문자 다음에 공백 3개 오고 숫자 있는 튜플
--WHERE REGEXP_LIKE(TEXT, '[a-z]   [0-9]');
--없음


--공백이 있는 모든 튜플
--WHERE REGEXP_LIKE(TEXT, '[[:space:]]');


--space가 대문자면 오류
--WHERE REGEXP_LIKE(TEXT, '[[:SPACE:]]');


--소문자 1개 이상
--WHERE REGEXP_LIKE(TEXT, '[a-z]{1}');


--소문자 2개 이상
--WHERE REGEXP_LIKE(TEXT, '[a-z]{2}');


--소문자 3개 이상
--WHERE REGEXP_LIKE(TEXT, '[a-z]{3}');


--소문자 6개 이상
--WHERE REGEXP_LIKE(TEXT, '[a-z]{6}');


--숫자 3개 이상
--WHERE REGEXP_LIKE(TEXT, '[0-9]{3}');


--숫자 6개 이상
--WHERE REGEXP_LIKE(TEXT, '[0-9]{6}');


--소문자와 숫자 1개 이상
--WHERE REGEXP_LIKE(TEXT, '[a-z][0-9]{1}');


--소문자와 숫자 3개 이상
--WHERE REGEXP_LIKE(TEXT, '[a-z][0-9]{3}');


--대문자 or 소문자로 시작 
--WHERE REGEXP_LIKE(TEXT, '^[A-Za-z]');


--숫자 or 대문자로 시작 
--WHERE REGEXP_LIKE(TEXT, '^[0-9A-Z]');


--소문자로 끝나는 튜플
--WHERE REGEXP_LIKE(TEXT, '[a-z]$');


--대문자로 끝나는 튜플
--WHERE REGEXP_LIKE(TEXT, '[A-Z]$');


--숫자로 끝나는 튜플
--WHERE REGEXP_LIKE(TEXT, '[0-9]$');


--소문자로 시작하지 않는 튜플
--WHERE REGEXP_LIKE(TEXT, '^[^a-z]');


--숫자로 시작하지 않는 튜플
--WHERE REGEXP_LIKE(TEXT, '^[^0-9]');


--소문자 or 숫자로 시작하지 않는 튜플
--WHERE REGEXP_LIKE(TEXT, '^[^a-z0-9]');


--소문자로만 구성된 튜플 제거
--WHERE REGEXP_LIKE(TEXT, '[^a-z]');


--소문자가 1개라도 포함된 튜플 제거
--WHERE NOT REGEXP_LIKE(TEXT, '[a-z]');


--알파벳이 1개라도 포함된 튜플 제거
--WHERE NOT REGEXP_LIKE(TEXT, '[a-zA-Z]');


--숫자가 1개라도 포함된 튜플 제거
WHERE NOT REGEXP_LIKE(TEXT, '[0-9]');




SELECT NAME
     , ID
FROM STUDENT
--'M'으로 시작하고 뒤에 'a' or 'o' 로 시작
WHERE REGEXP_LIKE(ID, '^M(a|o)');






--------------------------------------------------------------------------------
--실습문제 3장-0
SELECT DEPTNO
     , ROUND(AVG(SAL), 2) AVG
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000;



--실습문제 2장-29
SELECT NAME
     , TEL
FROM STUDENT
--WHERE NOT REGEXP_LIKE(SUBSTR(TEL, 1, INSTR(TEL, ')') - 1), '[0-9]{3}')
--      AND REGEXP_LIKE(SUBSTR(TEL, INSTR(TEL, ')') + 1, INSTR(TEL, '-') - 1), '[0-9]{4}');
WHERE REGEXP_LIKE(TEL, '^[0-9]{2}\)[0-9]{4}');



--실습문제 NVL-1
SELECT ENAME
     , SAL
     , NVL(COMM, 0) "COMM"
     , TO_CHAR(SAL * 12 + NVL(COMM, 0), '999,999') "TOTAL"
FROM EMP
WHERE DEPTNO = 30;



--실습문제 형변환-2
SELECT NAME
     , TO_CHAR(HIREDATE, 'YYYY-MM-DD') "HIREDATE"
     , PAY
     , BONUS
     , TO_CHAR(PAY * 12 + BONUS, '$999,999') "TOTAL"
     , TO_CHAR((PAY * 12 + BONUS) * 0.9, '$999,999') "10%DOWN"
     , TO_CHAR((PAY * 12 + BONUS) * 0.9 * 1200, '9,999,999') "WON"
FROM PROFESSOR
WHERE BONUS IS NOT NULL;




--실습문제 형변환-1
SELECT NAME
     , HIREDATE
FROM PROFESSOR
WHERE TO_CHAR(HIREDATE,'MM') IN ('03', '08', '10');




--실습문제 REPLACE-2
SELECT ENAME
     , JOB
     , REPLACE(JOB, SUBSTR(JOB, 3, 1), '?') "JOB?"
FROM EMP
WHERE DEPTNO = 20;




--실습문제 SUBSTR, INSTR-2
SELECT NAME
     , TEL
     , SUBSTR(TEL, INSTR(TEL, ')') + 1, INSTR(TEL, '-') - INSTR(TEL, ')') - 1) "GUK_NO"
FROM STUDENT
WHERE DEPTNO1 = 101;




--실습문제 INSTR-2
SELECT NAME
     , GRADE
     , TEL
     , INSTR(TEL, 6) "6"
FROM STUDENT
WHERE GRADE IN (2, 4);




--실습문제 SUBSTR-2
SELECT NAME
     , HEIGHT
     , SUBSTR(JUMIN, 5, 2) "DAY"
FROM STUDENT
WHERE HEIGHT >= 180;




--실습문제 CASE-1
SELECT NAME
     , PAY
     , CASE WHEN PAY BETWEEN 1 AND 300 THEN 'GRADE 1'
            WHEN PAY BETWEEN 301 AND 400 THEN 'GRADE 2'
            WHEN PAY BETWEEN 401 AND 500 THEN 'GRADE 3'
            WHEN PAY > 500 THEN 'GRADE 4'
            END "GRADE"
FROM PROFESSOR
ORDER BY PAY DESC;




--실습문제 2장-28
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



--실습문제 DECODE-1
SELECT NAME, TEL, REPLACE(TEL, SUBSTR(TEL, 1, INSTR(TEL, '-') -1), RPAD(SUBSTR(TEL, 1, INSTR(TEL, ')')), 7, '*')) "REPLACE"
FROM EMP2;

SELECT NAME, TEL, DECODE(INSTR(TEL, '-') - INSTR(TEL, ')'), 5, (REPLACE(TEL, SUBSTR(TEL, INSTR(TEL, ')') + 1, 4), '****')), (REPLACE(TEL, SUBSTR(TEL, INSTR(TEL, ')') + 1, 3), '***'))) "REPLACE"
FROM EMP2;



--실습문제 4-6
SELECT NAME, PAY, BONUS
FROM PROFESSOR
WHERE (PAY >= 300 AND BONUS IS NULL) OR PAY >= 500;



--실습문제 4-5
SELECT PROFNO, NAME, PAY, BONUS, PAY * 12 + BONUS "TOTAL", DEPTNO
FROM PROFESSOR
WHERE BONUS IS NOT NULL
ORDER BY DEPTNO DESC, TOTAL;



--실습문제 4-4
SELECT NAME, ID, POSITION
FROM PROFESSOR
WHERE ID LIKE '%er';



--실습문제 4-3
SELECT NAME, PAY, HIREDATE
FROM PROFESSOR
WHERE PAY >= 300 AND PAY <= 500;
--WHERE PAY BETWEEN 300 AND 500;



--실습문제 4-2
SELECT NAME, ID, HPAGE
FROM PROFESSOR
WHERE DEPTNO = '102' AND HPAGE IS NOT NULL;



--실습문제 4-1
SELECT NAME, PAY, BONUS
FROM PROFESSOR
WHERE BONUS > 80
ORDER BY PAY DESC;