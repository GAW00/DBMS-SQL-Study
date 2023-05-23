--DATAFILE �� ����鼭 ���̺� �����̽� ����
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

--DATAFILE ���� ����
alter DATABASE
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\app_data.dbf'
AUTOEXTEND ON Next 100M MAXSIZE UNLIMITED;

--app_data2.dbf ������ �����ؼ� storm ���̺� �����̽� ���
ALTER tablespace storm
ADD DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\app_data2.dbf' size 50M;

--�����/��Ű�� ����
CREATE USER TEST
IDENTIFIED BY 1234
DEFAULT TABLESPACE STORM
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON STORM;

--grantee : �ο����� ���� �����
SELECT * FROM dba_sys_privs
where grantee = 'TEST';

--���ӱ��� �ο�
GRANT CREATE SESSION TO TEST;
--���̺� ���� ���� �ο�
GRANT CREATE TABLE TO TEST;
--���̺� ���� ��ȯ ���
REVOKE CREATE TABLE FROM TEST;

--���� ��ȯ ���
REVOKE CREATE SESSION FROM TEST;
--��ȯ 2�� �Ѳ����� �ο�
GRANT CREATE SESSION, CREATE TABLE TO TEST;