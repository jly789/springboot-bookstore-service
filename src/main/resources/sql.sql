DROP TABLE notice PURGE;
DROP TABLE review PURGE;
DROP TABLE DELIVERY PURGE;
DROP TABLE comments PURGE;
DROP TABLE orders PURGE;
DROP TABLE cart PURGE;
DROP TABLE book PURGE;
DROP TABLE member PURGE;



CREATE TABLE MEMBER
(

    memberId NUMBER NOT NULL,
    role      VARCHAR2(50)  DEFAULT 'MEMBER',
    userId   VARCHAR2(50) NOT NULL,
    pwd       VARCHAR2(100) NOT NULL,
    name     VARCHAR2(50) NOT NULL,
    gender   VARCHAR2(50) NOT NULL,
    age      NUMBER NOT NULL,
    nikname VARCHAR2(50) NOT NULL,
    birth   DATE NOT NULL,
    tel     VARCHAR2(100) NOT NULL,
    postcode VARCHAR2(100) NOT NULL,
    address VARCHAR2(500) NOT NULL,
    detailAddress VARCHAR2(100) NOT NULL,
    extraAddress VARCHAR2(100)  NULL,
    email    VARCHAR2(200) NOT NULL,
    favoriteGenre VARCHAR2(200) NOT NULL,
    userGrade VARCHAR2(100) DEFAULT 'bronze',
    purchaseAmount NUMBER  DEFAULT 0,
    point    NUMBER  DEFAULT 0,
    wishQuantity NUMBER DEFAULT 0,
    fileName  VARCHAR2(300) NOT NULL, --파일이미지이름
    filePath VARCHAR2(300) NOT NULL, --파일이미지경로


    CONSTRAINT MEMBER PRIMARY KEY (memberId)
);


CREATE TABLE BOOK
(
    bookId NUMBER NOT NULL,  --책번호
    memberId NUMBER NOT NULL, --회원번호
    bookName VARCHAR2(100) NOT NULL,--책이름
    bookContent   VARCHAR2(1000) NULL, --책내용
    author VARCHAR2(100) NOT NULL, --책저자
    publisher VARCHAR2(100) NOT NULL, --책 출판사
    genre VARCHAR2(50) NOT NULL, --책 장르
    fileName  VARCHAR2(300) NOT NULL, --파일이미지이름
    filePath VARCHAR2(300) NOT NULL, --파일이미지경로
    price   NUMBER NOT NULL,    --책 가격
    salesQuantity NUMBER NOT NULL, --책 판매수량
    bookLoan  NUMBER DEFAULT 1,  --책 대출여부
    views NUMBER DEFAULT 0,  --책 조회수
    publicationYear DATE NOT NULL, --책 출판년도
    salesRate NUMBER DEFAULT 0,

    CONSTRAINT BOOK PRIMARY KEY (bookId),
    CONSTRAINT FK_BOOK_MEMBER_ID FOREIGN KEY (memberId) REFERENCES MEMBER (memberId)

);

CREATE TABLE CART(

                     cartId NUMBER NOT NULL,
                     memberId NUMBER NOT NULL,
                     bookId NUMBER NOT NULL,
                     wishQuantity NUMBER DEFAULT 1 NULL,
                     amount NUMBER NOT NULL,


                     CONSTRAINT CART PRIMARY KEY (cartId),
                     CONSTRAINT FK_CART_MEMBER_ID FOREIGN KEY (memberId) REFERENCES MEMBER (memberId),
                     CONSTRAINT FK_CART_BOOK_ID FOREIGN KEY (bookId) REFERENCES BOOK (bookId)

);

CREATE TABLE ORDERS
(
    orderId      NUMBER       NOT NULL,
    memberId    NUMBER       NOT NULL,
    bookId    NUMBER       NOT NULL,
    orderNum     VARCHAR2(200)     NOT NULL,
    impUid       VARCHAR2(200) NULL,
    amount NUMBER       NOT NULL,
    wishQuantity NUMBER NOT NULL,
    orderState   VARCHAR2(50) DEFAULT 'ORDER',
    orderDate    DATE         DEFAULT SYSDATE,
    usePoint Number null,
    CONSTRAINT PK_ORDERS PRIMARY KEY (orderId),
    CONSTRAINT FK_ORDER_MEMBER_ID FOREIGN KEY (memberId) REFERENCES member (memberId),
    CONSTRAINT FK_ORDER_BOOK_ID FOREIGN KEY (bookId) REFERENCES book (bookId)
);

CREATE TABLE DELIVERY
(
    deliveryId    NUMBER   NOT NULL,   --배달번호
    orderId       NUMBER        NOT NULL, --주문번호
    memberId       NUMBER        NOT NULL, --주문번호
    recipient      VARCHAR2(30)  NOT NULL,  --받는사람
    deliveryTel   CHAR(11)      NOT NULL,  --연락처
    postcode       CHAR(5)       NOT NULL,  --우편번호
    address        VARCHAR2(255) NOT NULL, --주소
    detailAddress VARCHAR2(255) NOT NULL, --상세주소
    extraAddress  VARCHAR2(255) NULL, --참고사항
    deliveryCost  NUMBER        NOT NULL, --배송비
    orderDate     DATE         DEFAULT SYSDATE,
    CONSTRAINT PK_DELIVERY PRIMARY KEY (orderId),
    CONSTRAINT FK_DELIVERY_MEMBER_ID FOREIGN KEY (memberId) REFERENCES member (memberId),
    CONSTRAINT FK_DELIVERY_ORDER_ID FOREIGN KEY (orderId) REFERENCES orders (orderId)

);

CREATE TABLE review
(
    reviewId    NUMBER   NOT NULL,   --배달번호
    memberId       NUMBER        NOT NULL, --주문번호
    bookId      NUMBER  NOT NULL,  --받는사람
    orderId    NUMBER NOT NULL,
    reviewSubject    VARCHAR2(255)      NOT NULL,  --연락처
    reviewContent        VARCHAR2(255)     NOT NULL,  --우편번호
    reviewFileName        VARCHAR2(255)  NULL, --주소
    reviewFilePath VARCHAR2(255)  NULL, --상세주소
    grade  VARCHAR2(255) not NULL, --참고사항
    views  NUMBER  DEFAULT 0      NOT NULL, --배송비
    reviewState VARCHAR2(50) DEFAULT '리뷰완료' not null,
    reviewDate DATE  DEFAULT SYSDATE not null,
    CONSTRAINT PK_REVIEW PRIMARY KEY (reviewId),
    CONSTRAINT FK_MEMBER_MEMBER_ID FOREIGN KEY (memberId) REFERENCES member (memberId),
    CONSTRAINT FK_BOOK_BOOK_ID FOREIGN KEY (bookId) REFERENCES book (bookId),
    CONSTRAINT FK_ORDERS_ORDER_ID FOREIGN KEY (orderId) REFERENCES orders (orderId)
);


CREATE TABLE COMMENTS
(
    commentId    NUMBER   NOT NULL,   --코멘트번호
    memberId       NUMBER        NOT NULL, --주문번호
    bookId      NUMBER  NOT NULL,  --받는사람
    commentContent   VARCHAR2(255)     NOT NULL,
    commentDate DATE  DEFAULT SYSDATE NOT NULL,
    CONSTRAINT PK_COMMENT PRIMARY KEY (commentId),
    CONSTRAINT FK_MEMBER_MEMBERS_ID FOREIGN KEY (memberId) REFERENCES member (memberId),
    CONSTRAINT FK_BOOK_BOOKS_ID FOREIGN KEY (bookId) REFERENCES book (bookId)
);


CREATE TABLE NOTICE
(
    noticeId      NUMBER         NOT NULL,
    memberId     NUMBER         NOT NULL,
    noticeSubject VARCHAR2(300)  NOT NULL,
    noticeContent VARCHAR2(1000) NOT NULL,
    noticeType    VARCHAR2(50)   NOT NULL, --중요,공지,긴급
    noticeDate     DATE   DEFAULT SYSDATE,
    noticeViews      NUMBER DEFAULT 0,
    CONSTRAINT PK_NOTICE PRIMARY KEY (noticeId),
    CONSTRAINT FK_MEMBERS_MEMBER_ID FOREIGN KEY (memberId) REFERENCES member (memberId)
);



------------------------Member---------------------------------------------------------------------------------------------------------------------------

INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT,fileName,filePath)
values(0,'ADMIN','admin','admin','관리자','남자',29,'관리자님','1995-04-01','01020893971',13111,'Suansu Castle, Taepyeong-dong, Seongnam-si, Gyeonggi-do(경기도 성남시 태평동 수앤수캐슬)',
       '402호',null,'jly789@naver.com','코미디','King',0,100000000,'윤재일2.jpg','/profileImg/윤재일2.jpg');



INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT,fileName,filePath)
values(1,'MEMBER','user1','a123123','안유진','여자',21,'안유진','2003-04-01','01020893971',13111,'Suansu Castle, Taepyeong-dong, Seongnam-si, Gyeonggi-do(경기도 성남시 태평동 수앤수캐슬)',
       '402호',null,'jly789@naver.com','코미디','King',200000,10000,'안유진.jpg','/profileImg/안유진.jpg');


INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT,fileName,filePath)
values(2,'MEMBER','user2','a123123','지드래곤','남자',36,'지드래곤','1988-04-01','01020893971',13111,'Suansu Castle, Taepyeong-dong, Seongnam-si, Gyeonggi-do(경기도 성남시 태평동 수앤수캐슬)',
       '402호',null,'jly789@naver.com','코미디','King',200000,10000,'지드래곤.jpg','/profileImg/지드래곤.jpg');

INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT,fileName,filePath)
values(3,'MEMBER','user3','a123123','홍은채','여자',17,'홍은채','2006-04-01','01020893971',13111,'Suansu Castle, Taepyeong-dong, Seongnam-si, Gyeonggi-do(경기도 성남시 태평동 수앤수캐슬)',
       '402호',null,'jly789@naver.com','코미디','King',200000,10000,'홍은채.jpg','/profileImg/홍은채.jpg');

INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT,fileName,filePath)
values(4,'MEMBER','user4','a123123','이지은','여자',31,'이지은','1993-04-01','01020893971',13111,'Suansu Castle, Taepyeong-dong, Seongnam-si, Gyeonggi-do(경기도 성남시 태평동 수앤수캐슬)',
       '402호',null,'jly789@naver.com','코미디','King',200000,10000,'이지금.jpg','/profileImg/이지금.jpg');

select * from member;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





------------------------Book---------------------------------------------------------------------------------------------------------------------------
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(1,0,'스티브잡스','스티브잡스','월터 아이작슨','민음사','경영','스티브잡스.jpg','/files/스티브잡스.jpg',22500,10000,1,111,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(2,0,'아무것도하지않는법','아무것도하지않는법','제니 오델','필로우','인문학','아무것도하지않는법.jpg','/files/아무것도하지않는법.jpg',16650,10000,1,222,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(3,0,'수학의정석','수학의정석','홍성대','성지출판','수학영역','수학의정석.jpg','/files/수학의정석.jpg',15300,10000,1,333,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(4,0,'어린이를 위한 역사의 쓸모 인생 편 1','어린이를 위한 역사의 쓸모 인생 편 1','최태성','다산어린이','어린이','어린이를 위한 역사의 쓸모 인생 편 1.jpg','/files/어린이를 위한 역사의 쓸모 인생 편 1.jpg',10500,10000,1,555,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(5,0,'에스콰이어 Esquire A형','에스콰이어 Esquire A형','에스콰이어 편집부','허스트중앙','잡지','에스콰이어 Esquire A형.jpg','/files/에스콰이어 Esquire A형.jpg',32000,10000,1,666,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(6,0,'킹더랜드','킹더랜드','최롬','JTBC','소설','킹더랜드.jpg','/files/킹더랜드.jpg',13000,10000,1,110,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(7,0,'인듀어런스','인듀어런스','김세중','뜨인돌','에세이','인듀어런스.jpg','/files/인듀어런스.jpg',15000,10000,1,235,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(8,0,'공포의 권력','공포의 권력','줄리아 크리스테바','서민원','인문학','공포의 권력.jpg','/files/공포의 권력.jpg',20700,10000,1,2000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(9,0,'관계의 교실','관계의 교실','필립 라일리','지식의날개','인문학','관계의 교실.jpg','/files/관계의 교실.jpg',35000,10000,1,3000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(10,0,'기후변화','기후변화','마크 매슬린','교유서가','과학','기후변화.jpg','/files/기후변화.jpg',22500,10000,1,4000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(11,0,'나의아저씨','나의아저씨','박해영','세계사','소설','나의아저씨.jpg','/files/나의아저씨.jpg',22500,10000,1,5000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(12,0,'느리게 산다는 것','느리게 산다는 것','피에르 쌍소','드림셀러','에세이','느리게 산다는 것.jpg','/files/느리게 산다는 것 .jpg',15200,10000,1,10000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(13,0,'드랍 더 비트','드랍 더 비트','김근','쌤앤파커스','에세이','드랍 더 비트.jpg','/files/드랍 더 비트.jpg',40000,10000,1,5600,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(14,0,'비가 오면 열리는 상점','비가 오면 열리는 상점','유영광','클레이하우스','소설','비가 오면 열리는 상점.jpg','/files/비가 오면 열리는 상점.jpg',37800,10000,1,12000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(15,0,'Dragon Masters','Dragon Masters','트레이시 웨스트','Scholastic Inc.','동화','Dragon Masters.jpg','/files/Dragon Masters.jpg',9000,10000,1,99000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(16,0,'처음 떠나는 시공간 여행','처음 떠나는 시공간 여행','스테판 다스콜리,','북스힐','우주과학','처음 떠나는 시공간 여행.jpg','/files/처음 떠나는 시공간 여행.jpg',18000,10000,1,120000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(17,0,'해파리책','해파리책','파올라 비탈레','원더박스','과학','해파리책.jpg','/files/해파리책.jpg',8900,10000,1,3200,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(18,0,'재벌집 막내아들 1','재벌집 막내아들 1','산경','테라코타','소설','재벌집 막내아들 1.jpg','/files/재벌집 막내아들 1.jpg',35000,10000,1,2200,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(19,0,'재벌집 막내아들 2','재벌집 막내아들 2','산경','테라코타','소설','재벌집 막내아들 2.jpg','/files/재벌집 막내아들 2.jpg',35000,10000,1,1500,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(20,0,'재벌집 막내아들 3','재벌집 막내아들 3','산경','테라코타','소설','재벌집 막내아들 3.jpg','/files/재벌집 막내아들 3.jpg',35000,10000,1,60000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(21,0,'재벌집 막내아들 4','재벌집 막내아들 4','산경','테라코타','소설','재벌집 막내아들 4.jpg','/files/재벌집 막내아들 4.jpg',35000,10000,1,500000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(22,0,'재벌집 막내아들 5','재벌집 막내아들 5','산경','테라코타','소설','재벌집 막내아들 5.jpg','/files/재벌집 막내아들 5.jpg',35000,10000,1,550000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(23,0,'러브크래프트의 공포들','러브크래프트의 공포들','샌디 피터슨','초여명','공포','러브크래프트의 공포들.jpg','/files/러브크래프트의 공포들.jpg',51000,10000,1,600000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(24,0,'너무 한낮의 연애','너무 한낮의 연애','김금희','문학동네','연애','너무 한낮의 연애.jpg','/files/너무 한낮의 연애.jpg',35000,10000,1,3200,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(25,0,'블랙코미디','블랙코미디','유병재','비채','코미디','블랙코미디.jpg','/files/블랙코미디.jpg',21000,10000,1,40000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(26,0,'벤저민 프랭클린 자서전','벤저민 프랭클린 자서전','벤저민 프랭클린 자서전','문학동네','자서전','벤저민 프랭클린 자서전.jpg','/files/벤저민 프랭클린 자서전.jpg',13500,10000,1,22000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(27,0,'사회과학 하기','사회과학 하기','장-피에르 카바이예','후마니타스','사회과학','사회과학 하기.jpg','/files/사회과학 하기.jpg',18900,10000,1,12032,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(28,0,'일간 이슬아 수필집','일간 이슬아 수필집','이슬아','혜엄','수필','일간 이슬아 수필집.jpg','/files/일간 이슬아 수필집.jpg',15300,10000,1,4200,SYSDATE);

SELECT * FROM book;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




------------------------cart---------------------------------------------------------------------------------------------------------------------------
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(1,1,1,1,22500);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(2,2,2,1,16650);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(3,3,3,1,15300);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(4,1,4,1,10500);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(5,2,5,1,32000);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(6,3,6,1,13000);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(7,1,7,1,15000);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(8,2,8,1,20700);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(9,3,9,1,35000);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(10,4,10,1,35000);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(11,4,11,1,35000);

SELECT * FROM cart;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




------------------------Comments---------------------------------------------------------------------------------------------------------------------------
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(1,1,1,'1빠유진',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(2,2,1,'2빠지용이',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(3,3,1,'3빠은채',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(4,1,1,'유진인데요',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(5,2,1,'지용인데요',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(6,3,1,'은채인데요',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(7,1,1,'이 책 별루지??',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(8,2,1,'나두!!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(9,3,1,'너도?????',SYSDATE);

SELECT * FROM comments;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




------------------------Notice---------------------------------------------------------------------------------------------------------------------------
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(1,0,'긴급공지입니다','8월19일 14시 점검합니다','중요',SYSDATE,0);

INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(2,0,'리뷰이벤트 진행예정','8월20일~8월30일 전 상품 30% 여름 할인예정!','중요',SYSDATE,0);

INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(3,0,'택배 지연발생 공지','택배 지연발생시 문의바랍니다','공지',SYSDATE,0);

INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(4,0,'이달의 도서 공지','8월 베스트셀러 스티브잡스입니다!','공지',SYSDATE,0);

INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(5,0,'환불/교환 공지','환불 또는 교환 필요시 031-1234-5678로 전화문의 바랍니다','공지',SYSDATE,0);

SELECT * FROM notice;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





------------------------Orders---------------------------------------------------------------------------------------------------------------------------
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(1,1,1,'1','1',22500,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(2,2,2,'2','2',16650,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(3,3,3,'3','3',15300,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(4,4,4,'4','4',10500,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(5,1,5,'5','5',32000,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(6,2,6,'6','6',13000,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(7,3,7,'7','7',15000,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(8,4,8,'8','8',20700,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(9,1,9,'9','9',35000,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(10,2,10,'10','10',22500,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(11,3,11,'11','11',22500,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(12,4,12,'12','12',15200,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(13,1,13,'13','13',40000,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(14,2,14,'14','14',37800,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(15,3,15,'15','15',9000,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(16,4,16,'16','16',18000,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(17,1,17,'17','17',8900,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(18,2,18,'18','18',35000,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(19,3,19,'19','19',35000,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(20,4,20,'20','20',350000,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(21,1,21,'21','21',350000,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(22,2,22,'22','22',350000,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(23,1,28,'23','23',15300,1,'ORDER',SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERSTATE,ORDERDATE,USEPOINT)
values(24,1,24,'24','24',35000,1,'ORDER',SYSDATE,0);


SELECT * FROM orders;
select * from book
where genre ='연애';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------Delivery---------------------------------------------------------------------------------------------------------------------------
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(1,1,1,'안유진','01020893971','13111','경기도 성남시 태평동','수앤수캐슬','402호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(2,2,2,'지드래곤','01012345678','12345','경기도 용인시 마북동','현대홈타운','101호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(3,3,3,'홍은채','01034559888','12531','서울시 강남구 역삼2동','강남롯데캐슬','101호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(4,4,4,'이지은','01023569877','11111','서울시 강남구 대치동','이지은타워','302호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(5,5,1,'집','01020893971','13111','경기도 성남시 태평동','수앤수캐슬','402호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(6,6,2,'집','01012345678','12345','경기도 용인시 마북동','현대홈타운','101호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(7,7,3,'집','01034559888','12531','서울시 강남구 역삼2동','강남롯데캐슬','101호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(8,8,4,'집','01023569877','11111','서울시 강남구 대치동','이지은타워','302호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(9,9,1,'집','01020893971','13111','경기도 성남시 태평동','수앤수캐슬','402호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(10,10,2,'집','01012345678','12345','경기도 용인시 마북동','현대홈타운','101호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(11,11,3,'집','01034559888','12531','서울시 강남구 역삼2동','강남롯데캐슬','101호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(12,12,4,'집','01023569877','11111','서울시 강남구 대치동','이지은타워','302호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(13,13,1,'집','01020893971','13111','경기도 성남시 태평동','수앤수캐슬','402호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(14,14,2,'집','01012345678','12345','경기도 용인시 마북동','현대홈타운','101호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(15,15,3,'집','01034559888','12531','서울시 강남구 역삼2동','강남롯데캐슬','101호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(16,16,4,'집','01023569877','11111','서울시 강남구 대치동','이지은타워','302호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(17,17,1,'집','01020893971','13111','경기도 성남시 태평동','수앤수캐슬','402호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(18,18,2,'집','01012345678','12345','경기도 용인시 마북동','현대홈타운','101호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(19,19,3,'집','01034559888','12531','서울시 강남구 역삼2동','강남롯데캐슬','101호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(20,20,4,'집','01023569877','11111','서울시 강남구 대치동','이지은타워','302호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(21,21,1,'집','01020893971','13111','경기도 성남시 태평동','수앤수캐슬','402호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(22,22,2,'집','01012345678','12345','경기도 용인시 마북동','현대홈타운','101호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(23,23,1,'집','01020893971','13111','경기도 성남시 태평동','수앤수캐슬','402호',5000,SYSDATE);
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE)
values(24,24,1,'집','01020893971','13111','경기도 성남시 태평동','수앤수캐슬','402호',5000,SYSDATE);

SELECT * FROM delivery;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




------------------------Review---------------------------------------------------------------------------------------------------------------------------

INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(1,1,1,1,'user1','유진이','스티브잡스.jpg','/reviewImg/스티브잡스.jpg',1,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(2,2,2,2,'user2','지드래곤','아무것도하지않는법.jpg','/reviewImg/아무것도하지않는법.jpg',2,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(3,3,3,3,'user3','홍은채','수학의정석.jpg','/reviewImg/수학의정석.jpg',3,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(4,4,4,4,'user4','이지은','어린이를 위한 역사의 쓸모 인생 편 1.jpg','/reviewImg/어린이를 위한 역사의 쓸모 인생 편 1.jpg',4,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(5,1,5,5,'user1','에스콰이어 Esquire A형','에스콰이어 Esquire A형.jpg','/reviewImg/에스콰이어 Esquire A형.jpg',5,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(6,2,6,6,'user2','킹더랜드','킹더랜드.jpg','/reviewImg/킹더랜드.jpg',4,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(7,3,7,7,'user3','인듀어런스','인듀어런스.jpg','/reviewImg/인듀어런스.jpg',2,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(8,4,8,8,'user4','공포의 권력','공포의 권력.jpg','/reviewImg/공포의 권력.jpg',3,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(9,1,9,9,'user1','관계의 교실','관계의 교실.jpg','/reviewImg/관계의 교실.jpg',3,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(10,2,10,10,'user2','기후변화','기후변화.jpg','/reviewImg/기후변화.jpg',1,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(11,3,11,11,'user3','나의아저씨','나의아저씨.jpg','/reviewImg/나의아저씨.jpg',2,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(12,4,12,12,'user4','느리게 산다는 것','느리게 산다는 것.jpg','/reviewImg/느리게 산다는 것.jpg',4,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(13,1,13,13,'노잼인데 이거','아노잼','드랍 더 비트.jpg','/reviewImg/드랍 더 비트.jpg',4,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(14,2,14,14,'다시 또 살게요!','좋아요','비가 오면 열리는 상점.jpg','/reviewImg/비가 오면 열리는 상점.jpg',3,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(15,3,15,15,'개별루 배송도 구림','별루','Dragon Masters.jpg','/reviewImg/Dragon Masters.jpg',5,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(16,4,16,16,'배송엄청 빨라요!!','오메 배송 ㅠㅠ','처음 떠나는 시공간 여행.jpg','/reviewImg/처음 떠나는 시공간 여행.jpg',5,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(17,1,17,17,'책 보다 배송이 문제임 이거','배송느려여','해파리책.jpg','/reviewImg/해파리책.jpg',2,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(18,2,18,18,'스토리 대박!!','짱 굿','재벌집 막내아들 1.jpg','/reviewImg/재벌집 막내아들 1.jpg',1,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(19,3,19,19,'너무 재밌어요 추천합니다!','추천합니다!!!','재벌집 막내아들 2.jpg','/reviewImg/재벌집 막내아들 2.jpg',4,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(20,4,20,20,'최고!!','잼써요','재벌집 막내아들 3.jpg','/reviewImg/재벌집 막내아들 3.jpg',5,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(21,1,21,21,'재벌집6권은 언제나와요','또살게요','재벌집 막내아들 4.jpg','/reviewImg/재벌집 막내아들 4.jpg',3,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(22,2,22,22,'재벌집 1권부터 5권까지 정주행 완료!!!','배달속도 굿굿','재벌집 막내아들 5.jpg','/reviewImg/재벌집 막내아들 5.jpg',2,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(23,1,28,23,'일간 이슬아 수필집!!!','배달속도 굿굿','일간 이슬아 수필집.jpg','/reviewImg/일간 이슬아 수필집.jpg',2,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(24,1,24,24,'너무 한낮의 연애!!!','배달속도 굿굿','너무 한낮의 연애.jpg','/reviewImg/너무 한낮의 연애.jpg',2,0,'리뷰완료',sysdate);

SELECT * FROM review;
select * from BOOK
where bookId =28;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


select * from(

                 select
                     a.bookId,a.memberId,a.fileName,a.bookName,a.genre,a.PUBLISHER,a.author,a.price,a.salesRate,

                     RANK() OVER(ORDER BY a.views DESC) as ranking,
                         round(avg(b.grade))as grade,count(b.reviewId) as reviewId from book a

                                                                                            left join review b on a.bookId = b.bookId

                 GROUP BY a.bookId,a.memberId,a.fileName,a.bookName,a.genre,a.PUBLISHER,a.author,a.price,a.salesRate,a.views
                 ORDER BY a.salesRate desc
             )
where genre='공포';


commit;

select * from member;
select * from book
where genre  = '소설';
select * from orders;
select * from delivery;
select * from review;
select * from comments;
select * from notice;


select
    to_char(noticeDate,'yyyy-mm-dd') as noticeDate
from notice;


select  a.*,  to_char(orderDate,'yyyy-mm-dd') as orderTime,b.*
from orders a
         left join book b on a.bookId = b.bookId
where a.memberId = 1;


select a.noticeId,a.memberId,a.noticeSubject,a.noticeContent,a.noticeType,
       to_char(noticeDate,'yyyy-mm-dd') as noticeDate,b.userId from notice a
                                                                        left join member b
                                                                                  on a.memberId = b.memberId

order by a.noticeType desc;

--INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY ,BOOKLOAN, VIEWS, PUBLICATIONYEAR)
--values(2,0,'세중과 슬기로운생활','은밀한 세중의사와 하룻밤','윤재일','YG엔터','소설');

-- select *
--from book a
--         LEFT JOIN member b ON
--        a.memberId = b.memberId
--         LEFT JOIN cart c ON
--        b.memberId =c.memberId
--where b.memberId = 0
--ORDER BY c.cartid;
--
--
--select a.price from book a
--                        LEFT JOIN cart b ON
--        a.memberId = b.memberId
--where b.memberId = 1;
--
--select * from  book a
--                   LEFT JOIN cart b ON
--        a.bookId = b.bookId
--                   LEFT JOIN member c ON
--        b.memberId =c.memberId
--where b.memberId =1
--ORDER BY b.bookId;
--
--  select *
--        from book a
--              LEFT JOIN member b ON
--            a.memberId = b.memberId
--            LEFT JOIN cart c ON
--            b.memberId =c.memberId
--            where b.memberId = 0
--        ORDER BY c.cartid;
--
--
--        select a.price from book a
--        LEFT JOIN cart b ON
--        a.memberId = b.memberId
--        where b.memberId = 1;
--
--        select * from  book a
--        LEFT JOIN cart b ON
--        a.bookId = b.bookId
--        LEFT JOIN member c ON
--        b.memberId =c.memberId
--        where b.memberId =1
--        ORDER BY b.bookId;
--
--
--         select a.bookId from  book a
--        LEFT JOIN orders b ON
--        a.bookId = b.bookId
--        where b.bookId = 1 or b.bookId=2;
--
--
--
-- select * from member;
--select views from book
--where bookId =4;
--
--select * from BOOK
--
--ORDER by price desc;
--
--select * from cart;
--select * from orders;
--select * from DELIVERY;
--select * from review;
--
--select b.grade from book a
--LEFT JOIN review b ON
--a.bookId = b.bookId
--where a.bookId = 3;
--
--  SELECT  a.* ,b.orderId from book a
--        left join orders b on a.memberId = b.memberId
--                                       left join member c on b.memberId = c.memberId
--
--
--        WHERE b.bookId =2;
--
--select * from(
--
--select  a.bookId as bookId, count(b.orderId)as orderId from book a
--LEFT JOIN orders b on
--a.bookId = b.bookId
--where b.bookId = 1
--
--GROUP by a.bookId
--)
--ORDER BY orderId;
--
--
--
--select * from book a
--LEFT JOIN review b ON
--a.bookId = b.bookId
--where a.bookId= 1;
--
--select a.* from cart a
--LEFT join member b on
--a.memberId = b.memberId
--where a.memberId = 2
--;
--
--select * from cart;
--
--commit;
--
--delete cart cartId
--where cartId = 6;
--
--select *
--from orders where memberId = 2;
--
----존재하면 1 값이없으면 0
----   select nvl(count(*),0) from member
----        where name ='윤재일' and email ='jly789@naver.com';
--
----    update member set PURCHASEAMOUNT = 0, POINT =0;
----
--update member set pwd = 'admin'
-- where memberId = 0;
--
-- select * from book;
--

--  select DISTINCT orderState,a.price  from  orders a
--        LEFT JOIN book b ON
--        a.bookId = b.bookId
--      where ORDERNUM ='merchant_1689965769250' or  orderNum = 'merchant_1689965687789';
--
--      select DISTINCT nvl(max(b.orderId),0) from review a
--      LEFT join orders b ON
--	   a.bookId = b.bookId
--	   where orderId = 1;
--
--
--
--
--select * from orders;
--select * from DELIVERY;
--
--select DISTINCT ORDERstate from ORDERS
--where orderNum ='merchant_1689965769250';
----
--
--select * from MEMBER
--where userId = 'asd';
