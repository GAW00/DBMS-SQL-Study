select help('adjust_sal')
from dual;


-- �����ڸ� ���� HELP FUNCTION ����
CREATE OR REPLACE FUNCTION HELP
(V_MODULE VARCHAR2)
						
RETURN VARCHAR2 IS V_USAGE VARCHAR2(100);
BEGIN
    V_USAGE := V_MODULE || '��(��) ��ϵ��� ���� ����Դϴ�.';
    IF UPPER(V_MODULE) = 'ADJUST_SAL' THEN
        V_USAGE := '���� : PROC, ���� : ADJUST_SAL(INCREASE|DECREASE, ���, ������)';
			
    ELSIF UPPER(V_MODULE) = 'GET_ANNUAL_SAL' THEN
        V_USAGE := '���� : FUNC, ���� : GET_ANNUAL_SAL(���)';
			
    ELSIF UPPER(V_MODULE) = 'GET_RETIRE_MONEY' THEN
        V_USAGE := '���� : FUNC, ���� : GET_RETIRE_MONEY(���)';
			
    ELSIF UPPER(V_MODULE) = 'REMOVE_EMP' THEN
        V_USAGE := '���� : PROC, ���� : REMOVE_EMP(���)';
			
    ELSIF UPPER(V_MODULE) = 'GET_HIREDATE' THEN
        V_USAGE := '���� : FUNC, ���� : GET_HIREDATE(���, ����)';
    END IF;
    RETURN V_USAGE;
END;


