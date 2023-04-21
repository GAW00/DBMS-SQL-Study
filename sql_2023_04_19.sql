--MEMBER2 테이블 생성
CREATE TABLE MEMBER2(
    ID VARCHAR2(20)   --문자형 컬럼 ID, 자리수 : 20자리까지
  , PW VARCHAR2(20)   --문자형 컬럼 PW, 자리수 : 20자리까지
  , NAME VARCHAR2(20) --문자형 컬럼 NAME, 자리수 : 20자리까지
  , CLASS NUMBER(1)   --숫자형 컬럼 ID, 자리수 : 1자리까지
  , TEL VARCHAR2(20)  --문자형 컬럼 TEL, 자리수 : 20자리까지
);

SELECT * FROM MEMBER2;

--MEMBER2 테이블에 데이터를 추가
--첫번째 괄호 : 값을 넣을 속성명, 두번째 괄호 : 넣을 값
INSERT INTO MEMBER2(ID, PW, NAME, CLASS, TEL)
VALUES('tyBird', 'abc11', '김태은', 1, '010-293-4874'); --문자는 ''안에

--데이터 트랜잭션 취소(최근의 COMMIT이후 부터)
ROLLBACK;

--데이터 트랜잭션 확정 처리
COMMIT;


---------------------------------------------------------

--MYSQL 버전
CREATE TABLE MEMBER2(
    ID VARCHAR(20)
  , PW VARCHAR(20)
  , NAME VARCHAR(20)
  , CLASS INT(1)
  , TEL VARCHAR(20)
);

INSERT INTO MEMBER2(ID, PW, NAME, CLASS, TEL)
VALUES('tyBird', 'abc11', '김태은', 1, '010-293-4874');

-- 모든 속성의 값을 다 줄 때는 속성 지정 생략 가능
INSERT INTO MEMBER2
VALUES('yjWood', 'abcd', '이은정', 2, '010-923-1245');

INSERT INTO MEMBER2(ID, PW, NAME, TEL)
VALUES('jinBear', '3333', '조진아', '010-2022-7244');

INSERT INTO MEMBER2
VALUES('jinBear', '3333', '조진아', 2, '010-2022-7244');

delete from member2 where id='aaa';






