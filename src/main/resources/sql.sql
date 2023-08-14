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
    commentDate DATE  DEFAULT SYSDATE not null,
    CONSTRAINT PK_COMMENT PRIMARY KEY (commentId),
    CONSTRAINT FK_MEMBER_MEMBERS_ID FOREIGN KEY (memberId) REFERENCES member (memberId),
    CONSTRAINT FK_BOOK_BOOKS_ID FOREIGN KEY (bookId) REFERENCES book (bookId)
);


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

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,BOOKLOAN, VIEWS,PUBLICATIONYEAR)
values(1,0,'스티브잡스','스티브잡스','월터 아이작슨','민음사','경영','스티브잡스.jpg','/files/스티브잡스.jpg',22500,10000,1,0,SYSDATE);


commit;
select * from member;
select * from book;
select * from orders;
select * from delivery;
select * from review;
select * from comments;





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
