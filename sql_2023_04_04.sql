select job
     , substr(job, 3, 2) -- 3번째에서 2글자
     , substr(job, 6, 2) -- 없으면 null(sql developer 기준)
     , substr(job, 4)    -- 4번째에서 끝까지
     , substr(job, -3, 2) -- 뒤에서 3번째에서 2글자
     , substr(job, -5, 3) -- 뒤에서 5번째에서 3글자
from emp;

select ename
     , job
     , concat(ename, job)--||와 동일한 역할
from emp;

select '서진수' "NAME"
     , length(ME"
     , lengthb('서진수') '서진수') "NA"NAME" -- 한글을 3바이트로 인식
from dual;

SELECT 1
    , ABS(-352) -- 절대값
    , SYSDATE   -- 오늘날짜
-- 테이블 목록에는 없음(오라클에 있는 임시 테이블)
-- 원하는 값/함수 출력
FROM dual;

select ename
     , length(ename) -- 길이
     , lengthb(ename) -- 길이(위랑 같음 -> 영어는 길이 같음)
from emp;

SELECT
    name
    , LOWER(name) --전체 소문자
    , UPPER(name) --전체 대문자
FROM
    professor;
    
    
select * from student;
select name, substr(jumin, 3, 2) 출생월, substr(jumin, 5, 2) 출생일 from student where deptno1 = 101;
select name, substr(jumin, 3, 4) BIRTHDAY from student where deptno1 = 101;

select '서진수' "NAME"
     , substr('서진수', 1, 2) "NAME"
     , substrb('서진수', 1, 2) "NAME" -- 2바이트로는 한글 못 만듬
     , substrb('서진수', 1, 3) "NAME" --
from dual;"

select 'A-B-C-D'
-- '-'를 찾는데 '1'번째글자부터 시작해 '3'번째로 나온 '-'의 위치 index
     , instr('A-B-C-D', '-', 1, 3) "INSTR"
     , instr('A-B-C-D', '-', 3, 1) "INSTR"
     , instr('A-B-C-D', '-', 3) "INSTR" -- (3, 1)
     , instr('A-B-C-D', '-') "INSTR"    -- (1, 1)
     , instr('A-B-C-D', '-', -1, 3) "INSTR"
     , instr('A-B-C-D', '-', -3, 1) "INSTR"
     , instr('A-B-C-D', '-', -6, 1) "INSTR"
     , instr('A-B-C-D', '-', -6, 2) "INSTR"
from dual;













