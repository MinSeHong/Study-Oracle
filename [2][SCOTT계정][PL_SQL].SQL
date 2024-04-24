/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
                                    --2023년 10월 10일--
                                    --■■PL/SQL■■
                                    
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

/*===============================================================================*/
--PL/SQL 기본 작성.
/*===============================================================================*/
--DBMS_OUTPUT.PUT_LINE을 이용하려면 SET SERVEROUT ON을 해야한다.
SET SERVEROUT ON

--변수선언은 DECLARE
DECLARE
    --<<변수명>> <<타입>>
    --%TYPE는 그 테이블의 컬럼명의 타입으로 한다는 의미.
    NO EMP.EMPNO%TYPE;
    
--조건 시작 BEGIN
BEGIN
--select한 EMPNO를 NO에 넣는다. (에러:변수가 여러개 되기 때문 TOO_MANY_ROWS)
--select EMPNO INTO NO FROM EMP;

---select한 EMPNO를 NO에 넣는다. (에러:조건에 맞는게 없기 때문 NO_DATA_FOUND)
select EMPNO INTO NO FROM EMP WHERE EMPNO=7369;

    --EXCEPTION
    --WHEN OTHERS THEN
        --DBMS_OUTPUT.PUT_LINE('오류발생:');
        
--조건의 끝은 END;와 /를 쓴다.
END;
/



/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
                                    --2023년 10월 11일--
                                    --■■VIEW 생성■■
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
CREATE OR REPLACE VIEW MY_EMP1("사원번호","성명","직무","입사일","부서코드")
AS SELECT empno, ename 이름, job, hiredate 입사일, deptno FROM emp
ORDER BY 입사일 desc;

DESC MY_EMP1
SELECT 성명,입사일 FROM MY_EMP1;

DROP VIEW MY_EMP1; --뷰 삭제.

CREATE OR REPLACE VIEW MY_NEWEMP
AS
SELECT E.*,DNAME, LOC
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY SAL DESC;

--SAL로 정렬된 것을 다시 정렬(ename으로)
SELECT * FROM MY_NEWEMP
ORDER BY ename;


--뷰 삭제
DROP VIEW MY_NEWEMP;

--인덱스 생성  CREATE INDEX <인덱스 명> ON <테이블명><(컬럼명,컬럼명)>
CREATE INDEX IDX_SAL ON EMP(SAL);
--인덱스 삭제
DROP INDEX IDX_SAL;

--서버 출력을 활성화--
SET SERVEROUT ON

ACCEPT NUM PROMPT '숫자를 입력하세요?' --사용자의 입력을 가져옴.

DECLARE
    NUM NUMBER := &NUM;
BEGIN
    DBMS_OUTPUT.PUT_LINE('입력한 숫자는 ' || NUM || '입니다.');
    IF MOD(NUM,2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(NUM || '은 짝수.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(NUM || '은 홀수.');
    END IF;
END;
/

---------------------------------------------------------------
ACCEPT KOR PROMPT '국어점수' --사용자의 입력을 가져옴.
ACCEPT ENG PROMPT '영어점수'
ACCEPT MATH PROMPT '수학점수'
DECLARE
    KOR NUMBER(3) := &KOR;
    ENG NUMBER(3) := &ENG;
    MATH NUMBER(3);---MATH는 실행부에서 초기화 하여라.
    --총합을 저장하는 변수와 평균을 저장하는 변수 선언하여라
    SUM1 NUMBER(4,1):=0; 
    AVG1 NUMBER(4,1);
BEGIN
    MATH:=&MATH;
    SUM1:=KOR+ENG+MATH;
    AVG1:=SUM1/3;  --AVG1:=(NUMBER(4,1)SUM1)/3;
    DBMS_OUTPUT.PUT_LINE('[성적 출력하기]');
    
    IF AVG1>=90 THEN
        DBMS_OUTPUT.PUT_LINE('A학점');
        
    ELSIF AVG1>=80 THEN
        DBMS_OUTPUT.PUT_LINE('B학점');
        
    ELSIF AVG1>=70 THEN
        DBMS_OUTPUT.PUT_LINE('C학점');
        
    ELSIF AVG1>=60 THEN
        DBMS_OUTPUT.PUT_LINE('D학점');
        
    ELSE
        DBMS_OUTPUT.PUT_LINE('F학점');
    END IF;
        DBMS_OUTPUT.PUT_LINE('총합: '||SUM1||'평균: '||AVG1);
    --문)90점이상이면 A학점 출력
END;
/
---------------------------------------------------------------

ACCEPT NUM PROMPT '숫자입력?'

BEGIN
IF MOD(&NUM,15)=0 THEN
    DBMS_OUTPUT.PUT_LINE('3과 5의 공배수');
ELSIF MOD(&NUM,3)=0 THEN
    DBMS_OUTPUT.PUT_LINE('3의 배수');
ELSIF MOD(&NUM,5)=0 THEN
    DBMS_OUTPUT.PUT_LINE('5의 배수');
ELSE
    DBMS_OUTPUT.PUT_LINE('3과 5의 배수가 아니다.');
END IF;
END;
/


-----------------------------------------------------------------
BEGIN
    FOR i IN 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE('i는 ' || i);
    END LOOP;
END;
/
-----------------------------------------------------------------

ACCEPT SNUM PROMPT '시작값?'
ACCEPT FNUM PROMPT '끝값?'
BEGIN
    FOR i IN &SNUM .. &FNUM LOOP
        DBMS_OUTPUT.PUT_LINE('i는 ' || i);
    END LOOP;
END;
/






/*==================================FUNCTION 함수===================================*/
/*==================================================================================*/
/*==================================================================================*/
/*==================================================================================*/
/*==================================================================================*/

CREATE OR REPLACE FUNCTION getTotal(fnum Number, snum Number)
    RETURN NUMBER--반환탑입 정의 (자리수 지정 불가능 및 ; 불가)
IS
    --변수 선언(자리 수 지정 가능 및 ; 넣어야함)
    HAP NUMBER :=0;
BEGIN
    FOR k IN FNUM .. SNUM LOOP
        HAP:= HAP + K;
    END LOOP;
    --값 반환
    RETURN HAP;
END;
/

SELECT getTotal(1,10) FROM DUAL;
VAR total NUMBER
EXECUTE :total := getTotal(1,10);
PRINT total



CREATE OR REPLACE FUNCTION to_asterisk(value NVARCHAR2)
    RETURN NVARCHAR2
IS
BEGIN
    RETURN RPAD(SUBSTR(value,1,1),LENGTH(value),'*');
END;
/

SELECT to_asterisk('HELLO') FROM DUAL;

VAR str NVARCHAR2(50)
EXEC :STR := to_asterisk('HELLO');
PRINT STR

SELECT ename, to_asterisk(ename) FROM emp;


CREATE OR REPLACE FUNCTION dateToString(value Date)
    RETURN NVARCHAR2
IS
BEGIN
    RETURN TO_CHAR(value,'YYYY-MM-DD');
END;
/


EXEC :STR := datetostring(SYSDATE+1);
PRINT STR;

SELECT HIREDATE, dateToString(HIREDATE) FROM EMP;


--※함수에서 예외처리시 예외처리부는 RETURN문 이후 기술
--   그렇지 않으면 숫자형식의 문자열 입력시 Function returned without value 발생
--   함수는 주로 컬럼에 적용한다
/*==================================================================================*/
CREATE OR REPLACE FUNCTION exceptFunc(value1 NVARCHAR2)
    RETURN NVARCHAR2
IS
    toNumber NUMBER;
BEGIN
    SELECT TO_NUMBER(value1) INTO toNumber FROM DUAL;
    RETURN toNumber;
    EXCEPTION
    WHEN OTHERS THEN
        RETURN '숫자형식이 아닙니다';
        --DBMS_OUTPUT.PUT_LINE('숫자 형식이 아닙니다.');
END;
/

SELECT exceptfunc('1004') from dual;
SELECT exceptfunc('100사') from dual;
/*==================================================================================*/




/*==================================FUNCTION 함수===================================*/
/*==================================================================================*/
/*==================================================================================*/
/*==================================================================================*/
/*==================================================================================*/

CREATE OR REPLACE FUNCTION getTotal(fnum Number, snum Number)
    RETURN NUMBER--반환탑입 정의 (자리수 지정 불가능 및 ; 불가)
IS
    --변수 선언(자리 수 지정 가능 및 ; 넣어야함)
    HAP NUMBER :=0;
BEGIN
    FOR k IN FNUM .. SNUM LOOP
        HAP:= HAP + K;
    END LOOP;
    --값 반환
    RETURN HAP;
END;
/

SELECT getTotal(1,10) FROM DUAL;
VAR total NUMBER
EXECUTE :total := getTotal(1,10);
PRINT total



CREATE OR REPLACE FUNCTION to_asterisk(value NVARCHAR2)
    RETURN NVARCHAR2
IS
BEGIN
    RETURN RPAD(SUBSTR(value,1,1),LENGTH(value),'*');
END;
/

SELECT to_asterisk('HELLO') FROM DUAL;

VAR str NVARCHAR2(50)
EXEC :STR := to_asterisk('HELLO');
PRINT STR

SELECT ename, to_asterisk(ename) FROM emp;


CREATE OR REPLACE FUNCTION dateToString(value Date)
    RETURN NVARCHAR2
IS
BEGIN
    RETURN TO_CHAR(value,'YYYY-MM-DD');
END;
/


EXEC :STR := datetostring(SYSDATE+1);
PRINT STR;

SELECT HIREDATE, dateToString(HIREDATE) FROM EMP;


--※함수에서 예외처리시 예외처리부는 RETURN문 이후 기술
--   그렇지 않으면 숫자형식의 문자열 입력시 Function returned without value 발생
--   함수는 주로 컬럼에 적용한다
/*==================================================================================*/
CREATE OR REPLACE FUNCTION exceptFunc(value1 NVARCHAR2)
    RETURN NVARCHAR2
IS
    toNumber NUMBER;
BEGIN
    SELECT TO_NUMBER(value1) INTO toNumber FROM DUAL;
    RETURN toNumber;
    EXCEPTION
    WHEN OTHERS THEN
        RETURN '숫자형식이 아닙니다';
        --DBMS_OUTPUT.PUT_LINE('숫자 형식이 아닙니다.');
END;
/

SELECT exceptfunc('1004') from dual;
SELECT exceptfunc('100사') from dual;
/*==================================================================================*/






