-- Package 생성(header(body는 따로 만들어야 함))
create or replace package emp_mgmt as
    procedure adjust_sal(v_flag varchar2, v_empno number, v_pct number);
    function get_annual_sal (v_empno number) return number;
    function get_retire_money (v_empno number) return number;
    procedure remove_emp (v_empno number);
    function get_hiredate (v_empno number, v_fmt varchar2) return varchar2;
end emp_mgmt;