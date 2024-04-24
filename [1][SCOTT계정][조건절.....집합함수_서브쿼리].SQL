/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
                                                --2023년 10월 02일--
                                                --간단한 SQL문
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

/*=======================================*/
--■■SELECT <<컬럼명>> FROM <<테이블명>>■■
--테이블에 있는 컬럼을 결과셋으로 출력
/*=======================================*/
SELECT * FROM EMP;
SELECT * FROM DEPT;

/*===================================*/
--■■DESC <<테이블명>>■■
--테이블의 유형
/*===================================*/


/*===================================*/
--테이블 출력
/*===================================*/
SELECT * FROM Tab;



/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
                                                --2023년 10월 04일--
                                            --■■WHERE절/BETWEEN AND절/IN절■■
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

/*==============================================================*/
--■■SELECT <<컬럼명>> FROM <<테이블명>> WHERE <<조건명>>■■
--WHERE절. 조건에 맞는 결과셋을 출력
--데이터의 값은
/*==============================================================*/
SELECT * FROM emp
WHERE sal >= 3000;


/*=========================================================*/
--■■WHERE job <> 'CLERK';■■ --데이터는 대소문자를 구분한다.
/*=========================================================*/
SELECT * FROM EMP WHERE sal >=1500 OR job='SALESMAN';


/*===========================================================================*/
--■■AS 별칭  AS는 생략 가능하다. 다음은 '연봉'으로 별칭을 했다.■■
--즉 컬럼명은 ■ename || '의 연봉은 ' || sal || '원 입니다'■가 아니라 ■연봉■이다.
-- '||'는 더하는 의미이다.
/*===========================================================================*/
SELECT ename || '의 연봉은 ' || sal || '원 입니다' 연봉 FROM emp;



/*=======================================================*/
--■■WHERE <<컬럼명>> BETWEEN <<숫자>> AND <<숫자>>■■
/*=======================================================*/
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000;
SELECT * FROM emp WHERE sal >= 2000 AND sal<=3000;




/*=======================================================*/
--■■IN ('<<데이터 값>>','<<데이터값>>')■■
-- 위 IN의 소괄호 안에 있는 콤마는 OR을 의미한다.
--emp 테이블에서 컬럼명 JOB이 SALESMAN 또는 MANAGER인 것.
/*=======================================================*/
SELECT * FROM emp WHERE job in ('SALESMAN', 'MANAGER'); 

--이와 같은 결과값을 가진다.
SELECT * FROM emp WHERE job='SALESMAN' or job ='MANAGER';

--위 SQL과 반대로 출력을 원한다면.
SELECT * FROM emp WHERE job NOT IN ('SALESMAN', 'MANAGER'); 





/*=======================================================*/
--■■WHERE <<컬럼명>> LIKE '<<정규식>>';■■
--%는 아무 문자나 들어가도 된다는 의미. 자바 정규식 표현은 '.'
/*=======================================================*/
--3번째가 A인 컬럼명을 찾는다.
SELECT * FROM emp WHERE Ename LIKE '__A%';
--A가 있는 컬럼명을 찾는다.
SELECT * FROM emp WHERE Ename LIKE '%A%';
--A가 처음시작하는 컬럼명을 찾는다.
SELECT * FROM emp WHERE Ename LIKE 'A%';



/*=======================================================*/
--■■WHERE <<컬럼명>> LIKE '<<정규식>>';■■
--%는 아무 문자나 들어가도 된다는 의미. 자바 정규식 표현은 '.'
/*=======================================================*/
SELECT * FROM emp WHERE COMM IS NOT NULL;



/*===========================================================================*/
--emp 테이블에서 empno, ename, job, sal 컬럼명을 출력
--조건은 job이 MANAGER ★이고(AND)★ SAL이 ★2500에서 3000사이(BETWEEN AND)★
/*===========================================================================*/
SELECT empno, ename, job, sal FROM emp 
WHERE job='MANAGER' AND sal BETWEEN 2500 AND 3000;

/*===========================================================================*/
--배운 내용을 이용한 결과셋 출력.
/*===========================================================================*/
SELECT * FROM emp
WHERE (DEPTNO=30 OR DEPTNO=20) AND sal <2000;

SELECT * FROM emp
WHERE DEPTNO IN ('20','30') AND NOT sal >=2000;

SELECT * FROM emp
WHERE sal>=1500 AND COMM IS NOT NULL;

SELECT * FROM emp ORDER BY sal DESC;

SELECT * FROM emp
ORDER BY job, deptno DESC;

SELECT ename, deptno, sal, comm from emp
WHERE job='SALESMAN' AND comm >= 100 ORDER BY sal;

SELECT * from emp
WHERE ename LIKE '%A%' ORDER BY sal,deptno DESC;




/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
                                                --2023년 10월 04일--
                                            --■■집합함수 (그룹합수라고 한다.)■■
                                            --AVG(<<컬럼명>>)    COUNT(<<컬럼명>>) 
                                            --MAX(<<컬럼명>>)      MIN(<<컬럼명>>)
                                            
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

SELECT AVG(sal) "평균",COUNT(*) "총 합계", MAX(sal) "최대", MIN(sal) "최소" FROM emp;


/*====================================*/
--EMP 테이블에서 SAL의 평균을 구하는 방법.
/*====================================*/
SELECT AVG(sal) FROM emp;

--밑은 AVG 집합함수 대신 사용.
SELECT SUM(sal)/COUNT(*) FROM emp;




/*===================================================================*/
    --■■GROUP BY <<컬럼명>>■■
    
    --집합 함수는 반드시 그룹핑 해야한다.
    --집합 함수는 하나의 레코드만 나오기 때문에
    --집합 함수가 아닌 것이랑 같이 있을 수가 없다.
    --1개의 레코드를 여러개 레코드와 연결 할 수 없기 때문
/*===================================================================*/
SELECT ename, max(sal)
FROM emp
GROUP BY ename;

--밑의 SQL은 부서 (10,20,30)로 그룹핑을 했기 때문에 3개의 레코드로 나온다.
SELECT deptno, max(sal) FROM emp GROUP BY deptno;




/*=================================================================*/
--■■HAVING <<컬럼명 조건식>>■■
--그룹함수로 된 것은 HAVING 절로 조건문을 한다.
--★그룹함수 HAVING절에 그룹함수가 아닌 컬럼명을 넣으면 에러가 뜬다★
/*=================================================================*/
SELECT job, deptno, max(sal) FROM emp GROUP BY job, deptno
HAVING min(SAL)>=1000;
--HAVING SAL>=3000;

--그룹함수로 된 컬럼명이 아니면 밑처럼 WHERE절 사용.
SELECT COUNT(*) FROM emp
WHERE sal>=1000 AND ename LIKE '%S';

--그룹함수 AVG에 WHERE절을 이용.
SELECT AVG(sal) "SALESMAN의 평균 연봉" FROM emp WHERE job='SALESMAN';



/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
                                    --2023년 10월 04일--
                                    --■■JOIN■■
                                    --참조하는 다른 테이블의 값을 가져올때 JOIN을 이용
                                        
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
--PK(기본키)와 FK(참조키)가 같아야한다.
--EMP테이블에 있는 컬럼명 DEPTNO (FK)가 DEPT 테이블의 PK이다. 
--기본 JOIN은 INNER JOIN으로 INNER은 생략이 가능하다.
--또한 JOIN을 하면 PK와 FK는 컬럼명이 같기 때문에 테이블에 별칭을 해서
--별칭.<<컬럼명>> 해야한다.

SELECT empno,ename,sal,e.deptno,dname
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno;


--오라클 식: 다른 SQL에는 되지않아서 비추천.
SELECT empno,ename,sal,e.deptno,dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

/*==================================*/
--■■RIGHT OUTER JOIN■■
--오른쪽 테이블 기준으로 JOIN을 하는데
--왼쪽 테이블에 컬럼명이 없어도. 
--NULL로 반환 해서 레코드 출력한다.
/*==================================*/
SELECT DNAME, D.DEPTNO, empno
FROM emp e right outer JOIN dept d ON e.deptno=d.deptno
WHERE empno is null;


--배운 내용을 이용하여 SQL작성.
SELECT E1.ENAME ||'의 매니저는 ' || E2.ENAME || '입니다.' 조직도
FROM EMP E1 JOIN EMP E2 ON E1.MGR = E2.EMPNO;

SELECT dname 부서명
FROM emp e right outer JOIN DEPT d ON e.deptno=d.deptno
WHERE empno is null;



/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
                                    --2023년 10월 04일--
                                    --■■서브 쿼리■■
                                    --() 안에 SQL를 작성한다.
                                        
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

--WHERE절에서 EMP 테이블에서 SAL이 가장 낮은 것을 조건으로 한다.
SELECT * FROM EMP
WHERE SAL = (SELECT MIN(SAL) FROM EMP);

--IN을 이용한 방식.
SELECT ENAME, SAL, JOB, DEPTNO FROM EMP
WHERE (SAL,DEPTNO) IN (SELECT MAX(SAL), DEPTNO FROM EMP GROUP BY DEPTNO);

--위와 같은 질의문을 다르게 작성하면.
SELECT ENAME, SAL, JOB, DEPTNO FROM EMP
WHERE SAL=2850 AND DEPTNO=30 OR SAL=5000 AND DEPTNO=10 OR SAL=3000 AND DEPTNO=20;

--<<컬럼명>> * 1.5를 하면 숫자값일 경우 1.5배 된다.
SELECT ENAME, SAL, JOB, SAL*1.5 "인상된 연봉" FROM EMP
WHERE SAL IN (SELECT MIN(SAL) FROM EMP);


/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■     배운 것을 이용한 조건식. ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
SELECT ENAME, JOB, SAL
FROM EMP
WHERE SAL = (SELECT MIN(SAL) FROM EMP) or SAL =(SELECT MAX(SAL) FROM EMP)
ORDER BY SAL;

--위 SQL를 다르게 작성. IN을 사용했다.
SELECT ENAME, JOB, SAL
FROM EMP
WHERE SAL IN ((SELECT MIN(SAL) FROM EMP),(SELECT MAX(SAL) FROM EMP))
ORDER BY SAL;


SELECT ENAME, JOB, SAL
FROM EMP
WHERE SAL IN ((SELECT MIN(SAL) FROM EMP),(SELECT MAX(SAL) FROM EMP))
ORDER BY SAL;

SELECT ENAME, SAL, JOB, DEPTNO
FROM EMP
WHERE (SAL,DEPTNO) IN (SELECT MAX(SAL), DEPTNO FROM EMP GROUP BY DEPTNO);



SELECT ENAME, JOB, SAL
FROM EMP
WHERE SAL IN (800,5000)
ORDER BY SAL;

SELECT ENAME, SAL, JOB, DEPTNO
FROM EMP
WHERE (SAL,DEPTNO) IN (SELECT MAX(SAL), DEPTNO FROM EMP GROUP BY DEPTNO) OR (SAL,DEPTNO) IN (SELECT MIN(SAL), DEPTNO FROM EMP GROUP BY DEPTNO)
ORDER BY DEPTNO;
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
