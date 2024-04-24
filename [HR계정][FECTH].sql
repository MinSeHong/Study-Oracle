SELECT FIRST_NAME || ' ' || LAST_NAME "¼º ¸í", COMMISSION_PCT, SALARY FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL AND SALARY >=5000 AND LAST_NAME LIKE 'S%';


SELECT FIRST_NAME || ' ' || LAST_NAME "¼º ¸í", COMMISSION_PCT, SALARY FROM EMPLOYEES
WHERE SALARY >=5000 AND COMMISSION_PCT IS NOT NULL AND LAST_NAME LIKE '_a%';

SELECT FIRST_NAME || ' ' || LAST_NAME "¼º ¸í", PHONE_NUMBER, HIRE_DATE FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '011%';


SELECT MAX(SALARY), department_id FROM EMPLOYEES
GROUP BY department_id
ORDER BY MAX(SALARY) desc;


SELECT AVG(SALARY) Æò±Õ¿¬ºÀ, department_id FROM EMPLOYEES
where salary >3000 AND commission_pct is null
GROUP BY department_id
ORDER BY Æò±Õ¿¬ºÀ desc;

SELECT *
FROM employees;
SELECT *
FROM departments;
SELECT *
FROM countries;

SELECT FIRST_NAME || ' '  || LAST_NAME "¼º ÇÔ",SALARY,e.DEPARTMENT_ID,DEPARTMENT_NAME,d.LOCATION_ID,CITY, COUNTRY_NAME
FROM employees e JOIN departments d on e.department_id = d.department_id
JOIN locations lo ON lo.location_id = d.location_id
JOIN countries c ON c.country_id = lo.country_id;


SELECT FIRST_NAME || ' '  || LAST_NAME "¼º ÇÔ",SALARY,e.DEPARTMENT_ID,DEPARTMENT_NAME,d.LOCATION_ID,CITY, COUNTRY_NAME
FROM employees e, departments d ,locations lo, countries c
WHERE  e.department_id = d.department_id AND lo.location_id = d.location_id AND c.country_id = lo.country_id;



SELECT LAST_NAME || FIRST_NAME,SALARY,DEPARTMENT_NAME,CITY
FROM employees e, departments d ,locations lo, countries c
WHERE  e.department_id = d.department_id AND lo.location_id = d.location_id AND c.country_id = lo.country_id;

SELECT LAST_NAME || FIRST_NAME,SALARY,DEPARTMENT_NAME,CITY,country_name, c.COUNTRY_ID
FROM employees e, departments d ,locations lo, countries c
WHERE  e.department_id = d.department_id AND lo.location_id = d.location_id AND c.country_id = lo.country_id;


SELECT LAST_NAME || FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES e right outer join DEPARTMENTS d on e.department_id = d.department_id
WHERE e.department_id is null;


SELECT FIRST_NAME, SALARY, HIRE_DATE, DEPARTMENT_NAME,CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS LO ON D.LOCATION_ID = LO.LOCATION_ID
ORDER BY HIRE_DATE
FETCH FIRST 5 ROWS ONLY
;


SELECT LAST_NAME||FIRST_NAME,SALARY,DEPARTMENT_NAME,CITY
FROM(
SELECT * FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.department_id = D.department_id
JOIN LOCATIONS LO ON D.location_id = LO.location_id)
ORDER BY salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY
;


SELECT LAST_NAME||FIRST_NAME ¼º¸í,SALARY,DEPARTMENT_NAME,CITY
FROM(
SELECT * FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.department_id = D.department_id
JOIN LOCATIONS LO ON D.location_id = LO.location_id)
ORDER BY salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY
;

