SET SERVEROUT ON;

SELECT * FROM BOARD;
DELETE BOARD;
DESC BOARD;
INSERT INTO BOARD VALUES(SEQ_BOARD.NEXTVAL, '1','2','3',SYSDATE);
----------------------------------------------------------------------------------------------
ACCEPT CNT PROMPT '데이터 갯수 입력?';

BEGIN
    FOR k IN 1 .. &CNT LOOP
        INSERT INTO BOARD VALUES(SEQ_BOARD.NEXTVAL, '제목'||K,'내용'||K,'작성자'||K,SYSDATE);
    END LOOP;
END;
/
----------------------------------------------------------------------------------------------
ACCEPT SNUM PROMPT '시작값 입력?'
ACCEPT FNUM PROMPT '끝값 입력?'
DECLARE
    HAP NUMBER:=0;

BEGIN
    FOR k IN &SNUM .. &FNUM LOOP
        IF MOD(K,2)=0 THEN
            HAP := HAP+K;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(&SNUM || '부터' || &FNUM || '까지 짝수 누적 합:' || HAP);
END;
/

----------------------------------------------------------------------------------------------
--PUT는 줄바꿈 기능이 없음 출력하려면
--한번은 줄바꿈 기능이 있는 함수(PUT_LINE(인자)혹은 NEW_LINE)를
--호출 해야 함
             
             
ACCEPT START_NUM PROMPT '시작값 입력?' 
    
BEGIN
    FOR k IN 1 .. &START_NUM LOOP
         FOR J IN 1 .. &START_NUM LOOP
            IF J=K THEN
            DBMS_OUTPUT.PUT('[1]');
            ELSE
            DBMS_OUTPUT.PUT('[0]');
            END IF;
         END LOOP;
         DBMS_OUTPUT.NEW_LINE;
    END LOOP;
END;
/


ACCEPT START_NUM PROMPT '시작값 입력?' 
    
BEGIN
    FOR k IN 1 .. &START_NUM LOOP
         FOR J IN REVERSE 1 .. &START_NUM LOOP
            IF J=K THEN
            DBMS_OUTPUT.PUT('[1]');
            ELSE
            DBMS_OUTPUT.PUT('[0]');
            END IF;
         END LOOP;
         DBMS_OUTPUT.NEW_LINE;
    END LOOP;
END;
/


BEGIN
    FOR k IN 1 .. 9 LOOP
         FOR J IN 2 .. 9 LOOP
         DBMS_OUTPUT.PUT(J|| ' * ' || K || ' = ' || J*K || '|');
         END LOOP;
         DBMS_OUTPUT.NEW_LINE;
    END LOOP;
END;
/


BEGIN
    FOR K IN 1 .. 9 LOOP
         FOR J IN 2 .. 9 LOOP
         DBMS_OUTPUT.PUT('■'||J|| ' * ' || K || ' = ' || RPAD(J*K,3,'ㅤ'));
         /*RPAD 오른쪽에 빈 곳에 '  '를 넣음  LPAD 왼쪽에 빈곳에 '  '를 넣음.*/
         END LOOP;
         DBMS_OUTPUT.PUT_LINE('■');
    END LOOP;
END;
/

DECLARE
    HAP NUMBER :=0;
    K NUMBEr :=1;
    
BEGIN
    WHILE K<=10 LOOP
    HAP:=HAP+K;
    K:=K+1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(HAP);
END;
/

--------------------------------------------------------------------------------------------
DECLARE
    I NUMBER :=1;
    K NUMBER :=1;
BEGIN
    WHILE I<5 LOOP
        WHILE K < 5 LOOP
            IF(K=I) THEN
            DBMS_OUTPUT.PUT('[1]');
            ELSE
            DBMS_OUTPUT.PUT('[0]');
            END IF;
            K:=K+1;
        END LOOP;
        DBMS_OUTPUT.NEW_LINE();
        K:=1;
        I:=I+1;
    END LOOP;
END;
/
--------------------------------------------------------------------------------------------
DECLARE
    I NUMBER :=2;
    K NUMBER :=1;
BEGIN
    WHILE I<=9 LOOP
        WHILE K <= 9 LOOP
            DBMS_OUTPUT.PUT('■'||I|| ' * ' || K || ' = ' || RPAD(I*K,3,'ㅤ'));
            K:=K+1;
        END LOOP;
        DBMS_OUTPUT.NEW_LINE();
        K:=1;
        I:=I+1;
    END LOOP;
END;
/
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
DECLARE
    I NUMBER :=1;
    K NUMBER :=2;
BEGIN
    WHILE I<=9 LOOP
    EXIT WHEN I=3;   /*I가 3일때 반복문을 빠져나간다.*/
        WHILE K <= 9 LOOP
            DBMS_OUTPUT.PUT('■'||K|| ' * ' || I || ' = ' || LPAD(I*K,3,'0'));
            K:=K+1;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('■');
        K:=2;
        I:=I+1;
    END LOOP;
END;
/
--------------------------------------------------------------------------------------------
ACCEPT NUM PROMPT '숫자 입력?'
DECLARE
    NUM NUMBER := &NUM;   /* C언어에서 scanf랑 같은 느낌 */
BEGIN
    WHILE 1=1 LOOP
        DBMS_OUTPUT.PUT_LINE('NUM는 ' || NUM);
        NUM := NUM -1;
        /*IF MOD(NUM,2) = 0 THEN
            EXIT;
        END IF;*/
        EXIT WHEN MOD (NUM,2) =0;
    END LOOP;
END;
/


------------------------------------------------------------
ACCEPT NUM PROMPT '끝 숫자 입력?'
DECLARE
    HAP NUMBER :=0;
    NUM NUMBER :=&NUM;
BEGIN
    LOOP
        HAP:=HAP+NUM;
        NUM:=NUM-1;
       /* IF NUM=0  THEN
            EXIT;
        END IF;*/
        EXIT WHEN NUM=0;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(HAP);
END;
/
------------------------------------------------------------
