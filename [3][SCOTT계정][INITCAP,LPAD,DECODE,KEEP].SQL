SELECT * FROM EMP;
/*===========================================*/
--NVL2(컬럼명, NULL이 아닌 경우 , NULL인 경우)
--NULL 값에 어떤 연산을 해도 NULL.
/*===========================================*/
SELECT JOB,COMM,NVL2(COMM,COMM*1.5,-1) FROM EMP;







/*===========================================*/
-- LOWER(컬럼명) 소문자로 변경.
-- UPPER(컬럼명) 대문자로 변경.
-- INITCAP(컬럼명) 첫 영문자를 대문자로 변경
-- CONCAT(문자,문자) 문자를 연결할 때 사용
/*===========================================*/
SELECT * FROM EMP WHERE LOWER(JOB)='clerk';
SELECT ENAME, INITCAP(ENAME) FROM EMP;
SELECT LPAD(CONCAT(ENAME,'의 연봉은 '),20,' ')|| LPAD(SAL,6,' ') || '입니다' FROM EMP;
--오라클에서 한글은 3BYTE를 차지한다.
SELECT LENGTH('오라클') FROM DUAL;
SELECT LENGTHB('오라클') FROM DUAL;

SELECT ENAME, LENGTH(ENAME) FROM EMP WHERE LENGTH(ENAME)>=5;

SELECT RPAD('ORALCE',LENGTH('ORACLE')+2,'X') FROM DUAL;





--INSTR ('문자열' ,'찾을 문자열') 인덱스는 1부터 시작.
SELECT INSTR('ACADEMY','CAD') FROM DUAL;
SELECT ENAME FROM EMP WHERE INSTR(UPPER(ENAME),'S') !=0;
SELECT ENAME FROM EMP WHERE UPPER(ENAME) LIKE '%S%';









/*===========================================*/
--SUBSTR('문자열',시작인덱스,길이)
/*===========================================*/
SELECT SUBSTR('ACADEMY', 2,3) FROM DUAL;


/*===========================================*/
SELECT SAL, TO_CHAR(SAL, '$99,999.99') FROM EMP;
SELECT SAL, TO_CHAR(SAL, 'L99,999.99') FROM EMP;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS DAY') FROM DUAL;

SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY"년" MM"월" DD"일" HH"시" MI"분" SS"초" DAY') FROM EMP;

SELECT TO_NUMBER('123') || '숫자' FROM DUAL;
SELECT '123' || '숫자' FROM DUAL;
SELECT TO_NUMBER('123') + 10 FROM DUAL;
/*===========================================*/











/*===========================================*/
ACCEPT NUM PROMPT '숫자입력?'
DECLARE
    NUM_ NUMBER;
BEGIN
    SELECT TO_NUMBER('&NUM') INTO NUM_ FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('입력한 숫자는 ' || NUM_);
    EXCEPTION
    WHEN INVALID_NUMBER THEN
        DBMS_OUTPUT.PUT_LINE('숫자가 아닙니다.');
END;
/
/*===========================================*/










/*===========================================*/
SELECT 'X' || TRIM('     A    B  C    ') || 'Y' FROM DUAL;
SELECT 'X' || '     A    B  C    '|| 'Y' FROM DUAL;

SELECT TO_CHAR(SYSDATE+10,'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
/*===========================================*/











/*===========================================*/
--날짜 형식의 문자열을 DATE타입으로 변환 TO_DATE()
--날짜 형식 문자열 TO_DATE를 할때 한글이 들어가 있으면 안된다.
/*===========================================*/

SELECT '2000/10/20' +1 FROM DUAL;
SELECT TO_CHAR(TO_DATE('2000/10/20')+1,'YYYY-MM-DD') FROM DUAL;

SELECT MONTHS_BETWEEN(TO_DATE('2024-3-18'),TO_DATE('2023-10-10')) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE,5) FROM DUAL;

--SWITCH 문
/*==============================================================================================================*/
SELECT JOB, DECODE(UPPER(JOB), 'CLERK', '점원' , 'SALESMAM', '영업맨', 'MANAGER', '관리자', '기타') FROM EMP;

--IF ELSE IF
SELECT JOB,
        CASE UPPER(JOB)
        WHEN 'CLERK' THEN '점원'
        WHEN 'SALESMAN' THEN '영업맨'
        WHEN 'MANAGER' THEN '관리자'
        ELSE '기타'
        END JOB2,
        SAL
FROM EMP;




/*==============================================================================================================*/
SELECT * FROM EMP ORDER BY DEPTNO;
SELECT SUM(SAL) FROM EMP GROUP BY DEPTNO;




--RANK()
/*==============================================================================================================*/
SELECT ENAME, JOB, SAL,
    RANK() OVER(ORDER BY SAL DESC) RANK
    FROM EMP;
--DENSE_RANK()
/*==============================================================================================================*/
SELECT ENAME, JOB, SAL,
    DENSE_RANK() OVER(ORDER BY SAL DESC) RANK
    FROM EMP;
/*==============================================================================================================*/







/*==============================================================================================================*/
SELECT ENAME 이름, JOB 직무, SAL 연봉, DEPTNO 부서코드,
    MIN(SAL) OVER (PARTITION BY DEPTNO) 최소,
    MAX(SAL) OVER (PARTITION BY DEPTNO) 최고,
    SUM(SAL) OVER (PARTITION BY DEPTNO) 총연봉,
    AVG(SAL) OVER (PARTITION BY DEPTNO) 연봉평균,
    RANK()  OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) 연봉순위
FROM EMP;
/*==============================================================================================================*/
-- づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ   
-- づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ   
-- づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ   
-- づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ   
-- づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ   
-- づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ   
-- づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ   
-- づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ   
-- づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ   
-- づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ   
-- づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ   
-- づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ   
-- づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ    づ '~'づ   

/*==============================================================================================================*/
SELECT DEPTNO,
    MIN(SAL) KEEP(DENSE_RANK FIRST ORDER BY SAL DESC) AS MAX_SALARY
FROM EMP
GROUP BY DEPTNO; 
/*==============================================================================================================*/







--KEEP()은 그룹함수(집계함수)랑 같이 써야한다.
/*==============================================================================================================*/
SELECT DEPTNO,
    MAX(SAL) KEEP (DENSE_RANK FIRST ORDER BY HIREDATE DESC) 최근,
    MAX(SAL) KEEP (DENSE_RANK LAST ORDER BY HIREDATE DESC) 노땅
    FROM EMP
    GROUP BY DEPTNO
ORDER BY DEPTNO;
/*==============================================================================================================*/





--CURSOR는 레코드를 가르키는 포인터다. (C언어의 포인터와 같음)--
/*==============================================================================================================*/
ACCEPT DEPTNO PROMPT '부서코드?'

DECLARE
    --커서 정의
    CURSOR MYCURSOR IS
    SELECT ename, sal, dname, loc
    FROM emp e join dept d ON e.deptno = d.deptno
    WHERE e.deptno=&DEPTNO
    ORDER BY SAL;
    --변수정의
    이름 emp.ename%TYPE;
    연봉 emp.sal%TYPE;
    부서명 dept.dname%TYPE;
    위치 dept.loc%TYPE;
BEGIN
    --커서 오픈
    OPEN MYCURSOR;
    --FETCH하기
    FETCH MYCURSOR INTO 이름,연봉,부서명,위치;
    DBMS_OUTPUT.PUT_LINE('=====================================');
	DBMS_OUTPUT.PUT_LINE('       이름        |       연봉      |     부서명    |      위치');
	DBMS_OUTPUT.PUT_LINE('=====================================');
    
    WHILE MYCURSOR%FOUND LOOP
        --출력
        DBMS_OUTPUT.PUT_LINE(이름 || ' : ' || 연봉 || ' : ' || 부서명 || ' : ' || 위치);
        --FETCH하기
        FETCH MYCURSOR INTO 이름,연봉,부서명,위치;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('=====================================');
    --커서 닫기
    CLOSE MYCURSOR;
END;
/

WHERE