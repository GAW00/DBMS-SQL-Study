select help('adjust_sal')
from dual;


-- 개발자를 위한 HELP FUNCTION 생성
CREATE OR REPLACE FUNCTION HELP
(V_MODULE VARCHAR2)
						
RETURN VARCHAR2 IS V_USAGE VARCHAR2(100);
BEGIN
    V_USAGE := V_MODULE || '는(은) 등록되지 않은 모듈입니다.';
    IF UPPER(V_MODULE) = 'ADJUST_SAL' THEN
        V_USAGE := '종류 : PROC, 사용법 : ADJUST_SAL(INCREASE|DECREASE, 사번, 증감율)';
			
    ELSIF UPPER(V_MODULE) = 'GET_ANNUAL_SAL' THEN
        V_USAGE := '종류 : FUNC, 사용법 : GET_ANNUAL_SAL(사번)';
			
    ELSIF UPPER(V_MODULE) = 'GET_RETIRE_MONEY' THEN
        V_USAGE := '종류 : FUNC, 사용법 : GET_RETIRE_MONEY(사번)';
			
    ELSIF UPPER(V_MODULE) = 'REMOVE_EMP' THEN
        V_USAGE := '종류 : PROC, 사용법 : REMOVE_EMP(사번)';
			
    ELSIF UPPER(V_MODULE) = 'GET_HIREDATE' THEN
        V_USAGE := '종류 : FUNC, 사용법 : GET_HIREDATE(사번, 포맷)';
    END IF;
    RETURN V_USAGE;
END;


