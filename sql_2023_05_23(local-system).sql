--DATAFILE 을 만들면서 테이블 스페이스 생성
create tablespace storm
datafile 'C:\oraclexe\app\oracle\oradata\XE\app_data.dbf' size 100M
AUTOEXTEND ON Next 10M MAXSIZE 500M
DEFAULT STORAGE
(
INITIAL 10K
NEXT 10K
MINEXTENTS 2
MAXEXTENTS 50
PCTINCREASE 50
);

--DATAFILE 정보 변경
alter DATABASE
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\app_data.dbf'
AUTOEXTEND ON Next 100M MAXSIZE UNLIMITED;

--app_data2.dbf 파일을 생성해서 storm 테이블 스페이스 사용
ALTER tablespace storm
ADD DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\app_data2.dbf' size 50M;

--사용자/스키마 생성
CREATE USER TEST
IDENTIFIED BY 1234
DEFAULT TABLESPACE STORM
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON STORM;

--grantee : 부여받은 권한 대상자
SELECT * FROM dba_sys_privs
where grantee = 'TEST';

--접속권한 부여
GRANT CREATE SESSION TO TEST;
--테이블 생성 권한 부여
GRANT CREATE TABLE TO TEST;
--테이블 생성 권환 취소
REVOKE CREATE TABLE FROM TEST;

--접속 권환 취소
REVOKE CREATE SESSION FROM TEST;
--권환 2개 한꺼번에 부여
GRANT CREATE SESSION, CREATE TABLE TO TEST;