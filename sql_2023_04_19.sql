--MEMBER2 ���̺� ����
CREATE TABLE MEMBER2(
    ID VARCHAR2(20)   --������ �÷� ID, �ڸ��� : 20�ڸ�����
  , PW VARCHAR2(20)   --������ �÷� PW, �ڸ��� : 20�ڸ�����
  , NAME VARCHAR2(20) --������ �÷� NAME, �ڸ��� : 20�ڸ�����
  , CLASS NUMBER(1)   --������ �÷� ID, �ڸ��� : 1�ڸ�����
  , TEL VARCHAR2(20)  --������ �÷� TEL, �ڸ��� : 20�ڸ�����
);

SELECT * FROM MEMBER2;

--MEMBER2 ���̺� �����͸� �߰�
--ù��° ��ȣ : ���� ���� �Ӽ���, �ι�° ��ȣ : ���� ��
INSERT INTO MEMBER2(ID, PW, NAME, CLASS, TEL)
VALUES('tyBird', 'abc11', '������', 1, '010-293-4874'); --���ڴ� ''�ȿ�

--������ Ʈ����� ���(�ֱ��� COMMIT���� ����)
ROLLBACK;

--������ Ʈ����� Ȯ�� ó��
COMMIT;


---------------------------------------------------------

--MYSQL ����
CREATE TABLE MEMBER2(
    ID VARCHAR(20)
  , PW VARCHAR(20)
  , NAME VARCHAR(20)
  , CLASS INT(1)
  , TEL VARCHAR(20)
);

INSERT INTO MEMBER2(ID, PW, NAME, CLASS, TEL)
VALUES('tyBird', 'abc11', '������', 1, '010-293-4874');

-- ��� �Ӽ��� ���� �� �� ���� �Ӽ� ���� ���� ����
INSERT INTO MEMBER2
VALUES('yjWood', 'abcd', '������', 2, '010-923-1245');

INSERT INTO MEMBER2(ID, PW, NAME, TEL)
VALUES('jinBear', '3333', '������', '010-2022-7244');

INSERT INTO MEMBER2
VALUES('jinBear', '3333', '������', 2, '010-2022-7244');

delete from member2 where id='aaa';






