SELECT * FROM EMPLOYEES;

SELECT LAST_NAME, PHONE_NUMBER, RPAD(SUBSTR(PHONE_NUMBER,1,3),LENGTH(PHONE_NUMBER),'X'), HIRE_DATE, TO_CHAR(HIRE_DATE,'YYYY-MM-DD') FROM EMPLOYEES WHERE INSTR(LOWER(LAST_NAME),'ar')!=0;

FOR

/*====================================================================================================*/
SELECT LAST_NAME FROM EMPLOYEES WHERE INSTR(LOWER(SUBSTR(LAST_NAME,LENGTH(LAST_NAME),1)),'t')!=0;

SELECT LAST_NAME FROM EMPLOYEES WHERE SUBSTR(UPPER(LAST_NAME),LENGTH(LAST_NAME),1)='T';
/*====================================================================================================*/

SELECT REPLACE('HELLO WORD','HELLO','JAVA') FROM DUAL;
SELECT TO_CHAR(1004) || ' õ��' FROM DUAL;
SELECT 1004 || ' õ��' FROM DUAL;
SELECT TO_CHAR(123,'0999') FROM DUAL; -- 0123
SELECT TO_CHAR(123,'9999') FROM DUAL; --  123


/*====================================================================================================*/

--2023/09/29���� 100����
SELECT TO_DATE('2023/09/29')+100 FROM DUAL;

SELECT SYSDATE-TO_DATE('2024/03/18') FROM DUAL;
SELECT TO_DATE('2024/03/18')-SYSDATE FROM DUAL;


--���� ����
/*====================================================================================================*/
SELECT CEIL(1.1) FROM DUAL;
SELECT POWER(2,3) FROM DUAL;
SELECT SQRT(9) FROM DUAL;
/*====================================================================================================*/

/*====================================================================================================*/
SELECT LAST_NAME, RPAD(SUBSTR(EMAIL,1,1),LENGTH(EMAIL),'*') EMAIL,
        CASE
        WHEN SALARY>=10000 THEN '��׿���'
        WHEN SALARY>=5000 THEN '�߰�'
        ELSE '����'
        END ���,
        TO_CHAR(SALARY,'$999,999') SALARY, TO_CHAR(HIRE_DATE,'YYYY"��" MM"��" DD"��"') HIRE_DATE
FROM EMPLOYEES WHERE SUBSTR(UPPER(LAST_NAME),LENGTH(LAST_NAME),1)='T';
/*====================================================================================================*/



