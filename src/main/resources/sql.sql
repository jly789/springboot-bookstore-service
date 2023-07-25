DROP TABLE review PURGE;
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
    price   NUMBER NOT NULL,	 --책 가격
    salesQuantity NUMBER NOT NULL, --책 판매수량
    bookLoan  NUMBER DEFAULT 1,  --책 대출여부
    views NUMBER DEFAULT 0,  --책 조회수
    publicationYear DATE NOT NULL, --책 출판년도



    CONSTRAINT BOOK PRIMARY KEY (bookId),
    CONSTRAINT FK_BOOK_MEMBER_ID FOREIGN KEY (memberId) REFERENCES MEMBER (memberId)


);
DROP TABLE cart PURGE;
CREATE TABLE CART(

                     cartId NUMBER NOT NULL,
                     memberId NUMBER NOT NULL,
                     bookId NUMBER NOT NULL,
                     wishQuantity number DEFAULT 1,
                     amount NUMBER not null,

                     CONSTRAINT CART PRIMARY KEY (cartId),
                     CONSTRAINT FK_CART_MEMBER_ID FOREIGN KEY (memberId) REFERENCES MEMBER (memberId),
                     CONSTRAINT FK_CART_BOOK_ID FOREIGN KEY (bookId) REFERENCES BOOK (bookId)

);


select * from cart;

CREATE TABLE ORDERS
(
    orderId      NUMBER       NOT NULL,
    memberId    NUMBER       NOT NULL,
    bookId    NUMBER       NOT NULL,
    orderNum     VARCHAR2(50)     NOT NULL,
    impUid       VARCHAR2(50) NULL,
    amount NUMBER       NOT NULL,
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
    recipient     VARCHAR2(30)  NOT NULL,  --받는사람
    deliveryTel   VARCHAR2(30)     NOT NULL,  --연락처
    postcode       VARCHAR2(20)       NOT NULL,  --우편번호
    address        VARCHAR2(255) NOT NULL, --주소
    detailAddress VARCHAR2(255) NOT NULL, --상세주소
    extraAddress  VARCHAR2(255) NULL, --참고사항
    deliveryCost  NUMBER        NULL, --배송비
    CONSTRAINT PK_DELIVERY PRIMARY KEY (orderId),
    CONSTRAINT FK_DELIVERY_ORDER_ID FOREIGN KEY (orderId) REFERENCES orders (orderId)
);

DROP TABLE review PURGE;
CREATE TABLE REVIEW
(
    reviewId       NUMBER   NOT NULL,   --리뷰번호
    memberId       NUMBER        NOT NULL, --회원번호
    bookId         NUMBER  NOT NULL,  --도서번호
    reviewSubject  VARCHAR2(200)     NOT NULL,  --리뷰제목
    reviewContent  VARCHAR2(20)       NOT NULL,  --리뷰내용
    reviewFileName  VARCHAR2(300) not  NULL, --리뷰파일이미지
    reviewFilePath VARCHAR2(300) not NULL, --리뷰파일이미지경로
    grade VARCHAR2(50) NOT NULL, --평점
    views  NUMBER DEFAULT 0, --조회수
    reviewDate    DATE         DEFAULT SYSDATE, --리뷰생성시간
    CONSTRAINT PK_REVIEW PRIMARY KEY (reviewId),
    CONSTRAINT FK_MEMBER_MEMBER_ID FOREIGN KEY (memberId) REFERENCES member (memberID),
    CONSTRAINT FK_BOOK_BOOK_ID FOREIGN KEY (bookId) REFERENCES book (bookId)
);

commit;
select * from review;



INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT)
values(0,'ADMIN','admin','admin','관리자','남자',29,'관리자님','1995-04-01','01020893971',13111,'Suansu Castle, Taepyeong-dong, Seongnam-si, Gyeonggi-do(경기도 성남시 태평동 수앤수캐슬)',
       '402호',null,'jly789@naver.com','코미디','King',0,0);


INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT)
values(1,'MEMBER','asd','asd','윤재일','남자',29,'비운의소나기','1995-04-01','01020893971',13111,'Suansu Castle, Taepyeong-dong, Seongnam-si, Gyeonggi-do(경기도 성남시 태평동 수앤수캐슬)',
       '402호',null,'jly456@naver.com','코미디','King',0,0);



--INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY ,BOOKLOAN, VIEWS, PUBLICATIONYEAR)
--values(2,0,'세중과 슬기로운생활','은밀한 세중의사와 하룻밤','윤재일','YG엔터','소설');



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


select a.bookId from  book a
                          LEFT JOIN orders b ON
        a.bookId = b.bookId
where b.bookId = 1 or b.bookId=2;




commit;

select * from member;
select * from book;
select * from cart;
select * from orders;
select * from DELIVERY;
select * from review;

select ORDERNUM
from orders where memberId = 1;

--존재하면 1 값이없으면 0
--   select nvl(count(*),0) from member
--        where name ='윤재일' and email ='jly789@naver.com';

--    update member set PURCHASEAMOUNT = 0, POINT =0;
--
update book set bookName = '킹더랜드'
where bookId = 4;

select * from book;


select DISTINCT orderState,a.price  from  orders a
                                              LEFT JOIN book b ON
        a.bookId = b.bookId
where ORDERNUM ='merchant_1689965769250' or  orderNum = 'merchant_1689965687789';


select * from orders;
select * from DELIVERY;

select DISTINCT ORDERstate from ORDERS
where orderNum ='merchant_1689965769250';
--

select * from MEMBER
where userId = 'asd';
