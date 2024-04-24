DESC MEMBER;
SELECT * FROM MEMBER;

create or replace PROCEDURE sp_ins_member
(username in  member.username%type,
password member.password%type,
name member.name%type,
rtval out nvarchar2)
is
begin
    insert into member values(username,password,name,default);
    if sql%found then
        rtval := '입력 성공';
        commit;
    end if;
    exception
    when others then
        rollback;
        rtval:='입력 실패 : 중복키나 혹은 입력값이 너무 커요';
end;
/


--업데이트 용
/*=======================================================================================*/
/*=======================================================================================*/
/*=======================================================================================*/
--수정할때는 변수명하고 컬럼명이 같으면 안된다.
create or replace PROCEDURE sp_udt_member
(username_ in  member.username%type,
password_ member.password%type,
name_ member.name%type,
rtval out NCHAR)
is
begin
    UPDATE member SET password=password_, name=name_ WHERE username = username_;
    if sql%found then
        rtval := 'SUCCESS';
        commit;
    ELSE--존재하지 않는 아이디(pk)로 수정시
        rtval := 'FAIL:NOT EXIST USERNAME';
    end if;
    exception
    when others then
    
        rollback;
        rtval:='FAIL:TO MUCH VALUE';
end;
/




--넘버는 호스트 변수 선언할때 자릿수 지정하면 에러난다.
var rtval NVARCHAR2(200)
EXEC SP_INS_MEMBER('PARK','1234','박길동',:rtval);



EXEC SP_udt_MEMBER('CHOI','1234','최길동',:rtval);
PRINT rtval
SELECT * FROM MEMBER;





--삭제 용
/*=======================================================================================*/
/*=======================================================================================*/
/*=======================================================================================*/
--수정할때는 변수명하고 컬럼명이 같으면 안된다.

CREATE TABLE BOARD(
    NO NUMBER PRIMARY KEY,
    TITLE NVARCHAR2(10) NOT NULL,
    CONTENT NVARCHAR2(100) NOT NULL,
    POSTDATE DATE DEFAULT SYSDATE,
    USERNAME VARCHAR2(10) REFERENCES MEMBER(USERNAME)
)
SELECT * FROM BOARD



INSERT INTO BOARD VALUES(SEQ_BOARD.NEXTVAL,'TITLE','CONTENT',SYSDATE,'KIM');
COMMIT;

create or replace PROCEDURE sp_del_member
(username_ in  member.username%type,
rtval out number)
is
begin
    DELETE member where username_=username;
    if sql%found then
        DBMS_OUTPUT.PUT_LINE(username_ || '가 삭제 되었어요');
        rtval := SQL%ROWCOUNT;
        commit;
    ELSE--존재하지 않는 아이디(pk)로 삭제시
        DBMS_OUTPUT.PUT_LINE(username_ || '가 존재하지 않아요');
        rtval := 0;
    end if;
    exception
    when others then
        rollback;
         DBMS_OUTPUT.PUT_LINE('자식이 참조하고 있어요');
         rtval := -1;
end;
/

VAR RTVAL2 NUMBER
EXEC SP_DEL_MEMBER('CHOI',:rtval2);

EXEC SP_DEL_MEMBER('KIM',:rtval2);
PRINT RTVAL2




/*
	OUT 파라미터값
		-회원인 경우 : 1
		-아이디는 일치하나 비번이 불일치: 0
		-아이디 불일치 : -1
*/

create or replace PROCEDURE SP_ISMEMBER
(username_ in  member.username%type,
password_ in  member.password%type,
rtval out number)
is
    flag NUMBER(1);
begin
    SELECT COUNT(*) INTO flag FROM MEMBER WHERE username = username_;
    IF FLAG=0 THEN
        rtval:=-1;
    ELSE --아이디 일치
        SELECT COUNT(*) INTO flag FROM MEMBER WHERE username = username_ AND password = password_;
        IF flag=0 THEN--비번 불일치
            rtval :=0;
        ELSE--회원
            rtval :=1;
        END IF;
    END IF;
end;
/

EXEC SP_ISMEMBER('KIM','1234',:rtval2); --일치하는 경우 1
EXEC SP_ISMEMBER('KIM','12334',:rtval2);  --비밀번호 불일치 경우 0
EXEC SP_ISMEMBER('KIㅇM','12334',:rtval2); --회원 불일치 -1
PRINT RTVAL2




--TRIGER 테이블.
/*=======================================================================================*/
/*=======================================================================================*/
--이벤트가 발생하는 곳
CREATE TABLE EVENTTBL(
    NO NUMBER PRIMARY KEY,
    MESSAGE NVARCHAR2(10)
);

CREATE TABLE TARGETTBL(
    EVENT NVARCHAR2(10),
    POSTDATE DATE DEFAULT SYSDATE
);
--FOR EACH ROW 행 단위 트리거. DEFAULT는 문단 단위

SELECT * FROM EVENTTBL;
INSERT INTO EVENTTBL VALUES(1,'입력');
SELECT * FROM TARGETTBL;
UPDATE EVENTTBL SET MESSAGE='입력';

CREATE TRIGGER TRG_EVENTTBL
AFTER INSERT OR DELETE OR UPDATE ON EVENTTBL
FOR EACH ROW
DECLARE

BEGIN
    IF INSERTING THEN
        INSERT INTO TARGETTBL VALUES('INSERT',SYSDATE);
    ELSIF DELETING THEN
        INSERT INTO TARGETTBL VALUES('DELETE',SYSDATE);
    ELSIF UPDATING THEN
        INSERT INTO TARGETTBL VALUES('UPDATE',SYSDATE);
    END IF;
END;
/


DROP TRIGGER TRG_EVENTTBL2

CREATE TRIGGER TRG_EVENTTBL2
BEFORE INSERT
ON EVENTTBL
FOR EACH ROW
DECLARE
BEGIN
    IF TO_CHAR(SYSDATE,'DY') = '금' OR TO_CHAR(SYSDATE,'HH24')>=23 THEN
        RAISE_APPLICATION_ERROR(-20001,'금요일 혹은 정오 23시 이후에는 입력 불가');
    ELSE
        INSERT INTO TARGETTBL VALUES('조건부합',SYSDATE);
    END IF;
END;
/

SELECT * FROM TARGETTBL;
INSERT INTO EVENTTBL VALUES(3,'입력');
