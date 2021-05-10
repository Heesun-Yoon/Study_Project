-- toy_Project db 

/*회원*/
CREATE TABLE TBL_MEMBER (
  SEQ NUMBER PRIMARY KEY, 			    /*번호*/
  NAME VARCHAR2(20) NOT NULL, 		    /*이름*/
  ID VARCHAR2(50) NOT NULL,			    /*ID*/
  PW VARCHAR2(50) NOT NULL,		        /*PW*/
  ADDRESS VARCHAR2(200) NOT NULL, 		/*ADDRESS*/
  DELFLAG NUMBER DEFAULT 0 NOT NULL 	/*삭제*/
);


/*친구요청*/
CREATE TABLE TBL_FRIEND_REQ (
  SEQ NUMBER PRIMARY KEY,					            /*번호*/
  FOREIGN KEY REQMEM_SEQ REFERENCES TBL_MEMBER(SEQ),	/*요청회원번호*/
  FOREIGN KEY RESMEM_SEQ REFERENCES TBL_MEMBER(SEQ),	/*수락회원번호*/
  STATE VARCHAR2(5) NOT NULL,				            /*상태*/
  COMPLETE_DATE VARCHAR2(50) NOT NULL,			        /*완료날짜*/
);


/*친구*/
CREATE TABLE TBL_FRIEND (
  SEQ NUMBER PRIMARY KEY,					                /*번호*/			
  FOREIGN KEY FNDREQ_SEQ REFERENCES TBL_FRIEND_REQ(SEQ),	/*요청회원번호*/
);


/*일정*/
CREATE TABLE TBL_SCHEDULE (
  SEQ NUMBER PRIMARY KEY,					            /*번호*/	
  FOREIGN KEY MEMBER_SEQ REFERENCES TBL_MEMBER(SEQ),	/*회원번호*/
  TITLE VARCHAR2(200) NOT NULL,				            /*제목*/
  CONTENT VARCHAR2(2000) NOT NULL,				        /*내용*/
  START_TIME VARCHAR2(20) NOT NULL,				        /*시작날짜*/
  END_TIME VARCHAR2(20) NOT NULL,				        /*끝날짜*/
  IMPORTANT NUMBER NOT NULL,				            /*중요도*/
  TAG VARCHAR2(100) NOT NULL,				            /*태그*/
  COST NUMBER NOT NULL,					                /*비용*/
  STATE VARCHAR2(50) NOT NULL,				            /*상태*/
  REGDATE VARCHAR2(50) NOT NULL,				        /*등록일*/
  DELFLAG NUMBER NOT NULL,				                /*삭제*/
);


/*파일*/
CREATE TABLE TBL_FILE (
  SEQ NUMBER PRIMARY KEY,					            /*번호*/	
  FOREIGN KEY SCHE_SEQ REFERENCES TBL_SCHEDULE(SEQ),    /*일정번호*/
  NAME VARCHAR2(200) NOT NULL,				            /*파일명*/
  EXTENSION VARCHAR2(50) NOT NULL,				        /*확장자*/
  REGDATE VARCHAR2(50) NOT NULL,				        /*등록날짜*/
  DOWNDATE VARCHAR2(50) NOT NULL,				        /*다운로드날짜*/
);



/*즐겨찾기*/
CREATE TABLE TBL_BOOKMARK (
  SEQ NUMBER PRIMARY KEY,					            /*번호*/	
  FOREIGN KEY SCHE_SEQ REFERENCES TBL_SCHEDULE(SEQ),	/*일정번호*/
);



/*댓글*/
CREATE TABLE TBL_COMMENT (
  SEQ NUMBER PRIMARY KEY,					            /*번호*/	
  FOREIGN KEY SCHE_SEQ REFERENCES TBL_SCHEDULE(SEQ),	/*일정번호*/
  CONTENT VARCHAR2(1000) NOT NULL,				        /*내용*/
  ID VARCHAR2(50) NOT NULL,					            /*아이디*/
  PW VARCHAR2(50) NOT NULL,				                /*비밀번호*/
);



==============================================================================

CREATE SEQUENCE SEQ_MEMBER;
CREATE SEQUENCE SEQ_FRIEND_REQ;
CREATE SEQUENCE SEQ_FRIEND;
CREATE SEQUENCE SEQ_SCHEDULE;
CREATE SEQUENCE SEQ_FILE;
CREATE SEQUENCE SEQ_BOOKMARK;
CREATE SEQUENCE SEQ_COMMENT;
