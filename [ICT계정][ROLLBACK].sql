/*===============================================*/
--DDL/DCL ���� �Ϸ��. 
/*===============================================*/

SELECT * FROM MEMBER;

BEGIN
    ---���� �۾�
    UPDATE MEMBER SET NAME='�̱浿2' WHERE USERNAME='LEE';
    --���� �۾�
    DELETE MEMBER WHERE USERNAME='PARK';
    --�Է� �۾�:�����߻�
    INSERT INTO MEMBER VALUES('CHOI','1234','11',SYSDATE);
    COMMIT;
    
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; --������ �۾��� ��ҵȴ� 2�� ��� ��.
        DBMS_OUTPUT.PUT_LINE('��� �۾��� ��� �Ǿ����');
END;
