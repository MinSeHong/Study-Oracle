/*===============================================*/
--DDL/DCL 문장 완료시. 
/*===============================================*/

SELECT * FROM MEMBER;

BEGIN
    ---수정 작업
    UPDATE MEMBER SET NAME='이길동2' WHERE USERNAME='LEE';
    --삭제 작업
    DELETE MEMBER WHERE USERNAME='PARK';
    --입력 작업:에러발생
    INSERT INTO MEMBER VALUES('CHOI','1234','11',SYSDATE);
    COMMIT;
    
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; --성공한 작업이 취소된다 2개 취소 됨.
        DBMS_OUTPUT.PUT_LINE('모든 작업이 취소 되었어요');
END;
