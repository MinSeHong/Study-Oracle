SELECT * FROM EMPLOYEES;

SELECT LAST_NAME, PHONE_NUMBER, RPAD(SUBSTR(PHONE_NUMBER,1,3),LENGTH(PHONE_NUMBER),'X'), HIRE_DATE, TO_CHAR(HIRE_DATE,'YYYY-MM-DD') FROM EMPLOYEES WHERE INSTR(LOWER(LAST_NAME),'ar')!=0;

FOR

/*====================================================================================================*/
SELECT LAST_NAME FROM EMPLOYEES WHERE INSTR(LOWER(SUBSTR(LAST_NAME,LENGTH(LAST_NAME),1)),'t')!=0;

SELECT LAST_NAME FROM EMPLOYEES WHERE SUBSTR(UPPER(LAST_NAME),LENGTH(LAST_NAME),1)='T';
/*====================================================================================================*/

SELECT REPLACE('HELLO WORD','HELLO','JAVA') FROM DUAL;
SELECT TO_CHAR(1004) || ' 천사' FROM DUAL;
SELECT 1004 || ' 천사' FROM DUAL;
SELECT TO_CHAR(123,'0999') FROM DUAL; -- 0123
SELECT TO_CHAR(123,'9999') FROM DUAL; --  123


/*====================================================================================================*/

--2023/09/29에서 100일후
SELECT TO_DATE('2023/09/29')+100 FROM DUAL;

SELECT SYSDATE-TO_DATE('2024/03/18') FROM DUAL;
SELECT TO_DATE('2024/03/18')-SYSDATE FROM DUAL;


--수학 공식
/*====================================================================================================*/
SELECT CEIL(1.1) FROM DUAL;
SELECT POWER(2,3) FROM DUAL;
SELECT SQRT(9) FROM DUAL;
/*====================================================================================================*/

/*====================================================================================================*/
SELECT LAST_NAME, RPAD(SUBSTR(EMAIL,1,1),LENGTH(EMAIL),'*') EMAIL,
        CASE
        WHEN SALARY>=10000 THEN '고액연봉'
        WHEN SALARY>=5000 THEN '중간'
        ELSE '보통'
        END 등급,
        TO_CHAR(SALARY,'$999,999') SALARY, TO_CHAR(HIRE_DATE,'YYYY"년" MM"월" DD"일"') HIRE_DATE
FROM EMPLOYEES WHERE SUBSTR(UPPER(LAST_NAME),LENGTH(LAST_NAME),1)='T';
/*====================================================================================================*/



