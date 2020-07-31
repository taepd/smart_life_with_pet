-- 회원
CREATE TABLE USER (
	USERID   VARCHAR(40)  NOT NULL, -- USERID
	NICK     VARCHAR(20)  NOT NULL, -- 닉네임
	PWD      VARCHAR(5000) NULL,     -- 비밀번호
	LOC      VARCHAR(300) NOT NULL, -- 위치정보
	CPNUMBER VARCHAR(40)  NOT NULL, -- 휴대전화번호
	ENABLED  VARCHAR(4)   NOT NULL, -- ENABLED
	UIMG     VARCHAR(500) NULL,     -- 프로필 사진
	RTIME    TIMESTAMP    NOT NULL, -- 가입일시
	LAT      VARCHAR(40)  NULL,     -- 위도
	LON      VARCHAR(40)  NULL,     -- 경도
	POINT    INT          NULL ,     -- 포인트
	SNSSTYPE VARCHAR(20)     
);

-- 회원
ALTER TABLE USER
	ADD
		CONSTRAINT PK_USER -- 회원 기본키
		PRIMARY KEY (
			USERID -- USERID
		);

-- 반려동물
CREATE TABLE PET (
	PETINDEX  INT  PRIMARY KEY AUTO_INCREMENT, -- 동물식별번호
	USERID    VARCHAR(40)  NOT NULL, -- USERID
	MCATEGORY VARCHAR(20)  NOT NULL, -- 대분류코드
	SCATEGORY VARCHAR(20)  NOT NULL, -- 소분류코드
	PETNAME   VARCHAR(20)  NOT NULL, -- 반려동물명
	SEX       VARCHAR(20)  NOT NULL, -- 성별
	AGE       INT          NOT NULL, -- 나이
	SIZE      VARCHAR(20)  NOT NULL, -- 크기
	WEIGHT    VARCHAR(40)  NULL,     -- 몸무게
	HLENGTH   VARCHAR(40)  NULL,     -- 털길이
	NSTATE    VARCHAR(4)   NOT NULL, -- 중성화여부
	PETIMG    VARCHAR(500) NULL,     -- 사진
	MEMO      VARCHAR(200) NULL      -- 메모
);


-- 동물카테고리/대분류
CREATE TABLE MAINCATEGORY (
	MCATEGORY VARCHAR(20) NOT NULL, -- 대분류코드
	MCANAME   VARCHAR(20) NOT NULL  -- 대분류명
);

-- 동물카테고리/대분류
ALTER TABLE MAINCATEGORY
	ADD
		CONSTRAINT PK_MAINCATEGORY -- 동물카테고리/대분류 기본키
		PRIMARY KEY (
			MCATEGORY -- 대분류코드
		);

-- 동물 병원 이용 기록
CREATE TABLE MRECORD (
	MINDEX   INT         PRIMARY KEY AUTO_INCREMENT, -- 글번호
	PETINDEX INT         NOT NULL, -- 동물식별번호
	USERID   VARCHAR(40) NOT NULL, -- USERID
	VDATE    TIMESTAMP   NOT NULL, -- 방문날짜
	VREASON  VARCHAR(60) NOT NULL, -- 방문 사유
	HNAME    VARCHAR(20) NOT NULL  -- 병원명
);


-- 게시글
CREATE TABLE BLOG (
	BINDEX  INT            PRIMARY KEY AUTO_INCREMENT, -- 글번호
	PETINDEX VARCHAR(200)           NOT NULL, -- 동물식별번호
	USERID   VARCHAR(40)   NOT NULL, -- USERID
	NICK VARCHAR(20) NOT NULL,
	BLIKE    INT           NULL,     -- 추천수(보류)
	TITLE    VARCHAR(100)  NOT NULL, -- 제목
	CONTENT  VARCHAR(4000) NOT NULL, -- 내용
	RTIME    TIMESTAMP     NOT NULL, -- 등록시간
	DELSTATE VARCHAR(4)    NOT NULL, -- 삭제유무
	COUNT    INT           NOT NULL, -- 조회수
	PIMG     VARCHAR(500) NULL       -- 이미지
);



-- 댓글
CREATE TABLE BLOGCOMMENT (
	BCINDEX INT          PRIMARY KEY AUTO_INCREMENT, -- 댓글번호
	BINDEX  INT          NOT NULL, -- 글번호
	USERID  VARCHAR(40)  NOT NULL, -- USERID
	NICK VARCHAR(20) 	 NOT NULL,
	BCLIKE  INT          NULL,     -- 추천수
	CONTENT VARCHAR(400) NOT NULL, -- 내용
	SCSTATE VARCHAR(4)   NOT NULL, -- 비밀유무
	RTIME   TIMESTAMP    NOT NULL, -- 등록시간
	REFER   INT          NOT NULL, -- refer
	DEPTH   INT          NOT NULL, -- depth
	STEP    INT          NOT NULL  -- step
);



-- 쪽지
CREATE TABLE MESSAGE (
	MSINDEX   INT          PRIMARY KEY AUTO_INCREMENT, -- 쪽지번호
	RUSERID   VARCHAR(40)  NOT NULL, -- 받은사람ID
	SUSERID   VARCHAR(40)  NOT NULL, -- 보낸사람ID
	CONTENT   VARCHAR(100) NOT NULL, -- 쪽지내용
	SENDTIME  TIMESTAMP    NOT NULL, -- 보낸일시
	READTIME  TIMESTAMP    NOT NULL, -- 읽은일시
	READSTATE VARCHAR(4)   NULL      -- 읽음여부
);



-- 일정
CREATE TABLE SCHEDULE (
	SINDEX      INT          PRIMARY KEY AUTO_INCREMENT, -- 글번호
	PETINDEX    INT          NOT NULL, -- 동물식별번호
	USERID      VARCHAR(40)  NOT NULL, -- USERID
	TITLE       VARCHAR(60)  NOT NULL, -- 제목
	CONTENT     VARCHAR(400) NOT NULL, -- 내용
	IS_COMPLETE VARCHAR(4)   NULL,     -- 완료여부
	START  TIMESTAMP    NOT NULL, -- 시작날짜
	END    TIMESTAMP    NULL,     -- 마감날짜
	ALLDAY TINYINT DEFAULT 0, -- 하루종일 여부
	DAYSOFWEEK VARCHAR(40) NULL, -- 반복주기
	ADNCDNOTI   VARCHAR(40)  NULL,   -- 미리알림
    COLOR VARCHAR(20) NULL,
    GROUPID VARCHAR(100) NULL
);

-- 질의응답
CREATE TABLE QNA (
   QAINDEX  INT          PRIMARY KEY AUTO_INCREMENT, -- 글번호
   USERID   VARCHAR(40)  NULL,     -- USERID
   TITLE    VARCHAR(100) NOT NULL, -- 제목
   QATIME   VARCHAR(40)  NOT NULL, -- 등록시간
   COUNT    INT          NOT NULL, -- 조회수
   SCSTATE  VARCHAR(4)   NOT NULL, -- 비밀유무
   CONTENT  VARCHAR(500) NOT NULL, -- 내용
   FILENAME VARCHAR(100) NULL,     -- 첨부파일
   AWSTATE  VARCHAR(20)  NULL,  -- 답변완료여부
   REPLYCONTENT VARCHAR(500) NOT NULL -- 관리자 답글내용
    
);

-- QNA 댓글
CREATE TABLE QnaCOMMENT (
   QNAINDEX INT          PRIMARY KEY AUTO_INCREMENT, -- 댓글번호
   QAINDEX  INT          NOT NULL, -- 글번호
   USERID  VARCHAR(40)  NOT NULL, -- USERID
   QNALIKE  INT          NULL,     -- 추천수(보류)
   CONTENT VARCHAR(400) NOT NULL, -- 내용
   SCSTATE VARCHAR(4)   NOT NULL, -- 비밀유무
   RTIME   TIMESTAMP    NOT NULL, -- 등록시간
   REFER   INT          NOT NULL, -- refer
   DEPTH   INT          NOT NULL, -- depth
   STEP    INT          NOT NULL  -- step
);

-- user_role
CREATE TABLE USERROLE (
	USERID VARCHAR(40) NOT NULL, -- USERID
	ROLEID VARCHAR(40) NOT NULL  -- ROLEID
);

-- roles
CREATE TABLE ROLES (
	ROLEID   VARCHAR(40) NOT NULL, -- ROLEID
	ROLENAME VARCHAR(40) NOT NULL  -- ROLENAME
);

-- roles
ALTER TABLE ROLES
	ADD
		CONSTRAINT PK_ROLES -- roles 기본키
		PRIMARY KEY (
			ROLEID -- ROLEID
		);

-- 기부게시판
CREATE TABLE DONATION (
	DINDEX  INT  PRIMARY KEY AUTO_INCREMENT, -- 기부글번호
	TITLE   VARCHAR(120)  NOT NULL, -- 제목
	CONTENT VARCHAR(4000) NOT NULL, -- 내용
	DOBJECT VARCHAR(60)   NOT NULL, -- 기부대상
	RTIME   TIMESTAMP     NOT NULL, -- 등록일시
	CTIME   TIMESTAMP     NULL,
	GCOLL   INT           NOT NULL, -- 목표기부금
	CCOLL   INT           NOT NULL, -- 현재기부금
	DSTATE VARCHAR(4) 	  NOT NULL, -- 기부완료여부
	DIMG    VARCHAR(500)  NULL
		
);

-- 기부댓글
CREATE TABLE DONATIONCOMMENT (
	DCINDEX INT          PRIMARY KEY AUTO_INCREMENT, -- 댓글번호
	DINDEX  INT          NOT NULL, -- 기부글번호
	USERID  VARCHAR(40)  NOT NULL, -- USERID
	RPLIKE  INT          NULL,     -- 추천수(보류)
	CONTENT VARCHAR(400) NOT NULL, -- 내용
	SCSTATE VARCHAR(4)   NOT NULL, -- 비밀유무
	RTIME   TIMESTAMP    NOT NULL, -- 등록시간
    NICK VARCHAR(20) NOT NULL, -- 닉네임
    REFER INT NOT NULL,
    DEPTH INT NOT NULL,
    STEP INT NOT NULL
	
);


CREATE TABLE DONATIONRECORD (
	DRINDEX INT          PRIMARY KEY AUTO_INCREMENT, -- 기부번호
	DINDEX  INT          NOT NULL, -- 기부글번호
	USERID  VARCHAR(40)  NOT NULL, -- USERID, 기부자
	DCOLL 	INT   		 NOT NULL, -- 기부금액
	DTIME   TIMESTAMP    NOT NULL -- 기부시간
	
);

-- 결제(돈내고 한 것만)
CREATE TABLE PAY (
	PINDEX  INT   PRIMARY KEY AUTO_INCREMENT, -- 결제번호
	USERID  VARCHAR(40) NOT NULL, -- USERID
	PAMOUNT INT         NULL,     -- 결제금액
	PTIME   DATE        NULL,     -- 결제일시
	PTYPE   VARCHAR(20) NULL      -- 결제유형
);


-- 즐겨찾기/게시글
CREATE TABLE BLIKE (
	BMINDEX INT   PRIMARY KEY AUTO_INCREMENT, -- 즐겨찾기번호
	USERID  VARCHAR(40) NOT NULL, -- USERID
	BINDEX  INT         NOT NULL  -- 글번호
);



-- 즐겨찾기/반려동물
CREATE TABLE PETLIKE (
	LINDEX   INT   PRIMARY KEY AUTO_INCREMENT, -- 즐겨찾기번호
	USERID   VARCHAR(40) NOT NULL, -- USERID
	PETINDEX INT         NOT NULL  -- 동물식별번호
);



-- 동물카테고리/소분류
CREATE TABLE SUBCATEGORY (
	SCATEGORY VARCHAR(20) NOT NULL, -- 소분류코드
	MCATEGORY VARCHAR(20) NOT NULL, -- 대분류코드
	SCANAME   VARCHAR(40) NULL      -- 소분류명
);

-- 동물카테고리/소분류
ALTER TABLE SUBCATEGORY
	ADD
		CONSTRAINT PK_SUBCATEGORY -- 동물카테고리/소분류 기본키2
		PRIMARY KEY (
			SCATEGORY -- 소분류코드
		);

-- 포인트내역
CREATE TABLE POINT (
	PTINDEX  INT    PRIMARY KEY AUTO_INCREMENT, -- 포인트내역번호
	USERID  VARCHAR(40) NULL,     -- USERID
	PTYPE   VARCHAR(4)  NULL,     -- 포인트 유형
	PCOUNT  INT         NULL,     -- 포인트 수량
	PAMOUNT INT         NULL,     -- 포인트 총량
	PDATE  TIMESTAMP    NULL,      -- 포인트 일시
    PINDEX INT 			NULL,	  -- 결제 번호	
    DRINDEX INT			NULL	  -- 기부 번호
);


-- 반려동물
ALTER TABLE PET
	ADD
		CONSTRAINT FK_USER_TO_PET -- 회원 -> 반려동물
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- 반려동물
ALTER TABLE PET
	ADD
		CONSTRAINT FK_MAINCATEGORY_TO_PET -- 동물카테고리/대분류 -> 반려동물
		FOREIGN KEY (
			MCATEGORY -- 대분류코드
		)
		REFERENCES MAINCATEGORY ( -- 동물카테고리/대분류
			MCATEGORY -- 대분류코드
		)
		ON DELETE CASCADE;

-- 반려동물
ALTER TABLE PET
	ADD
		CONSTRAINT FK_SUBCATEGORY_TO_PET -- 동물카테고리/소분류 -> 반려동물
		FOREIGN KEY (
			SCATEGORY -- 소분류코드
		)
		REFERENCES SUBCATEGORY ( -- 동물카테고리/소분류
			SCATEGORY -- 소분류코드
		)
		ON DELETE CASCADE;

-- 소분류
ALTER TABLE SUBCATEGORY
	ADD
		CONSTRAINT FK_MAINCATEGORY_TO_SUBCATEGORY -- 
		FOREIGN KEY (
			MCATEGORY -- 대분류코드
		)
		REFERENCES MAINCATEGORY ( -- 대분류
			MCATEGORY -- 대분류코드
		)
		ON DELETE CASCADE;

-- 동물 병원 이용 기록
ALTER TABLE MRECORD
	ADD
		CONSTRAINT FK_PET_TO_MRECORD -- 반려동물 -> 동물 병원 이용 기록
		FOREIGN KEY (
			PETINDEX -- 동물식별번호
		)
		REFERENCES PET ( -- 반려동물
			PETINDEX -- 동물식별번호
		)
		ON DELETE CASCADE;

-- 동물 병원 이용 기록
ALTER TABLE MRECORD
	ADD
		CONSTRAINT FK_USER_TO_MRECORD -- 회원 -> 동물 병원 이용 기록
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;



-- 게시글
ALTER TABLE BLOG
	ADD
		CONSTRAINT FK_USER_TO_BLOG -- 회원 -> 게시글2
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- 댓글
ALTER TABLE BLOGCOMMENT
	ADD
		CONSTRAINT FK_USER_TO_BLOGCOMMENT -- 회원 -> 댓글2
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- 블로그댓글
ALTER TABLE BLOGCOMMENT
	ADD
		CONSTRAINT FK_BLOG_TO_BLOGCOMMENT -- 게시글 -> 댓글2
		FOREIGN KEY (
			BINDEX -- 글번호
		)
		REFERENCES BLOG ( -- 게시글
			BINDEX -- 글번호
		)
		ON DELETE CASCADE;


-- QA댓글 USER FK
ALTER TABLE QNACOMMENT
   ADD
      CONSTRAINT FK_USER_TO_QNACOMMENT -- 회원 -> 댓글2
      FOREIGN KEY (
         USERID -- USERID
      )
      REFERENCES USER ( -- 회원
         USERID -- USERID
      )
      ON DELETE CASCADE;

-- QA댓글 QNA FK
ALTER TABLE QNACOMMENT
   ADD
      CONSTRAINT FK_QNA_TO_QNACOMMENT -- 게시글 -> 댓글2
      FOREIGN KEY (
         QAINDEX -- 글번호
      )
      REFERENCES QNA ( -- 게시글
         QAINDEX -- 글번호
      )
      ON DELETE CASCADE;


-- 쪽지
ALTER TABLE MESSAGE
	ADD
		CONSTRAINT FK_USER_TO_MESSAGE -- 회원 -> 쪽지
		FOREIGN KEY (
			RUSERID -- 받은사람ID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- 쪽지
ALTER TABLE MESSAGE
	ADD
		CONSTRAINT FK_USER_TO_MESSAGE_2 -- 회원 -> 쪽지
		FOREIGN KEY (
			SUSERID -- 보낸사람ID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- 일정
ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT FK_PET_TO_SCHEDULE -- 반려동물 -> 일정
		FOREIGN KEY (
			PETINDEX -- 동물식별번호
		)
		REFERENCES PET ( -- 반려동물
			PETINDEX -- 동물식별번호
		)
		ON DELETE CASCADE;

-- 일정
ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT FK_USER_TO_SCHEDULE -- 회원 -> 일정
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- 추천
ALTER TABLE RECOM
	ADD
		CONSTRAINT FK_USER_TO_RECOM -- 회원 -> 추천
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- 추천
ALTER TABLE RECOM
	ADD
		CONSTRAINT FK_BLOG_TO_RECOM -- 게시글 -> 추천
		FOREIGN KEY (
			BINDEX -- 글번호
		)
		REFERENCES BLOG ( -- 게시글
			BINDEX -- 글번호
		)
		ON DELETE CASCADE;

-- 추천
ALTER TABLE RECOM
	ADD
		CONSTRAINT FK_COMMENT_TO_RECOM -- 댓글 -> 추천
		FOREIGN KEY (
			BCINDEX -- 댓글번호
		)
		REFERENCES BLOGCOMMENT ( -- 댓글
			BCINDEX -- 댓글번호
		)
		ON DELETE CASCADE;

-- 질의응답
ALTER TABLE QNA
	ADD
		CONSTRAINT FK_USER_TO_QNA -- 회원 -> 질의응답2
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- user_role
ALTER TABLE USERROLE
	ADD
		CONSTRAINT FK_USER_TO_USERROLE -- 회원 -> user_role
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- user_role
ALTER TABLE USERROLE
	ADD
		CONSTRAINT FK_ROLES_TO_USERROLE -- roles -> user_role
		FOREIGN KEY (
			ROLEID -- ROLEID
		)
		REFERENCES ROLES ( -- roles
			ROLEID -- ROLEID
		)
		ON DELETE CASCADE;

-- 결제(돈내고 한 것만)
ALTER TABLE PAY
	ADD
		CONSTRAINT FK_USER_TO_PAY -- 회원 -> 결제(돈내고 한 것만)
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- 결제(돈내고 한 것만)
ALTER TABLE PAY
	ADD
		CONSTRAINT FK_DONATION_TO_PAY -- 기부게시판 -> 결제(돈내고 한 것만)
		FOREIGN KEY (
			DINDEX -- 기부글번호
		)
		REFERENCES DONATION ( -- 기부게시판
			DINDEX -- 기부글번호
		)
		ON DELETE CASCADE;

-- 즐겨찾기/게시글
ALTER TABLE BLIKE
	ADD
		CONSTRAINT FK_USER_TO_BLIKE -- 회원 -> 즐겨찾기/게시글
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- 즐겨찾기/게시글
ALTER TABLE BLIKE
	ADD
		CONSTRAINT FK_BLOG_TO_BLIKE -- 게시글 -> 즐겨찾기/게시글
		FOREIGN KEY (
			BINDEX -- 글번호
		)
		REFERENCES BLOG ( -- 게시글
			BINDEX -- 글번호
		)
		ON DELETE CASCADE;

-- 즐겨찾기/반려동물
ALTER TABLE PETLIKE
	ADD
		CONSTRAINT FK_PET_TO_PETLIKE -- 반려동물 -> 즐겨찾기/반려동물
		FOREIGN KEY (
			PETINDEX -- 동물식별번호
		)
		REFERENCES PET ( -- 반려동물
			PETINDEX -- 동물식별번호
		)
		ON DELETE CASCADE;

-- 즐겨찾기/반려동물
ALTER TABLE PETLIKE
	ADD
		CONSTRAINT FK_USER_TO_PETLIKE -- 회원 -> 즐겨찾기/반려동물
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- 포인트내역
ALTER TABLE POINT
	ADD
		CONSTRAINT FK_USER_TO_POINT -- 회원 -> 포인트내역
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;


-- 기부댓글/유저
ALTER TABLE DONATIONCOMMENT
	ADD
		CONSTRAINT FK_USER_TO_DONATIONCOMMENT -- 회원 -> 즐겨찾기/게시글
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- 기부댓글 후원글번호
ALTER TABLE DONATIONCOMMENT
	ADD
		CONSTRAINT FK_DONATION_TO_DONATIONCOMMENT -- 
		FOREIGN KEY (
			DINDEX -- 글번호
		)
		REFERENCES DONATION ( -- 게시글
			DINDEX -- 글번호
		)
		ON DELETE CASCADE;
        
-- 기부내역 USER에서 USERID
ALTER TABLE DONATIONRECORD
	ADD
		CONSTRAINT FK_USER_TO_DONATIONRECORD -- 
		FOREIGN KEY (
			USERID -- 기부자
		)
		REFERENCES USER ( -- 게시글
			USERID -- 글번호
		)
		ON DELETE CASCADE;

-- 기부내역 DONATION에서 DINDEX
ALTER TABLE DONATIONRECORD
	ADD
		CONSTRAINT FK_DONATION_TO_DONATIONRECORD -- 
		FOREIGN KEY (
			DINDEX -- 기부자
		)
		REFERENCES DONATION ( -- 게시글
			DINDEX -- 글번호
		)
		ON DELETE CASCADE;

drop trigger insert_userrole;

-- 회원 가입 시 권한부여 해주는 트리거
delimiter $$

create trigger insert_userrole
after insert on user
for each row
BEGIN
    IF(NEW.userid = 'admin') THEN  
        insert into userrole 
        values
        (NEW.userid ,'1'),
        (NEW.userid ,'2');

    ELSE
        insert into userrole 
        values
        (NEW.userid ,'2');
    END IF;
END $$

delimiter ;

-- 트리거 생성을 하려면 루트계정에서 아래 명령 실행 (오류 1419 관련)
SET Global log_bin_trust_function_creators='ON';

-- DB 리셋 후 입력할 기본 데이터
# roles테이블 권한 추가
insert into roles values ('1', 'ROLE_ADMIN'),
				         ('2', 'ROLE_USER');
commit;

# admin계정 추가(비번 1004)
INSERT INTO user (USERID, NICK, PWD, LOC, CPNUMBER, ENABLED, rtime) 
VALUES ('admin', 'admin', '$2a$10$NjV33E7sf0/W1xvBB57wGezZtZZ6r/iOABFnniAZFe9ca.Bhtl0RO', '1', '1', '1',now());
# a 계정 추가(비번 1004)
INSERT INTO user (USERID, NICK, PWD, LOC, CPNUMBER, ENABLED, rtime) 
VALUES ('a', 'a', '$2a$10$NjV33E7sf0/W1xvBB57wGezZtZZ6r/iOABFnniAZFe9ca.Bhtl0RO', '1', '1', '1',now());

commit;

# 동물 대분류 카테고리 추가
INSERT INTO `2sotto`.`maincategory` (`MCATEGORY`, `MCANAME`) VALUES ('1', '개'), ('2', '고양이');
commit;

# 동물 소분류 카테고리 추가
INSERT INTO `2sotto`.`subcategory` (`SCATEGORY`, `MCATEGORY`, `SCANAME`) 
VALUES ('1', '1', '시츄'),('2', '1', '포메라니안'),('3', '1', '진돗개'),
       ('4', '1', '치와와'), ('5', '2', '페르시안'),('6', '2', '러시안블루'),
	   ('7', '2', '코리안숏헤어');
commit;

-- 기본 입력 데이터 끝

-- 타입 변경
-- ALTER TABLE [TABLE명] MODIFY [컬럼명] [타입];

-- 자동 증가(시퀀스) 초기화
-- ALTER TABLE [TABLE명] AUTO_INCREMENT = [시작할 값];

desc blog;
desc pet;
desc maincategory;
desc message;
desc user;
desc schedule;
desc qna;
alter table user modify lon varchar(200) null;

select * from roles;
select * from userrole;
select * from message;
select * from user;
select * from blog;
select * from blike;
select * from pet;
select * from maincategory;
select * from subcategory; 
select * from donation;
select * from schedule;
select * from petlike;
select * from blogcomment;
select * from point;
select * from mrecord;
select * from qna;
select * from qnacomment;
desc qna;
alter table qna modify awstate varchar(20) null;

delimiter $$

create trigger completeDonationByTime
after insert on donation
for each row
BEGIN	
   CREATE EVENT IF NOT EXISTS completeDonatoinByTime
	ON SCHEDULE AT 
		'2020-07-13 20:00:00'
    ON COMPLETION NOT PRESERVE
    ENABLE
    COMMENT '기부 종료'
    DO 
    update donation set dstate = 'N' where dindex =2;
END $$

delimiter ;

select ctime from donation where dindex=2;

ALTER TABLE user modify SNSTYPE varchar(50);	

SET @ROWNUM:= 0;
SELECT * FROM (SELECT @ROWNUM := @ROWNUM +1 ROWNUM, M.*, p.petname FROM
MRECORD M join PET P ON M.USERID = P.USERID, (SELECT @ROWNUM:=0) r where m.userid='a') S WHERE ROWNUM
BETWEEN 1 AND 5;

select M.*, p.petname FROM
MRECORD M join PET P ON M.USERID = P.USERID where m.userid='a';

select * from mrecord;
select * from pet;
select * from user;


-- 두 좌표값(경/위도) 사이의 거리 구하는 함수(mysql 버전)
DROP FUNCTION IF EXISTS 2sotto.GOOGLE_DISTANCE;
delimiter $$
CREATE FUNCTION GOOGLE_DISTANCE (
  LAT1 FLOAT, 
  LNG1 FLOAT,
  LAT2 FLOAT,
  LNG2 FLOAT 
)
  RETURNS FLOAT
BEGIN
  DECLARE fEARTH_R FLOAT;
  DECLARE fPIE FLOAT;
  DECLARE fRAD FLOAT;
  DECLARE radLAT1 FLOAT;
  DECLARE radLAT2 FLOAT;
  DECLARE radDIST FLOAT;
  DECLARE fDIST FLOAT;
  
  SET fEARTH_R = 6371000.0;
  SET fPIE= 3.141592653589793;
  SET fRAD = 0.0;
  SET radLAT1 = 0.0;
  SET radLAT2 = 0.0;
  SET radDIST = 0.0;
  SET fDIST = 0.0;
  
  SET fRAD = fPIE / 180;
  SET radLAT1 = fRAD * LAT1;
  SET radLAT2 = fRAD * LAT2;
  SET radDIST = fRAD * ( LNG1 - LNG2 );
  SET fDIST = SIN( radLAT1 ) * SIN( radLAT2 );
  SET fDIST = fDIST + COS( radLAT1 ) * COS( radLAT2 ) * COS( radDIST );


  RETURN ((fEARTH_R * ACOS(ROUND(fDIST,10)))/1000);

END$$

delimiter ;


-- 같은 품종의 동물 친구 추천
select * from pet
where mcategory = 1 and userid not in ('admin')
order by rand() limit 1;

-- 비슷한 나이대의 동물 친구 추천
select * from pet 
where (age between 0 and 500) and userid not in('admin')
order by rand() limit 1;

-- 근처에 사는 동물 친구 추천
select p.*
from pet p join user u on p.userid = u.userid
where round((google_distance(u.lat,u.lon, 37.4992037464339, 127.06309937724)),0) < 5 and p.userid not in('a')
order by rand() limit 3;

select * from user;


select p.*, s.SCANAME as scaname, m.MCANAME as mcaname, u.nick as nick
from pet p
left outer join user u on p.userid = u.userid
left outer join subcategory s on p.SCATEGORY = s.SCATEGORY 
left outer join maincategory m on p.MCATEGORY = m.MCATEGORY
where petindex = 7;

-- 반려동물 petindex 키워드 검색 쿼리
select * from blog where concat(',',petindex,',') like '%,1,%';

select p.petindex, p.userid, p.petname, p.petimg, s.sindex, s.title, s.start
			from pet p join schedule s 
			on p.USERID = s.USERID and p.PETINDEX = s.PETINDEX
			where p.userid = 'a' and p.petname = '백호'
			order by start;

select * from subcategory
where MCATEGORY='1'order by SCATEGORY*1;

desc subcategory;


CREATE TABLE ChatMember (
	MEM_NUMBER   VARCHAR(40)  NOT NULL, -- 번호
	ROOM_NUMBER     VARCHAR(20)  NOT NULL, -- 번호
	USER_EMAIL      VARCHAR(5000) NULL,     -- 이메일
	USER_NICKNAME      VARCHAR(300) NULL -- 닉네임
	  
);
drop table ChatMember;

CREATE TABLE ChatRoom (
	ROOM_NUMBER   INT  PRIMARY KEY AUTO_INCREMENT,  -- 번호
	ROOM_TITLE     VARCHAR(20)  NOT NULL, -- 제목
	USER_EMAIL      VARCHAR(5000) NOT NULL,     -- 이메일
	ROOM_COUNT      VARCHAR(300) NOT NULL, -- 카운트
	ROOM_SECRET VARCHAR(40)  NOT NULL, -- 찾기
	ROOM_PWD  VARCHAR(4)   NULL, -- 비번
	USER_NICKNAME VARCHAR(500) NOT NULL,     -- 닉네임
	USER_IMG    TIMESTAMP    NULL, -- 이미지
	CURRENT_COUNT      VARCHAR(40)  NULL     -- 현재카운트
	
);


-- 블로그 글 좋아요하면 blike테이블에 인서트 후에 blog 테이블 blike +1 하는 트리거
DELIMITER $$
CREATE TRIGGER UPDATE_BLIKE_PLUS
AFTER INSERT ON blike
FOR EACH ROW
BEGIN
UPDATE BLOG
SET
BLIKE = BLIKE + 1
WHERE BINDEX = NEW.BINDEX;

END $$
DELIMITER ;

-- 블로그 글 좋아요 취소하면 blike테이블에 인서트 후에 blog 테이블 blike -1 하는 트리거
DELIMITER $$
CREATE TRIGGER UPDATE_BLIKE_MINUS
BEFORE DELETE ON blike
FOR EACH ROW
BEGIN
UPDATE BLOG
SET
BLIKE = BLIKE - 1
WHERE BINDEX = OLD.BINDEX;

END $$
DELIMITER ;


drop trigger UPDATE_BLIKE_MINUS;

SHOW TRIGGERS;

alter table schedule add groupId varchar(100);
alter table message modify readtime timestamp null;

 select (select count(*) from pet where MCATEGORY = 1) dogCount, (select count(*) from pet where MCATEGORY = 2) catCount from dual;

set @sum :=0;
select (date_format(p.pdate, '%Y-%m-%d')) date, sum(p.pcount) pcount from point p where ptype = '결제' group by date;

select (date_format(p.pdate, '%Y-%m-%d')) date, sum(p.pcount) pcount from point p where ptype = '결제' group by date;

select * from point where ptype='결제';
select * from pay;

select (date_format(rtime, '%Y-%m-%d')) 가입일, count(*) '가입자 수' from user group by 가입일 order by 가입일;

select p.petindex, p.userid, p.petname, p.petimg, s.sindex, s.title, s.start
			from pet p join schedule s
			on p.USERID = s.USERID and p.PETINDEX = s.PETINDEX
			where p.userid = 'a' and p.petname = '유키' and start>= SUBTIME( NOW(), TIMEDIFF( NOW(), CAST(DATE(NOW()) AS DATETIME))) 
			order by start desc limit 4;
show triggers;

select * from donation order by dindex desc;


	SET @ROWNUM:= 0;
		SELECT * FROM (SELECT @ROWNUM := @ROWNUM +1 ROWNUM, D.* FROM DONATION D, (SELECT @ROWNUM := 0) TMP 
		order by dindex desc) S WHERE ROWNUM 
		BETWEEN 1 and 5;


select * from subcategory order by SCATEGORY;
select * from user;
select * from pet;
select * from blogcomment ORDER BY REFER, STEP;