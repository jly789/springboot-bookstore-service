DROP TABLE DELIVERY PURGE;
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

                     CONSTRAINT CART PRIMARY KEY (cartId),
                     CONSTRAINT FK_CART_MEMBER_ID FOREIGN KEY (memberId) REFERENCES MEMBER (memberId),
                     CONSTRAINT FK_CART_BOOK_ID FOREIGN KEY (bookId) REFERENCES BOOK (bookId)

);

CREATE TABLE ORDERS
(
    orderId      NUMBER       NOT NULL,
    memberId    NUMBER       NOT NULL,
    bookId    NUMBER       NOT NULL,
    orderNum     VARCHAR2(15)     NOT NULL,
    impUid       VARCHAR2(50) NULL,
    orderPayment NUMBER       NOT NULL,
    orderState   VARCHAR2(50) DEFAULT 'ORDER',
    orderDate    DATE         DEFAULT SYSDATE,
    usePoint Number,
    CONSTRAINT PK_ORDERS PRIMARY KEY (orderId),
    CONSTRAINT FK_ORDER_MEMBER_ID FOREIGN KEY (memberId) REFERENCES member (memberId),
    CONSTRAINT FK_ORDER_BOOK_ID FOREIGN KEY (bookId) REFERENCES book (bookId)
);

CREATE TABLE DELIVERY
(
    deliveryId    NUMBER   NOT NULL,   --배달번호
    orderId       NUMBER        NOT NULL, --주문번호
    recipient      VARCHAR2(30)  NOT NULL,  --받는사람
    deliveryTel   CHAR(11)      NOT NULL,  --연락처
    postcode       CHAR(5)       NOT NULL,  --우편번호
    address        VARCHAR2(255) NOT NULL, --주소
    detailAddress VARCHAR2(255) NOT NULL, --상세주소
    extraAddress  VARCHAR2(255) NULL, --참고사항
    deliveryCost  NUMBER        NOT NULL, --배송비
    CONSTRAINT PK_DELIVERY PRIMARY KEY (orderId),
    CONSTRAINT FK_DELIVERY_ORDER_ID FOREIGN KEY (orderId) REFERENCES orders (orderId)
);





INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT)
values(0,'ADMIN','admin','admin','관리자','남자',29,'관리자님','1995-04-01','01020893971',13111,'Suansu Castle, Taepyeong-dong, Seongnam-si, Gyeonggi-do(경기도 성남시 태평동 수앤수캐슬)',
       '402호',null,'jly789@naver.com','코미디','King',0,0);


INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT)
values(1,'MEMBER','asd','asd','윤재일','남자',29,'비운의소나기','1995-04-01','01020893971',13111,'Suansu Castle, Taepyeong-dong, Seongnam-si, Gyeonggi-do(경기도 성남시 태평동 수앤수캐슬)',
       '402호',null,'jly456@naver.com','코미디','King',0,0);


select *
from book a
         LEFT JOIN member b ON
        a.memberId = b.memberId
         LEFT JOIN cart c ON
        b.memberId =c.memberId
where b.memberId = 0
ORDER BY c.cartid;


select a.price from book a
                        LEFT JOIN cart b ON
        a.memberId = b.memberId
where b.memberId = 1;

select * from  book a
                   LEFT JOIN cart b ON
        a.bookId = b.bookId
                   LEFT JOIN member c ON
        b.memberId =c.memberId
where b.memberId =1
ORDER BY b.bookId;


commit;

select * from member;
select * from book;
select * from cart;
select * from orders;
select * from DELIVERY;

--존재하면 1 값이없으면 0
--   select nvl(count(*),0) from member
--        where name ='윤재일' and email ='jly789@naver.com';

--    update member set PURCHASEAMOUNT = 0, POINT =0;
--
-- update member set name = '윤재일', NIKNAME = '비운의소나기'
-- where MEMBERID = 1;



--


select * from MEMBER
where userId = 'asd';