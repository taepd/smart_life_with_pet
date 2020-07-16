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
	LOT      VARCHAR(40)  NULL,     -- 경도
	POINT    INT          NULL      -- 포인트
);

-- 회원
ALTER TABLE USER
	ADD
		CONSTRAINT PK_USER -- 회원 기본키
		PRIMARY KEY (
			USERID -- USERID
		);

-- 질의응답댓글
CREATE TABLE QNAREPLY (
	TITLE   VARCHAR(100) NOT NULL, -- 제목
	ID      VARCHAR(20)  NOT NULL, -- ID
	QAINDEX INT          NOT NULL, -- 글번호
	CONTENT VARCHAR(500) NOT NULL, -- 내용
	QARTIME TIMESTAMP  NOT NULL  -- 등록시간
);

-- 질의응답댓글
ALTER TABLE QNAREPLY
	ADD
		CONSTRAINT PK_QNAREPLY -- 질의응답댓글 기본키
		PRIMARY KEY (
			TITLE -- 제목
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

-- 접종/검사 
CREATE TABLE INSPECTION (
	IINDEX   INT          PRIMARY KEY AUTO_INCREMENT, -- 글번호
	PETINDEX INT          NOT NULL, -- 동물식별번호
	USERID   VARCHAR(40)  NOT NULL, -- USERID
	LIST     VARCHAR(100) NOT NULL, -- 항목
	VDATE    TIMESTAMP    NULL,     -- 접종예정일
	VSTATE   VARCHAR(4)   NULL,     -- 접종여부
	VCOUNT   INT          NULL      -- 잔여접종횟수
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
	PETINDEX INT           NOT NULL, -- 동물식별번호
	USERID   VARCHAR(40)   NOT NULL, -- USERID
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
	BCLIKE  INT          NULL,     -- 추천수(보류)
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
	BEGIN_DATE  TIMESTAMP    NOT NULL, -- 시작날짜
	END_DATE    TIMESTAMP    NULL,     -- 마감날짜
	CYCLE       TIME         NOT NULL, -- 주기
	ADNCDNOTI   VARCHAR(40)  NULL      -- 미리알림
);



-- 추천
CREATE TABLE RECOM (
	LIKEINDEX INT         PRIMARY KEY AUTO_INCREMENT, -- 구분번호
	USERID    VARCHAR(40) NOT NULL, -- USERID
	BINDEX    INT         NOT NULL, -- 글번호
	BCINDEX   INT         NOT NULL  -- 댓글번호
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
	AWSTATE  VARCHAR(4)   NOT NULL  -- 답변완료여부
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
CREATE TABLE DONATE (
	DINDEX  INT  PRIMARY KEY AUTO_INCREMENT, -- 기부글번호
	TITLE   VARCHAR(120)  NOT NULL, -- 제목
	CONTENT VARCHAR(4000) NOT NULL, -- 내용
	DOBJECT VARCHAR(60)   NOT NULL, -- 기부대상
	RTIME   TIMESTAMP     NOT NULL, -- 등록일시
	CTIME   TIMESTAMP     NULL,
	GCOLL   INT           NOT NULL, -- 목표기부금
	CCOLL   INT           NOT NULL, -- 현재기부금
	DIMG    VARCHAR(500)  NULL
		
);

-- 기부댓글
CREATE TABLE DONATECOMMENT (
	DCINDEX INT          PRIMARY KEY AUTO_INCREMENT, -- 댓글번호
	DINDEX  INT          NOT NULL, -- 기부글번호
	USERID  VARCHAR(40)  NOT NULL, -- USERID
	RPLIKE  INT          NULL,     -- 추천수(보류)
	CONTENT VARCHAR(400) NOT NULL, -- 내용
	SCSTATE VARCHAR(4)   NOT NULL, -- 비밀유무
	RTIME   TIMESTAMP    NOT NULL -- 등록시간
	
);


-- 결제(돈내고 한 것만)
CREATE TABLE PAY (
	PINDEX  INT   PRIMARY KEY AUTO_INCREMENT, -- 결제번호
	USERID  VARCHAR(40) NOT NULL, -- USERID
	DINDEX  INT         NOT NULL, -- 기부글번호
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
	SCANAME   VARCHAR(10) NULL      -- 소분류명
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
	PDATE  TIMESTAMP    NULL      -- 포인트 일시
);






-- 질의응답댓글
ALTER TABLE QNAREPLY
	ADD
		CONSTRAINT FK_QNA_TO_QNAREPLY -- 질의응답 -> 질의응답댓글2
		FOREIGN KEY (
			QAINDEX -- 글번호
		)
		REFERENCES QNA ( -- 질의응답
			QAINDEX -- 글번호
		)
		ON DELETE CASCADE;

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

-- 접종/검사 
ALTER TABLE INSPECTION
	ADD
		CONSTRAINT FK_PET_TO_INSPECTION -- 반려동물 -> 접종/검사 
		FOREIGN KEY (
			PETINDEX -- 동물식별번호
		)
		REFERENCES PET ( -- 반려동물
			PETINDEX -- 동물식별번호
		)
		ON DELETE CASCADE;

-- 접종/검사 
ALTER TABLE INSPECTION
	ADD
		CONSTRAINT FK_USER_TO_INSPECTION -- 회원 -> 접종/검사 
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
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
		CONSTRAINT FK_PET_TO_BLOG -- 반려동물 -> 게시글
		FOREIGN KEY (
			PETINDEX -- 동물식별번호
		)
		REFERENCES PET ( -- 반려동물
			PETINDEX -- 동물식별번호
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

-- 댓글
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
		CONSTRAINT FK_DONATE_TO_PAY -- 기부게시판 -> 결제(돈내고 한 것만)
		FOREIGN KEY (
			DINDEX -- 기부글번호
		)
		REFERENCES DONATE ( -- 기부게시판
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
ALTER TABLE DONATECOMMENT
	ADD
		CONSTRAINT FK_USER_TO_DONATECOMMENT -- 회원 -> 즐겨찾기/게시글
		FOREIGN KEY (
			USERID -- USERID
		)
		REFERENCES USER ( -- 회원
			USERID -- USERID
		)
		ON DELETE CASCADE;

-- 기부댓글 후원글번호
ALTER TABLE DONATECOMMENT
	ADD
		CONSTRAINT FK_DONATE_TO_DONATECOMMENT -- 
		FOREIGN KEY (
			DINDEX -- 글번호
		)
		REFERENCES DONATE ( -- 게시글
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

desc post;
desc pet;
desc maincategory;
desc message;
desc user;

select * from user;
select * from pet;
select * from roles;
select * from userrole;
select * from message;
select * from blog;
select * from maincategory;
select * from subcategory; 
select * from blogcomment;



