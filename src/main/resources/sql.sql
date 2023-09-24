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
    address VARCHAR2(500) NOT NULL, --주소
    detailAddress VARCHAR2(100) NOT NULL, --상세주소
    extraAddress VARCHAR2(100)  NULL, --참고추소
    email    VARCHAR2(200) NOT NULL,
    favoriteGenre VARCHAR2(200) NOT NULL,
    userGrade VARCHAR2(100) DEFAULT 'bronze',
    purchaseAmount NUMBER  DEFAULT 0,
    point    NUMBER  DEFAULT 0,
    wishQuantity NUMBER DEFAULT 0,
    fileName  VARCHAR2(300) NOT NULL, --파일이미지이름
    filePath VARCHAR2(300) NOT NULL, --파일이미지경로
    deliveryName VARCHAR2(50) DEFAULT '',



    CONSTRAINT MEMBER PRIMARY KEY (memberId)
);


CREATE TABLE BOOK
(
    bookId NUMBER NOT NULL,  --책번호
    memberId NUMBER NOT NULL, --회원번호
    bookName VARCHAR2(100) NOT NULL,--책이름
    bookContent   VARCHAR2(4000) NULL, --책내용
    author VARCHAR2(100) NOT NULL, --책저자
    publisher VARCHAR2(100) NOT NULL, --책 출판사
    genre VARCHAR2(50) NOT NULL, --책 장르
    fileName  VARCHAR2(300) NOT NULL, --파일이미지이름
    filePath VARCHAR2(300) NOT NULL, --파일이미지경로
    price   NUMBER NOT NULL,    --책 가격
    salesQuantity NUMBER NOT NULL, --도서 판매수량
    recommendedBook  NUMBER DEFAULT 0,  --도서 추천도서
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
    recipient      VARCHAR2(30)  NOT NULL,  --배송지명
    deliveryTel   CHAR(11)      NOT NULL,  --연락처
    postcode       CHAR(5)       NOT NULL,  --우편번호
    address        VARCHAR2(255) NOT NULL, --주소
    detailAddress VARCHAR2(255) NOT NULL, --상세주소
    extraAddress  VARCHAR2(255) NULL, --참고사항
    deliveryCost  NUMBER        NOT NULL, --배송비
    orderDate     DATE         DEFAULT SYSDATE,
    deliveryState   VARCHAR2(50) DEFAULT '상품준비중',

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
    reviewContent        VARCHAR2(4000)     NOT NULL,  --우편번호
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
    commentContent   VARCHAR2(4000)     NOT NULL,
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
    noticeContent VARCHAR2(4000) NOT NULL,
    noticeType    VARCHAR2(50)   NOT NULL, --중요,공지,긴급
    noticeDate     DATE   DEFAULT SYSDATE,
    noticeViews      NUMBER DEFAULT 0,
    CONSTRAINT PK_NOTICE PRIMARY KEY (noticeId),
    CONSTRAINT FK_MEMBERS_MEMBER_ID FOREIGN KEY (memberId) REFERENCES member (memberId)
);

------------------------Member---------------------------------------------------------------------------------------------------------------------------

INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT,fileName,filePath)
values(0,'ADMIN','admin','admin','관리자','남자',29,'관리자님','1995-04-01','01020893971',13111,'경기 성남시 수정구 태평동 7210',
       '수앤수캐슬402호',null,'jly789@naver.com','코미디','king',0,100000000,'윤재일1.jpg','/profileImg/윤재일1.jpg');


INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT,fileName,filePath,deliveryName)
values(1,'MEMBER','user1','a123123','안유진','여자',21,'안유진','2003-09-01','01012345678',13111,'경기 성남시 수정구 태평동 7210',
       '수앤수캐슬101호',null,'user1@naver.com','소설','silver',200000,10000,'안유진.jpg','/profileImg/안유진.jpg','안유진집');


INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT,fileName,filePath,deliveryName)
values(2,'MEMBER','user2','a123123','손흥민','남자',32,'손흥민','1992-07-08','01034567890',13111,'경기 성남시 수정구 태평동 7210',
       '수앤수캐슬201호',null,'user2@naver.com','연애','silver',200000,10000,'손흥민.jpg','/profileImg/손흥민.jpg','손흥민집');

INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT,fileName,filePath,deliveryName)
values(3,'MEMBER','user3','a123123','유재석','남자',52,'유재석','1972-08-14','01023456789',13111,'경기 성남시 수정구 태평동 7210',
       '수앤수캐슬301호',null,'user3@naver.com','공포','silver',200000,10000,'유재석.jpg','/profileImg/유재석.jpg','유재석집');

INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT,fileName,filePath,deliveryName)
values(4,'MEMBER','user4','a123123','아이유','여자',31,'아이유','1993-05-16','01022334455',13111,'경기 성남시 수정구 태평동 7210',
       '수앤수캐슬401호',null,'user4@naver.com','수필','silver',200000,10000,'아이유.jpg','/profileImg/아이유.jpg','아이유집');

INSERT into member (MEMBERID,  ROLE, USERID ,PWD, NAME, GENDER, AGE ,NIKNAME, BIRTH ,TEL ,POSTCODE ,ADDRESS, DETAILADDRESS, EXTRAADDRESS ,EMAIL, FAVORITEGENRE, USERGRADE ,PURCHASEAMOUNT, POINT,fileName,filePath,deliveryName)
values(5,'MEMBER','user5','a123123','이강인','남자',22,'이강인','2001-02-19','01099998888',13111,'경기 성남시 수정구 태평동 7210',
       '수앤수캐슬501호',null,'user5@naver.com','역사','silver',200000,10000,'noImage.jpg','/profileImg/noImage.jpg','이강인집');



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------소설 1~10---------------------------------------------------------------------------------------------------------------------------

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(1,0,'너무나 많은 여름이','김연수의 짧은 소설. 20편의 소설에 공간과 음악의 이야기가 함께 엮였다.작가의 말에는 이 소설이 처음 움튼 순간이 묘사되어 있다. 팬데믹으로 낭독회가 취소되거나 제한적으로 열리던 2021년 10월, 가파도 레지던시에 머물던 작가는 제주도 대정읍의 작은 서점에서 낭독회를 열게 되었다. 눈을 감고 낭독의 흐름을 듣는 관객의 얼굴을 보며 작가는 "그들이 낮 동안 열심히 일해 만들어내는 것, 그리고 밤의 사람들에게 살아갈 힘을 내게 하는 것. 나는 그들이 모여서 듣는 내 이야기도 그런 것이 됐으면 했다."(297쪽)고 생각했다. 이 에피파니(epiphany) 같은 순간을 경험한 후 작가는 새로 지은 짧은 소설을 읽고 관객의 이야기를 듣는 시간을 계속해 가졌다. 낭독회는 2021년의 제주와 고양, 2022년의 광주와 진주, 2023년의 파주와 창원의 도서관과 서점에서 이어졌다. 소설은 그렇게 읽히고 들렸고, 서로 나눈 이야기가 더해져 다시 쓰였다.

활자화된 소설은 사로잡혀 이곳에 잠시 머물게 되었지만, 이 이야기들에는 어쩐히 마침표가 어울리지 않는 것 같다. 소설은 다시 읽히고 다시 쓰일 것이며 우리의 인생도 그럴 것이다. 자연소멸한 사랑이든, 사별한 부모이든, 풍화한 감각이든, 바다에 가라앉은 사회적인 죽음이든, 사건은 끝나지만 우리의 이야기는 끝나지 않는다. 밤의 시간을 보내고 다시 아침을 향해 몸을 일으키게 하는 힘, 아래와 같은 문장을 읽으며 김연수의 다음 걸음을 기대하게 되었다.','김연수','레제','소설','너무나 많은 여름이.jpg','/files/너무나 많은 여름이.jpg',16000,10000,0,1000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(2,0,'비가 오면 열리는 상점','불행을 파는 대신 원하는 행복을 살 수 있는 가게가 있다면? 듣기만 해도 방문하고 싶어지는, 비가 오면 열리는 수상한 상점에 초대된 여고생 세린이 안내묘 잇샤, 사람의 마음을 훔치는 도깨비들과 함께 펼치는 감동 모험 판타지.

『비가 오면 열리는 상점』은 출간 전부터 많은 독자에게 입소문이 자자했던 작품이다. 처음 텀블벅에서 소개됐을 때부터 2000만 원에 가까운 후원금을 모금하며, 베스트셀러 『달러구트 꿈 백화점』과 『죽고 싶지만 떡볶이는 먹고 싶어』의 금액을 넘어섰다.','유영광','클레이하우스','소설','비가 오면 열리는 상점.jpg','/files/비가 오면 열리는 상점.jpg',37800,10000,1,2000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(3,0,'재벌집 막내아들 1','2017년 2월부터 2018년 1월까지 1년여간 326화 연재되는 동안 단 한 번도 투데이베스트 1위를 놓치지 않을 만큼 수많은 독자들이 열광한 웹소설 <재벌집 막내아들>이 마침내 종이책으로 출간되었다.

순양그룹 미래전략기획본부 실장 윤현우는 재벌 총수 일가의 온갖 구린 일을 뒤처리하며 충성을 다하는 인물이다. 지금은 비록 재벌가의 뒤치다꺼리나 하고 있지만 언젠가는 최측근이 되어 출세하겠다는 꿈을 가진 그에게 어느 날 해외 자금에 손 담그는 중대한 업무가 맡겨진다.','산경','테라코타','소설','재벌집 막내아들 1.jpg','/files/재벌집 막내아들 1.jpg',35000,10000,1,3000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(4,0,'재벌집 막내아들 2','2017년 2월부터 2018년 1월까지 1년여간 326화 연재되는 동안 단 한 번도 투데이베스트 1위를 놓치지 않을 만큼 수많은 독자들이 열광한 웹소설 <재벌집 막내아들>이 마침내 종이책으로 출간되었다.

순양그룹 미래전략기획본부 실장 윤현우는 재벌 총수 일가의 온갖 구린 일을 뒤처리하며 충성을 다하는 인물이다. 지금은 비록 재벌가의 뒤치다꺼리나 하고 있지만 언젠가는 최측근이 되어 출세하겠다는 꿈을 가진 그에게 어느 날 해외 자금에 손 담그는 중대한 업무가 맡겨진다.','산경','테라코타','소설','재벌집 막내아들 2.jpg','/files/재벌집 막내아들 2.jpg',35000,10000,0,4000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(5,0,'재벌집 막내아들 3','2017년 2월부터 2018년 1월까지 1년여간 326화 연재되는 동안 단 한 번도 투데이베스트 1위를 놓치지 않을 만큼 수많은 독자들이 열광한 웹소설 <재벌집 막내아들>이 마침내 종이책으로 출간되었다.

순양그룹 미래전략기획본부 실장 윤현우는 재벌 총수 일가의 온갖 구린 일을 뒤처리하며 충성을 다하는 인물이다. 지금은 비록 재벌가의 뒤치다꺼리나 하고 있지만 언젠가는 최측근이 되어 출세하겠다는 꿈을 가진 그에게 어느 날 해외 자금에 손 담그는 중대한 업무가 맡겨진다.','산경','테라코타','소설','재벌집 막내아들 3.jpg','/files/재벌집 막내아들 3.jpg',35000,10000,0,5000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(6,0,'재벌집 막내아들 4','2017년 2월부터 2018년 1월까지 1년여간 326화 연재되는 동안 단 한 번도 투데이베스트 1위를 놓치지 않을 만큼 수많은 독자들이 열광한 웹소설 <재벌집 막내아들>이 마침내 종이책으로 출간되었다.

순양그룹 미래전략기획본부 실장 윤현우는 재벌 총수 일가의 온갖 구린 일을 뒤처리하며 충성을 다하는 인물이다. 지금은 비록 재벌가의 뒤치다꺼리나 하고 있지만 언젠가는 최측근이 되어 출세하겠다는 꿈을 가진 그에게 어느 날 해외 자금에 손 담그는 중대한 업무가 맡겨진다.','산경','테라코타','소설','재벌집 막내아들 4.jpg','/files/재벌집 막내아들 4.jpg',35000,10000,0,6000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(7,0,'재벌집 막내아들 5','2017년 2월부터 2018년 1월까지 1년여간 326화 연재되는 동안 단 한 번도 투데이베스트 1위를 놓치지 않을 만큼 수많은 독자들이 열광한 웹소설 <재벌집 막내아들>이 마침내 종이책으로 출간되었다.

순양그룹 미래전략기획본부 실장 윤현우는 재벌 총수 일가의 온갖 구린 일을 뒤처리하며 충성을 다하는 인물이다. 지금은 비록 재벌가의 뒤치다꺼리나 하고 있지만 언젠가는 최측근이 되어 출세하겠다는 꿈을 가진 그에게 어느 날 해외 자금에 손 담그는 중대한 업무가 맡겨진다.','산경','테라코타','소설','재벌집 막내아들 5.jpg','/files/재벌집 막내아들 5.jpg',35000,10000,0,7000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(8,0,'소설 보다 가을 2023','독자에게 늘 기대 이상의 가치를 전하는 특별 기획, 『소설 보다 : 가을 2023』이 출간되었다. 《소설 보다》는 문학과지성사가 분기마다 ‘이 계절의 소설’을 선정, 홈페이지에 그 결과를 공개하고 이를 계절마다 엮어 출간하는 단행본 프로젝트로 2018년에 시작되었다. 선정된 작품은 문지문학상 후보로 삼는다.

지난 5년간 꾸준히 출간된《소설 보다》시리즈는 젊은 작가들의 소설은 물론 선정위원이 직접 참여한 작가와의 인터뷰를 수록하여 독자들의 큰 호응을 얻었다. 앞으로도 계절마다 간행되는《소설 보다》는 주목받는 젊은 작가와 독자를 가장 신속하고 긴밀하게 연결하는 가교 역할을 충실히 해낼 것이다.','김지연','문화과지성사','소설','소설 보다 가을 2023.jpg','/files/소설 보다 가을 2023.jpg',3500,10000,0,8000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(9,0,'절대 막히지 않는 웹소설 작법','흥미진진한 전개, 시간을 순삭해버리는 재미로 날로 성장하고 있는 웹소설 분야. 이젠 드라마 등 다양한 콘텐츠의 원작으로도 인기를 얻고 있다. 누구에게나 열린 기회의 공간인 웹소설 작가가 되기 위해서 많은 작가들이 뛰어들고 있지만 그만큼 경쟁이 치열한 것도 사실. 어떤 작품은 흥행하고, 어떤 작품은 말 그대로 순식간에 묻혀버리고 만다. 흥행하는 웹소설에는 어떤 공식이 있는 걸까? 처음 시작하는 사람도 제대로 한 편의 웹소설을 완성해내고, 인기를 얻고, 다음 작품을 제대로 론칭할 수 있을까?','천지혜','콘텝츠랩오늘','소설','절대 막히지 않는 웹소설 작법.jpg','/files/절대 막히지 않는 웹소설 작법.jpg',18000,10000,0,9000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(10,0,'연결하는 소설','미디어를 테마로 한 단편 8편을 엮은 소설집. 책에는 미디어의 본질부터 미디어를 통한 소통, 미디어 리터러시까지, 김애란, 구소현, 오선영, 서이제, 김혜지, 임현석, 김보영, 전혜진 작가가 그려 낸 미디어 이야기가 담겨 있다.

책은, 지금도 어디에선가 미디어를 사용하고 있을, 자신의 이야기를 공유하는 게 더 이상 낯설지만은 않은 청소년과 2030 독자들에게 미디어를 향한 새로운 시선과 깊이 있는 공감을 선사한다. 더불어, 미디어를 소셜 미디어와 매스 미디어 등에 국한해 생각해 왔던 독자들이, ‘말’, ‘글’ 그리고 ‘책’이라는 원시적 미디어의 존재도 다시금 떠올리며 “미디어란 무엇인가?”라는 본질적인 물음까지 던질 수 있게 돕는다.','김애란','창비교육','소설','연결하는 소설.jpg','/files/연결하는 소설.jpg',17000,10000,0,9900,SYSDATE);


------------------------수필 11~20  ---------------------------------------------------------------------------------------------------------------------------

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(11,0,'일간 이슬아 수필집','','이슬아','혜엄','수필','일간 이슬아 수필집.jpg','/files/일간 이슬아 수필집.jpg',15300,10000,0,1000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(12,0,'관촌수필','문지클래식의 포문을 여는 책은 이문구의 <관촌수필>이다. 이 책은 1972년부터 6년에 걸쳐 씌어진 여덟 편의 중.단편소설을 묶어낸 연작소설집으로, 현재 충남 보령에 속하는 대천의 갈머리 마을[관촌冠村]에서 태어난 저자가 일제 강점기 말엽부터 시월 유신과 새마을 운동이 일어난 1970년대에 이르는 30여 년 동안 고향에서의 일을 풍부한 토속어를 활용해 서술하고 있다.','이문구','문학과지성사','수필','관촌수필.jpg','/files/관촌수필.jpg',15000,10000,0,2000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(13,0,'아름다운 우리 수필','훌륭한 수필은 높은 수준의 주제의식과 그에 걸맞는 문체, 삶의 정수를 꿰뚫어 볼 수 있는 통찰력, 그것을 담아낼 수 있는 미학적 구성능력이 있어야 한다. 수필 문학의 가치와 아름다움이 무엇인가, 어떻게 씌어진 수필이 진정한 수필인가를 알리기 위해 문학평론가 이태동 교수가 주축이 되어 아름다운 우리 수필 49편을 골라 엮었다.
','법정','문예출판사','수필','아름다운 우리 수필.jpg','/files/아름다운 우리 수필.jpg',18000,10000,0,3000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(14,0,'전등수필','우리 시대의 참된 수좌(首座)로 한국불교의 선맥(禪脈)을 잇고 있는 월암 스님이 『전등록』과 『선문염송』 등 여러 ‘전등사서(傳燈史書, 선사들의 법어와 선문답, 전법내력을 모아 놓은 책)’를 열람하며 깊은 울림으로 다가온 글귀를 엄선해 108편의 수필 형식으로 엮은 책이다. ‘전등사서’에서 가려 뽑은 이야기에 월암 스님 특유의 간결하고 담박한 해설과 법문이 더해진 이 책을 두고 스님은 ‘전등수필’이라는 새로운 이름을 창안했다.','월암','담앤북스','수필','전등수필.jpg','/files/전등수필.jpg',16800,10000,0,4000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(15,0,'한국대표수필 75','<한국대표수필 65>의 개정 증보판. 중고등학교 교과서 개정과 교육 과정 개편에 따라 꼭 포함돼야 할 필독 작품을 빠짐없이 추가하고, 수능·논술·내신을 위해 내용을 충실하게 보완했다. 75편이란 최다 작품을 수록하면서도 전문을 실어 완전한 감상을 할 수 있도록 했다. 작품 선정의 기준은 문학 교과서 수록 빈도, 문학사적 의의, 예술성을 기준으로 삼았다.

특히 ‘생각해 볼 문제’는 질문과 답변을 함께 제공해 독서 효과를 극대화할 수 있도록 하였고, 어려운 어휘는 괄호 안에 주석을 달아 내용을 바로 이해할 수 있도록 하였다. 작품 해설은 수행 평가와 독후감 쓰기에 대비할 수 있도록 생각을 유도하는 방식을 취했다.','피천득','리베르','수필','한국대표수필 75.jpg','/files/한국대표수필 75.jpg',16800,10000,0,5000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(16,0,'수필','수필','피천득','범우사','수필','수필.jpg','/files/수필.jpg',5900,10000,0,6000,SYSDATE);


INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(17,0,'아름다운 우리 고전 수필','설종, 최치원, 이규보, 박지원, 정약용, 허균, 김시습 등 우리 문단을 빛낸 선인들의 한문수필 64편을 골라엮었다. 전체 7장이며 주제별로 묶었는데 한문 문체의 특성도 고려했다. 說類에 해당하는 작품은 1장 記類 에 속하는 작품은 2장에, 3장은 祭文, 4장은 書類, 5장은 생활 주변의 일화, 6장은 疏와 論, 7장은 각종 獻詞를 모은 것이다.','권근','을유문화사','수필','아름다운 우리 고전 수필.jpg','/files/아름다운 우리 고전 수필.jpg',9000,10000,0,7000,SYSDATE);


INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(18,0,'좋은수필 2023.7','좋은수필 2023.7','좋은수필사 편집부','좋은수필사','수필','좋은수필 2023.7.jpg','/files/좋은수필 2023.7.jpg',10000,10000,0,8000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(19,0,'수필 쓰기','<세상 모든 글쓰기> 시리즈는 가장 효율적인 글쓰기 전략을 알려주기 위해 기획되었으며, 본 시리즈 중 10년 넘게 사랑받은 4권의 책이 개정 증보판으로 출간되었다. 각 분야의 최고 전문가들이 집필한 《브랜드 네이밍》《수필 쓰기》《우리말 맞춤법 띄어쓰기》《그림책 쓰기》는 누구나 쉽게 이해할 수 있는 글쓰기 지침서로, 이론부터 실전까지 단 한 권으로 섭렵할 수 있게 실용성을 최우선으로 하였다.

수필은 우리의 삶을 의미화하는 문학이자 삶의 철학이라고 저자는 말한다. 《수필 쓰기 : 삶의 의미화 에세이 작법》은 수필을 문학의 한 장르로 인식하고 출발하려는 사람, 수필을 통해 자신의 인생을 재발견하려는 사람을 위한 수필 쓰기의 모든 것을 담아낸 책이다.
','이정림','알에치코리아','수필','수필 쓰기.jpg','/files/수필 쓰기.jpg',11000,10000,0,9000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(20,0,'손광성의 수필 쓰기','피천득이 한 편 한 편이 모두 시 라고 할 정도로 문학성을 인정받은 수필가 손광성이 수필을 써오면서 얻은 경험에 기반을 둔 실전 수필 작법집 <손광성의 수필 쓰기>가 출간되었다. 이 책은 수필은 말맛으로 쓰고 말맛으로 읽는다는 그의 주장처럼 문장의 중요성에 기초한 실기 지도에 주안점을 두고 있다.

내용에 따른 올바른 단어 선택 문제에서부터 시작해서, 문장의 길이에 따른 효과의 차이, 효과적인 내용 전개법, 문학적 감동을 극대화하는 방법에 대한 표현의 문제, 구성, 집필, 퇴고에 이르기까지 구체적 실례를 통해 오류를 지적하고 독자와 함께 그에 대한 대안을 찾아 가는 방법으로 구성되어 있다.','손광성','을유문화사','수필','손광성의 수필 쓰기.jpg','/files/손광성의 수필 쓰기.jpg',15000,10000,0,11000,SYSDATE);


------------------------코미디 21~30 ---------------------------------------------------------------------------------------------------------------------------

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(21,0,'블랙코미디','
눈물 나게 웃기고 눈물 나게 아픈 유병재 농담집
개나 소나 책을 쓴다. 첫 문장부터 시선을 사로잡는 이 독특한 책은 코미디언 유병재가 세상에 처음 선보이는 에세이집이다. 부제 유병재 농담집 만 봐도 알 수 있듯이 유병재만이 구사할 수 있는 농담들로 가득하다.

"나는 굽실대지 않는 사람을 불친절하다고 생각했던 것 같다. 갑질은 내가 하는 것이었다." "빈손이 가장 행복하다고 많이 버릴수록 행복해진다고 부자들만 말하더라. 유병재식 블랙코미디, 즉, 웃어야 할지 울어야 할지 화내야 할지 말아야 할지 고민에 빠지게 되는 웃픈 농담들과, 모순덩어리인 인간과 부조리한 현실을 향해 차마 말로 내뱉지 못했던 분노들이 유병재체로 현란하게 펼쳐진다.
','유병재','비채','코미디','블랙코미디.jpg','/files/블랙코미디.jpg',13000,10000,0,1000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(22,0,'코미디영화의 이해','아모르문디 영화 총서 11권. 코미디영화를 이해하기 위해 크게 네 단계의 여정을 밟아나간다. 첫 번째로는 코미디영화의 장르적 특성에 대해 살펴본다. 두 번째로는 코미디영화의 내러티브적 특성, 즉 인물 유형, 갈등 구조, 해피엔딩에 대해 설명한다. 세 번째 단계에서는 웃음, 아이러니, 패러디, 정보 전략, 변장을 통해서 코미디영화의 특성을 이해해보고자 한다.

그리고 네 번째로 로맨틱 코미디, 조폭 코미디, 풍자 코미디, 액션 코미디, 여걸 코미디를 중심으로 코미디영화의 하부 장르를 설명한다. 이 과정을 통해 장르로서 코미디영화가 지니는 정체성과 역사적으로 진화해온 경로를 짚어보고, 코미디영화의 갈등 구조와 이야기 전략을 살펴본다.','서곡숙','아모르문디','코미디','코미디영화의 이해.jpg','/files/코미디영화의 이해.jpg',9000,10000,0,2000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(23,0,'헷갈려 코미디','시라쿠사와 원수지간인, 사기와 마법 행각으로 유명한 에페수스에 시라쿠사인 에게온 노인이 들어왔다 피체, 몸값을 치르지 않으면 사형당하는 신세를 맞는다. 입항 이유를 묻는 공작에게 노인은 18년 전 바다에서 풍랑을 만나 아내와 쌍둥이 자식 하나, 그리고 가난한 부모에게서 데려와 키운 쌍둥이 하인 하나를 잃었는데 시라쿠사에서 성장한 나머지 아들 안티폴루스와 나머지 하인 드로미오가 자기 쌍둥이 동생들을 찾겠다고 떠난 후 역시 소식이 없는지라 그들을 찾아보러 왔다고 하니 공작은 노인이 불쌍해서 24시간의 말미를 준다.…… 근대 초기, 봉건적 형태의 사회적 관계는 시장의 힘에 밀려 위기 상황을 맞게 된다. 주인-하인, 남편-아내, 부모-자녀, 토박이-이국인, 구매자-판매자, 군주-의회 등이 그렇다. 이 작품에서는 난파와 두 쌍의 이름이 같은 쌍둥이라는 구조 설정으로 중복과 혼란을 통해 낯익은 생활환경에서 낯설어 갈피를 못 잡게 하는 것들에 대해 주의를 기울일 것을 요구한다. 이 중복과 혼란은 마지막 5막에 이르러서야 질서와 이성을 회복한다. 그러나 이 원상회복은 클로징 제스추어를 통해 다시 한 번 가볍게 동요된다. 수녀원장이 된 에밀리아는 33년을 산통으로 지내다가 이제야 출산을 하고, 하인 드미트리오 형제는 형과 아우를 제비뽑기로 고르려다 그냥 함께 들어감으로써 기존의 위계질서를 흔든다. 에페수스의 드로미오 : 아니, 그러면 이렇게 하자. 우리가 형제와 형제로 세상에 태어났으니, 손잡고 들어가는 거야, 앞 뒤 서지 말고 말야.(5막 1장) 중복과 혼란 속에 자아와 개성에 대한 근본적 질문이 작품은, ‘자아란 무엇인가?’ ‘정체성의 담보는 무엇인가?’ ‘누가 이름을 소유하고 어떤 권리로 소유하는가?’ ‘개성은 어떻게 획득되는가?’ ‘한 사람이 어떻게 다른 사람을 대신하는가?’ 등의 질문을 제기한다. 이런 관점에서 본다면 이 작품은 줄거리가 단순하거나 단세포적인 익살극이거나 초보 극작가의 조야한 작품이라기보다는, 가장 분량이 짧지만 극장의 제한된 조건 속에서 문제들을 아주 정교하고 효율적으로 맞물려 배치하는 작품인 셈이다.','윌리엄 셰익스피어','아침이슬','코미디','헷갈려 코미디.jpg','/files/헷갈려 코미디.jpg',10000,10000,0,3000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(24,0,'로맨스와 코미디가 만났을 때','한국 로맨틱 코미디의 구조와 변형을 다룬 책이다. 먼저, 로맨틱 코미디의 발생 과정을 살펴본다. 장르적 성격을 파악해 보고, 장르 변형에 관한 선행 연구들을 정리하면서 한국 로맨틱 코미디 연구에 적용하기 쉬운 도구를 찾아본다. 또한, 한국 로맨틱 코미디 장르의 발전 단계를 구분하고, 그에 따른 변형 양상을 살펴보고 있다. 마지막으로, 한국 로맨틱 코미디의 변형 원인을 찾아본다.
','윤성은','이담북스','코미디','로맨스와 코미디가 만났을 때.jpg','/files/로맨스와 코미디가 만났을 때.jpg',14000,10000,0,4000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(25,0,'코미디, 웃음과 행복의 텍스트','코미디에 대한 이론서다. 웃음이 왜 터져 나오는지, 사람들 사이에 코미디가 어떻게 성립하는지 그 메커니즘을 이론적으로 파헤친다. 특히 국내 대중 오락물에 그 이론을 적용하여 해석하고 있어 웃음에 대한 사회문화적 해석을 유도한다.

고전적인 웃음 이론가인 프로이트와 베르그송으로부터 웃음과 코미디가 지니는 해체적 성격을 해석하고, ‘웃음과 코미디는 아이러니스트의 탈외디푸스적 텍스트’로 결론짓기까지 지은이는 우리 시대 수많은 영화와 드라마, 시트콤을 오가며 웃음이 튀어 나오는 방식들을 검증한다.

웃음과 대중 코미디에 대한 사회적 관심은 날로 증가하는 만큼 움직이는 텍스트인 코미디를 통해 웃음을 터트리고 생동하는 삶을 확인하는 데 적극적이고 풍성한 논거를 제공한다.','박근서','커뮤니케이션북스','코미디','코미디, 웃음과 행복의 텍스트.jpg','/files/코미디, 웃음과 행복의 텍스트.jpg',15000,10000,0,5000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(26,0,'차이에서 배워라','에미상과 피바디상 수상에 빛나는 스탠드업 코미디언이자 세계적 스타인 해나 개즈비의 에세이. 순회공연마다 매진 행렬을 기록하며 넷플릭스 스페셜로도 방영된 코미디 쇼 「나네트」(원제 “Nanette”, 한국어 제목 「해나 개즈비: 나의 이야기」)로 스탠드업 코미디의 새로운 역사를 썼다고 평가받는 해나 개즈비는 이 책에서 다양성을 억압하는 세상에 일침을 가하는 신랄한 코미디를 선보이게 된 과정을 회고한다. 전세계를 뒤흔든 해나 개즈비라는 코미디언이 어떻게 자신의 소수자성을 인정하고 차이를 포용하며 새로운 웃음을 발명하게 되었는지를 확인할 수 있다.

이 책에서 개즈비는 자폐, ADHD 진단을 받은 신경다양인이자 젠더퀴어로서 자신이 겪은 트라우마와 수치심을 강렬한 스토리텔링으로 풀어냈다. 이를 농담으로 전환해 예상치 못한 대목에서 분노와 웃음을 이끌어내는 솜씨 또한 유감없이 발휘한다. 젠더 정치, 대중문화, 서양미술사 등 다양한 주제를 가로지르며 웃음의 정치성과 분노의 용법에 대한 치열한 성찰도 담았다.','해나 개즈비','창비','코미디','차이에서 배워라.jpg','/files/차이에서 배워라.jpg',23000,10000,0,6000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(27,0,'새드엔딩은 없다','《안 느끼한 산문집》으로 강렬한 인상을 남긴 강이슬 작가가 더 강력한 긍정 바이러스로 돌아왔다. 서른 앞의 요동치는 마음 앞에서 작가는 말한다. “삶은 되감기와 빨리감기 없이 정속으로만 플레이되는 정직하고 생생한 현장”이라고. 그렇기에 과거를 묵묵히 소화해내고, 현재에 걸맞은 보폭으로 살며, 부러 미래를 앞당겨오지 않는다. 일상을 ‘일시 정지’시킨 후 매 순간을 촘촘히 살아낸다. 그 속에는 여전히 유쾌하면서 좀 더 노련해진 긍정이 알알이 배어 있다.

어릴 적부터 청춘까지 이어지는 가난을 “지긋지긋하고도 아름다웠던” 것이라 추억하는 이 작가에게 비교대상은 오직 ‘과거의 나’ 뿐이다. 그 다정한 시선 덕에 작가의 범위 안에 있는 애인, 가족, 동물, 심지어 지나가는 아이조차도 사랑스러움을 부여받는다.

자신의 실패에 당위성을 내려주고, 망해도 괜찮은 것이 생김을 기뻐하며, 거기에서 다시 시작할 용기를 얻는다. 걱정과 부정 대신 스스로에게 유리하게 설명하는 법을 솜씨 좋게 선택한다. 이쯤이면 “새드엔딩은 없다”라는 이 당돌한 제목에 절로 고개를 끄덕이게 된다. 그것은 단순한 정신승리가 아니다. 작가의 글로 빼곡하게 증명되는 선언이며, 지금 우리에게 필요한 삶의 태도다.','강이슬','웨일북','코미디','새드엔딩은 없다.jpg','/files/새드엔딩은 없다.jpg',14000,10000,0,7000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(28,0,'조선 로맨틱 코미디','조선 로맨틱 코미디','정민기','부크크','코미디','조선 로맨틱 코미디.jpg','/files/조선 로맨틱 코미디.jpg',7600,10000,0,8000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(29,0,'웃음박제','‘웃음박재’라는 이름으로 SNS를 사로잡은 스탠드업 코미디언. 무려 55명의 성대모사가 가능한 만능 엔터테이너! 박재우의 첫 번째 농담집이 출간되었다. 책에는 저자 박재우가 군생활을 하면서부터 매일 하루에 하나씩 차곡차곡 기록해서 모아 온 웃픈 순간들이 담겨 있다.

저자는 말한다. 세상을 조금 다른 각도로 바라보면 농담이 보인다고. 일상의 흐름을 비틀어 보고, 숨 막히게 답답한 순간에 발상의 전환을 곁들여 보고, 당연하다고 생각한 모든 것들에 왜? 라는 의문을 붙여 보면 알게 될 거다. 우리를 괴롭히던 심각한 일도 다른 면으로 보면 별 것 아닌 농담이 될 수 있다는 것을.

농담은 언제나 문제의 핵심을 벗어난 곳을 쿡쿡 건드린다. 그래서 자칫 가벼워 보일 수도 있지만, 모든 농담에는 뼈가 있다. 곱씹어 보면 이는 곧 직선적인 삶의 태도에 대한 진지한 고찰과도 연결되어 있다. 왜 곧이곧대로 받아들이는가? 세상을 이렇게 재미나게도 바라볼 수 있는데.
','박재우','부크럼','코미디','웃음박제.jpg','/files/웃음박제.jpg',17000,10000,0,9000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(30,0,'진지함의 중요성','오스카 와일드의 마지막 희곡이며 가장 유명한 대표작이다. 시종일관 재치와 유머로 귀족 사회를 풍자하는 이 작품은 공연에 성공함으로써 오스카 와일드에게 최고의 찬사와 부를 안겨주었다. 120년이 지난 지금도 전세계 곳곳에서 끊임없이 공연이 이어지고 있으며, 저자에겐 ‘셰익스피어 이후 최고의 극작가’라는 명예를 안겨준 작품이다.','오스카 와일드','돋을새김','코미디','진지함의 중요성.jpg','/files/진지함의 중요성.jpg',13000,10000,0,12000,SYSDATE);

------------------------연애 31~40  ---------------------------------------------------------------------------------------------------------------------------
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(31,0,'너무 한낮의 연애','너무 한낮의 연애로 2016년 제7회 젊은작가상 대상을 수상하며 한국문학 장을 뜨겁게 달구고 있는 소설가 김금희의 두번째 소설집. 첫 소설집 <센티멘털도 하루 이틀>로 제33회 신동엽문학상을 수상하며 작가로서의 가능성을 보여준 김금희는, 이제 명실상부 지금 가장 주목받는 젊은 작가가 되었다.

이번에 선보이는 소설집에는 2014년부터 2015년까지 발표된 9편의 작품이 수록된바, 이 점에서 문학에 대한 작가의 열정과 소설쓰기의 왕성함에 더불어, 한국문단이 김금희에게 걸고 있는 기대감도 한껏 느낄 수 있다. <너무 한낮의 연애>는 그 기대를 향한, 김금희의 수줍지만 당당한 응답이다.

문학평론가 정홍수는 너무 한낮의 연애에 대한 젊은작가상 심사평에서, 당시 이슈가 되었던 중력파의 검출 이야기로 서두를 시작한다. 그를 놀라게 한 것은 그 중력파가 십삼억 광년 전에 생성되어 지금의 우리 눈에 띄었다는 사실이라고. 나아가 정홍수는 "우리 나날의 일상 역시 관계의 충돌이나 비껴감(그리고 기타 등등) 속에서 미세하게 시공간을 진동하고 왜곡하는 모종의 파波를 생성하리라는 것은 충분히 짐작 가능한 일"이라고 말한다.

그리고 그 파장의 "미세한 누적이 임계치를 넘길 때 우리의 몸을 기울이고, 삶의 좌표를 슬그머니 옮겨놓는다"고. 십육 년 전 종로의 맥도날드에서 양희와 마주앉아 있었던 필용의 추억이 의식 밑에 잠겨 있다가, 무언가를 계기로 도달되어 그를 눈물 흘리게 했던 것처럼 말이다.
','김금희','문학동네','연애','너무 한낮의 연애.jpg','/files/너무 한낮의 연애.jpg',35000,10000,0,1000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(32,0,'올해엔 연애를 쉬겠어','다수의 시사·교양·예능 TV 프로그램에 출연하여 대중적 인지도를 쌓은 방송인이자 16년 차 변호사 임윤선의 에세이. 직접 겪었거나 주변에서 일어난 실제 연애담을 바탕으로 사랑과 연애, 결혼, 남녀 관계에 관한 날카로운 시각과 통찰을 담고 있다.

살갑고 달콤한 상황은 단 한 장면도 등장하지 않는다. 달달하게 시작하지만 쉽게 나락으로 떨어지고는 하는 연애의 극한 현실을 솔직하게. 묘사한다. 최고의 모습을 연출하는 소개팅에서의 첫 만남 이후 서로의 채점에 의해 감점이 누적되다가 결국에는 탈락하는 과정을 여과 없이 드러내고, 애초 시장에 ‘매물’로 나와서는 안 되는 이들이 작정하고 위장한 채 ‘상품’으로 둔갑해서는 상대의 삶마저 망가뜨리는 연애 사기극의 유형과 험난한 연애를 거쳐 결혼에 이르고도 여전히 관계의 불안으로부터 자유롭지 못한 부부들의 현실을 보여준다.

그렇다면 이 책은 연애와 결혼에 대한 혐오를 부추기는가? 그렇지는 않다. 일과 사업에서와 마찬가지로 연애에서도 실패할 자유와 특권이 차츰 줄어드는 세대에게는 예방주사와 같은 책이다. 관계에 너무 많은 것을 기대지 말고 먼저 단단한 개인으로 홀로 서라는 깨달음을 전한다. 그리고 한편으로는 연애와 관계에 상처 입은 이들에게 당신만 그런 것이 아니라는 위안을 준다. 과감한 비약과 반전으로 페이지가 순식간에 넘어가는 재미는 덤이다.
','임윤선','시공사','연애','올해엔 연애를 쉬겠어.jpg','/files/올해엔 연애를 쉬겠어.jpg',16800,10000,0,2000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(33,0,'연애보다 고양이','반려동물 600만 가구 시대, 이제 우리에게 반려동물은 너무도 익숙한 존재가 되었다. 하지만 우리는 과연 반려동물들의 마음을 얼마나 잘 이해하고 소통하고 있을까? 반려동물 가구 중 약 25%는 고양이를 키우고 있지만, 우리가 아는 고양이의 이미지는 대부분 강아지보다 독립적이고 도도하며 혼자 두는 시간이 많아도 괜찮다는 정도에 그친다.

집에 돌아와도 크게 반기지 않는 것 같더니 예상치 못한 순간에 몸을 사르르 부비며 다가오는 ‘밀당 고수’ 고양이에게 ‘심쿵’ 하는 당신, 『연애보다 고양이: 당신의 고양이가 하고 싶은 말』은 고양이를 조금 더 잘 이해할 수 있는 59가지 비밀들을 알려준다.

사랑은 관심에서, 감정의 소통은 관찰에서 시작된다. 소중한 가족임에도 언어가 통하지 않아 오해를 빚기도 하는 고양이들을 알기 위해서는 그들의 언어를 배워야 한다. 이 책은 고양이가 어떤 이유에서 특정 행동을 하는지, 고양이의 혓바닥이나 귀에 어떤 비밀이 숨어 있는지, 알쏭달쏭한 고양이의 마음을 가르쳐준다. 진짜 ‘사랑’을 배우고 싶다면 고양이를 키우는 것만으로도 충분하지 않을까? 겉모습에서는 잘 드러나지 않지만, 그런 도도함 뒤에 숨어 있는 진실된 고양이의 사랑법을 배울 수 있다.','앨리슨 데이비스','특별한서재','연애','연애보다 고양이.jpg','/files/연애보다 고양이.jpg',15000,10000,0,3000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(34,0,'MBTI 연애 심리학','사랑에 빠졌을 때, 우리는 상대의 모든 것이 궁금해진다. 뭘 좋아하지? 뭘 싫어하지? 핫플을 좋아하는지, 고즈넉한 장소를 좋아하는지? 유쾌한 사람을 좋아하는지, 다정한 사람을 좋아하는지? 화가 나면 대화로 푸는 스타일인지, 혼자 조용히 푸는 스타일인지? ‘그 사람’을 심층적으로 알고 싶어질 때, MBTI는 우리에게 많은 도움을 준다. MBTI가 개발된 배경이 나 자신을, 그리고 상대를 이해하고자 하는 것에서 출발했기 때문이다.

책 《MBTI 연애 심리학》은 MBTI를 연애에 유용하게 활용하기 위한 것으로, MBTI 4가지 척도와 16가지 유형별 설명을 담았다. 1부에서는 MBTI 4가지 척도별 연애 방식이 어떻게 달라지는지, 연애의 질적인 면에 가장 영향을 크게 미치는 갈등 위험도 순위에 대해 설명한다.

2부에서는 16가지 유형별로 어떤 성격적 특성을 가지고 있는지, 출생순위별로 어떻게 조금씩 달라지는지, 성격적 특성이 연애할 때 어떻게 반영되는지, 추천 데이트 코스와 연령대별 공략법까지 연애에 바로 적용할 수 있는 유용한 방법들을 중점적으로 제시한다. 각 MBTI별 특징의 마지막 부분에는 해당 MBTI를 사랑하는 사람을 위한 저자의 조언을 담았다.
','박성미','시크릿하우스','연애','MBTI 연애 심리학.jpg','/files/MBTI 연애 심리학.jpg',18000,10000,0,4000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(35,0,'낭만적 연애와 그 후의 일상','알랭 드 보통 장편소설. 사랑이 이루어지고 나면 연인들에게는 무슨 일이 벌어질까? 알랭 드 보통이 21년 만에 내놓은 이 소설은 결혼한 한 커플의 삶을 통해 일상의 범주에 들어온 사랑에 대해 통찰한다.

열렬히 사랑을 고백하고 영원을 약속한 연인도 어느 순간 상대의 유일무이함에 의구심을 품게 되기 마련이다. 그렇다면 그것은 애초에 사랑이 아니라는 낭만주의적 결론이나 사랑 자체가 존재하지 않는다는 비관론적 결론에 지체하지 않고 알랭 드 보통은 지금의 사랑을 어떻게 하면 지속가능하게 할 것인지에 대해 현실적인 논의를 펼친다.

독자들은 두 주인공 라비와 커스틴의 생활을 따라가며 점차 섹스의 스릴을 잃고, 함께하는 기쁨이 혼자일 필요성에 자리를 빼앗기고, 육아에 시달리고, 외도의 유혹에 흔들리는 모습 등 자신의 사랑에도 찾아올 수 있는 균열의 순간들을 만난다.

알랭 드 보통은 그런 순간들을 만들어내는 것이 개개인의 문제가 아닌 사랑과 결혼에 대한 잘못된 통념이며, 그러한 통념으로부터 벗어날 때 비관적인 미래로부터도 벗어날 수 있다고 말한다. 사랑은 열렬한 감정이라기보다 기술이라는 말로 응축된 그가 제안하는 유연한 사랑의 방식이 담긴 책이다.','알랭 드 보통','은행나무','연애','낭만적 연애와 그 후의 일상.jpg','/files/낭만적 연애와 그 후의 일상.jpg',13500,10000,0,5000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(36,0,'연애테스트 100제','연애테스트 100제','워터멜론 컴퍼니','워터멜론 컴퍼니','연애','연애테스트 100제.jpg','/files/연애테스트 100제.jpg',9900,10000,0,6000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(37,0,'어차피 연애는 남의 일','<일단 오늘은 나한테 잘합시다>를 펴낸 도대체 작가가 이번에는 연애 이야기로 다시 돌아왔다. 전작에서는 좋지 않은 상황에서도 어쩐지 웃기는 점을 발견해내는 특기를 살려 작가만의 삶의 긍정 기술을 들려주었다면, <어차피 연애는 남의 일>에서는 사랑과 연애에 관해 만화와 에세이로 다채롭게 풀어낸다.
이번 책은 저자 특유의 재치 넘치고 밝은 느낌은 유지하되 연애라는 한 가지 주제에 집중한 것인데, 남의 연애가 아니라 작가의 실제 경험담이기 때문에 현실적인 연애의 모습과 감정선을 직접적이고도 생생하게 담아냈다. 설레고 웃고 울고 아파했던 수많은 연애들. 그 무엇보다도 소중했던 사랑의 순간들. 누군가와 만나고 헤어지면서 그 누구도 절대 만나지 않겠다고 선언하는 일이 무색하게 또다시 연애를 시작하고야 마는 우리네의 모습이 아닐는지. 도대체 작가가 들려주는 이런 연애는 누구나 한번쯤 겪어본 보통의 연애다. 공감하지 않을 수 없다.','도대체','위즈덤하우스','연애','어차피 연애는 남의 일.jpg','/files/어차피 연애는 남의 일.jpg',13800,10000,0,7000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(38,0,'연애시대','방영된 지 10년이 넘었는데도 여전히 많은 이들에게 인생드라마로 회자되는 드라마가 있다. 손예진, 감우성 배우가 열연했던 명작 멜로드라마 〈연애시대〉다. 이 드라마의 원작 소설 《연애시대》가 모모에서 아름다운 소장본으로 출간됐다.

오랫동안 절판돼 수많은 독자들이 애타게 기다려온 이 책이 마침내 새로운 모습으로 독자들과 다시 만나게 된 것이다. 모모에서는 기존에 두 권으로 나뉘었던 책을 한 권으로 묶어 독서의 즐거움을 살리고, 양장본으로 아름답게 디자인해 두고두고 간직하고픈 책으로 만들었다.

《연애시대》는 헤어진 부부가 서로에게 손수 짝을 찾아주기로 결심하며 이야기가 시작된다. 이들에게 남은 건 미련일까, 사랑일까? 이들을 둘러싼 가족과 친구들은 밥을 먹고, 술을 마시고, 노래방에 가는 등 함께 어울리며 연애와 사랑의 진짜 의미가 무엇인지 서로에게 묻는다. 하나같이 매력적인 인물들이 펼치는 엉뚱하면서도 현실적인 사랑의 곡예는 작품 속 그들만의 이야기가 아닌 나와 내 주변의 평범하고도 특별한 연애담으로 다가온다.','노자와 히사시','모모','연애','연애시대.jpg','/files/연애시대.jpg',17000,10000,0,8000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(39,0,'연애의 실험','서강대학교 물리학과 교수, 씨엘 아빠. 『연애의 실험』은 그냥 사람, 이기진이 쓴 책이다. 사랑하는 사람을 만나며 마주칠 수밖에 없는 알록달록한 감정을 그림과 함께 담았다. 즉, 이 책의 그림은 연애 감정의 표현이다.

연애 실험은 ‘연애란 사랑하는 사람이 생각한 만큼 아름답지 않다는 사실을 깨달아가는 과정이다’라는 정의로 시작한다. 사랑의 모든 순간에 대한 이해는 어느새 자신에 대한 이해의 시간으로 간직된다. ‘누군가’를 사랑하는 ‘자신’의 불완전한 감정을 이해하기 위해서라도 경험해볼 가치가 있는 실험이다.

이 책의 첫 문장 ‘그림은 나에게 또 다른 우주였다. 세상을 직선으로만 바라보지 않고 곡선으로 바라보는 시선을 안겨주었다’는 매일매일 연애하는 기분으로 그림 그리는 시간을 만나는 일상 아티스트 이기진의 시선이자, 공식이 존재하지 않는 세상을 살아가는 우리들의 다짐이 될 것이다.
','이기진','진풍경','연애','연애의 실험.jpg','/files/연애의 실험.jpg',17000,10000,0,9000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(40,0,'아주 보통의 연애','2006년 문학동네신인상을 수상하며 등단한 이래 장편소설 <스타일>, <다이어트의 여왕> 등을 발표하면서 현대 여성들의 사랑과 욕망을 감각적으로 그려내고 있는 소설가 백영옥의 첫번째 소설집. 등단작인 문학동네신인상 수상작 고양이 샨티를 비롯해 총 여덟 편의 단편이 수록되어 있다.

영수증과 사랑에 빠진 사무원, 유방암에 걸린 아버지, 내 애인을 사랑한 고양이 등 누구에게도 이해받지 못한, 누구에게도 말할 수 없었던 처절한 욕망과 진심에 관한 이야기가 담겨 있다. 작가는 이번 소설집에서 공식적인 직함.직업 뒤로 숨어버린 현대인의 감춰진 욕망과 진심을 깊이 들여다보고 그 속에서의 소통 가능성을 모색한다.

표제작 아주 보통의 연애에서 잡지사 관리팀 직원 나 는, 한 인간의 모든 욕망을 그가 사용한 영수증을 통해 해독해낼 수 있다고 믿고 있다. 내가 짝사랑하는 패션팀 수석 이정우의 삶 역시 그가 나에게 제출하는 영수증으로 속속들이 파악하고 있는 것이다. 어느 날 저녁식사를 대접하겠다며 나를 이태리 식당으로 데려간 이정우는 실은 자기가 반지 영수증을 잃어버렸다고 고백하는데…
','백영옥','문학동네','연애','아주 보통의 연애.jpg','/files/아주 보통의 연애.jpg',10000,10000,0,13000,SYSDATE);


------------------------공포 41~50  ---------------------------------------------------------------------------------------------------------------------------
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(41,0,'공포의 권력','불가리아 출신의 기호학자이자 정신분석학자인 줄리아 크리스테바는 <공포의 권력>을 통해 아브젝시옹 이라는 주제에 주목한다. 아브젝시옹(abjection)이란 라틴어의 abjectio에서 유래하며, 공간적 간격. 분리. 제거를 의미하는 접두사 ab-와 내던져 버리는 행위를 나타내는 jectio로 이루어지는 단어다. 이는 프랑스어로 비열, 타락, 포기 등의 뜻을 갖고 있다.

저자는 아브젝시옹을 죄, 오염, 더러움, 근친상간, 도착증, 질병에 걸린 육체 등 혐오와 공포를 불러일으키기에 억압되어온 모두를 포함하는 개념으로 사용한다. 책의 제1장에서는 현상학적 측면에서 아브젝시옹을 검토하며, 제2장에서는 정신분석 이론을 통해 공포증와 정신질환의 구조를 살피며 그 개념을 명확히 하려 한다.

제3장에선 오래 전부터 인간의 의식(儀式)들 속에서 치뤄지는 정화 행위의 본질이 아브젝시옹을 통한 의식이라는 사실에 주목하며, 제4장과 5장에선 <성경>을 주축으로 하여 동서고금의 모든 종교가 억압해왔던 아브젝시옹이야말로 그를 지탱해 온 힘이라는 것을 강조한다.

크리스테바는 프랑스의 작가 셀린이 질병과 육체의 붕괴, 윤리와 도덕의 피폐, 가족과 집단 공동체의 붕괴 및 제 1, 2차 세계대전과 같은 아브젝시옹의 상태에 편집증적으로 천착해왔다는 데 관심을 갖는다. 그녀는 제6장부터 셀린의 저작(著作)을 정치적, 전기적, 문학적으로 분석하며 아브젝시옹이 통쾌함과 정화 작용을 가져다 준다는 것에 주목한다.

크리스테바는 책의 말미에서 이 책의 목적은 공포가 그 의미와 힘을 포함하여 보편적인 체계 안에 어떻게 자리하고 있는가를 증명하는 데 있다라고 밝힌다. 아브젝시옹은 공포를 불러오며, 그 중심에는 권력이 자리하고 있다. 한 번에 이를 꿰뚫어 보긴 어렵지만, 종교와 같은 체계에서 필연적으로 산출되는 권력의 베일을 벗겨내는 작업을 통해 우리는 아브젝트에 대하여 서서히 알아갈 수 있는 것이다. 그 작업을 돕는 것은 바로 문학이라는 것이 그녀의 결론이다.

난해한 개념과 용어 때문에 선뜻 손이 가지 않을지는 몰라도, 그를 하나씩 파악해가는 재미를 알고 있는 이들이라면 놓치지 말아야 할 책이다. - 조선영(2001-11-28)','줄리아 크리스테바','서민원','공포','공포의 권력.jpg','/files/공포의 권력.jpg',20700,10000,0,1000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(42,0,'러브크래프트의 공포들','초자연적 존재들과 꿈의 장벽 너머의 것들을 연구하는 현장 관찰자의 핸드북.','샌디 피터슨','초여명','공포','러브크래프트의 공포들.jpg','/files/러브크래프트의 공포들.jpg',51000,10000,0,2000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(43,0,'공포와 광기에 관한 사전','희귀하고 친숙한 공포증(phobia)과 광기(mania)에 관한 개론서. 인간이 가진 모든 두려움과 집착을 이해할 수 있을까? 이 책은 99가지 공포증과 광기, 즉 강박(obsession)을 소개한다. 뱀공포증과 거미공포증같이 진화적인 본능에 따른 것부터 튤립광, 허언증, 방화광같이 우리가 억누른 욕망의 산물까지, 99가지 강박에서 인류 진화의 역사와 개인의 역사가 남긴 섬뜩한 흔적을 살펴본다.

공포증과 광기는 인간 내면의 풍경을 드러낸다. 우리를 움찔 뒤로 물러서게 만드는 것, 열광하게 만드는 것, 우리 머릿속에서 몰아낼 수 없는 것들이 공포증과 광기의 목록에서 드러난다. 공포증과 광기를 한 자리에 모아놓으면 우리 시대의 가장 흔한 불안장애들을 일별할 수 있다.

케이트 서머스케일은 공포와 광기 너머에 있는 매혹적인 이야기들을 독창적인 역사 연구로 끄집어낸다. 이 책은 이야기 창작에 도움이 되는 참고서, 인간 내면의 기이한 작동 방식을 다룬 인문서로 읽을 수 있다.
','케이트 서머스케일','한겨레출판','공포','공포와 광기에 관한 사전.jpg','/files/공포와 광기에 관한 사전.jpg',18000,10000,0,3000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(44,0,'인간종에 대한 음모','H. P. 러브크래프트의 계보를 잇는 초자연적 공포소설의 거장 토머스 리고티의 철학 에세이. 코스믹 호러 장르의 염세적인 세계관을 담은 이 책에서 리고티는 인간을 자의식이라는 끔찍한 잉여를 지닌 무(無)에 불과하다고 보는 노르웨이의 반출생주의 철학자 삽페(Zapffe)의 파격적인 주장을 빌려와 자신만의 근본주의적 비관론을 펼쳐나간다.

인간을 ‘두 발로 걸어 다니는 비실재’로 보고, 세계를 ‘악의적으로 쓸모없다’고 치부하는 염세주의 극좌파 리고티에게 쇼펜하우어는 변절한 비관주의자이고 니체는 온건한 허무주의자일 따름이다. 염세주의에 관한 철학과 문학, 신경과학의 탐구를 통해 공포가 우리 상상력의 산물이 아니라 적나라한 현실 자체임을 보여주려는 이 책은 독자에게 예기치 못한 부정성의 해방감을 맛보게 해준다.','토마스 리고티','필로소픽','공포','인간종에 대한 음모.jpg','/files/인간종에 대한 음모.jpg',23000,10000,0,4000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(45,0,'한 번도 경험해보지 못한 새로운 북한이 온다','김여정은 왜 갑자기 남한·남조선을 ‘대한민국’이라고 칭하기 시작했을까? 김정은은 왜 미국의 비핵화 협상 요구에 수년째 묵묵부답일까? 북한은 왜 남한의 인도적 지원 제안을 10년 이상 거절하고 있을까? 냉전 시대에도 없던 ‘한미일 대 북중러’의 대결은 정말로 벌어질까? ‘북핵 vs. 미핵’이라는 불가역적 핵시대가 도래한 한반도에서 ‘공포의 균형’은 가능할까? 국내 최고의 한미동맹·북핵문제 연구자 정욱식이 2019년 이후 우리가 알던 모습과는 판이한 행보를 걷고 있는 북한을 들여다보고, 그에 따른 남북·북미 관계의 변화, 나아가 동아시아 질서의 지각변동을 내다본다.','정욱식','서해문집','공포','한 번도 경험해보지 못한 새로운 북한이 온다.jpg','/files/한 번도 경험해보지 못한 새로운 북한이 온다.jpg',16500,10000,0,5000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(46,0,'R의 공포가 온다','저자는, 현재 전 세계적인 하이퍼인플레이션 상황에서 과거 위기를 정리, 분석하여 지금의 위기상황을 어떻게 대비할 것인지 대안을 제시하기 위해 책을 썼다. 경제위기는 경기순환 주기에 따라 반복해서 일어날 수밖에 없는 경제현상이기 때문이다. 또한 짙은 먹구름과 강력한 파도가 예상되는 현 시점에서 가계나 기업이 얼마나 효율적으로 준비하고 대응하느냐, 즉 리스크 관리가 무엇보다 중요한 타이밍이기 때문이다.

경제위기는 감내하기 어려운 고통을 수반하지만, 짙은 먹구름 뒤에서도 여전히 태양이 이글거리듯, 그리고 먹구름이 걷히면 여전히 빛나는 태양을 만날 수 있듯, 미래의 성장을 위한 준비단계로 부채, 자산을 조정하고 교육, 연구개발, 투자를 통해 미래를 준비하는 도약 단계를 의미한다. 통상 이를 ‘위기는 기회다’로 표현하는데, 구호에 그치지 않으려면 경제위기를 바라보는 종합적인 시각을 가져야 한다. 이 책은 그런 시각을 갖도록 하는 게 목적이다.
','김효신','트러스트북스','공포','R의 공포가 온다.jpg','/files/R의 공포가 온다.jpg',20000,10000,0,6000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(47,0,'공포의 텍스트','1982년 리먼 비처 강좌로 시작되었다. 40년이 흘러 ‘공포의 텍스트’는 이제 영미 성서학계에서 관용어가 되었다. 이 책에는 수사비평의 대가가 성서를 읽어 내는 방식이 잘 드러나 있지만, 무엇보다도 그 방식을 통해 나타나는 내용 자체가 시간을 가로질러 모든 이에게 중요하다. 비극이 끝나지 않았고 오늘날에도 여전하며 모두에 의해 재생산되고 있기 때문이다. 성서를 읽는 방법론을 배우려고 이 책을 집어 든 독자도 실존적이며 신앙적인 도전에 직면하게 될 것이다.
','필리스 트리블','도서출판100','공포','공포의 텍스트.jpg','/files/공포의 텍스트.jpg',12000,10000,0,7000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(48,0,'경제적 공포','비비안느 포레스테 (Viviane Forrester) (지은이) 저자파일 신간알리미 신청 비비안느 포레스테는 소설가이자 에세이스트, <르 몽드>의 문학비평가, ‘페미나’ 문학상의 심사위원으로 활약중이며, 지은책으로는 <반 고흐 또는 밀 속의 매장>, <향연>, <밤의 눈>, <단검들의 유희>,<손>,<기병대들의 길>,<전쟁이 끝난 후>,<오늘 저녁> 등이 있다. 특히 1996년 메디시스상을 수상한 <경제적 공포>는, 마르크스 이후 가장 많이 팔린 경제서로 알려져 있으며 전세계적인 반향을 불러일으켰다.','비비안느 포레스테','동문선','공포','경제적 공포.jpg','/files/경제적 공포.jpg',7000,10000,0,8000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(49,0,'감정 공포 치료','단기역동정신치료(STDP)는 강력하고, 시간 효율적이며, 초점이 있고, 통합된 형태의 치료다. 이 책은 많은 정신병리가 감정 공포?감정에 대한 공포심?에 뿌리를 두고 있다는 생각에 기반을 두고 있다. 이 감정 공포라는 개념은 정신역동적 갈등 개념을 학습이론과 행동치료의 용어로 재구성한 것이다.
이 책의 목적은 감정 공포에 초점을 두고 단기역동정신치료(STDP)를 어떻게 하는지를 가르치는 것이다. 이 책에서는 이론에 대한 소개는 물론, 치료 과정과 기법의 예시에 대한 자세한 설명을 담고 있다. 특히 각 장의 마지막에 나오는 연습문제는 이론을 실제와 연결하는 데 도움을 준다. 따라서 이 책은 구체적인 단기역동정신치료(STDP)를 익힐 수 있는 실습 안내서로서 실제적인 치료 역량을 증진하는 데 크게 활용될 수 있다.','Leigh McCullough','학지사','공포','감정 공포 치료.jpg','/files/감정 공포 치료.jpg',20000,10000,0,9000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(50,0,'공포의 집','철학자 고병권과 함께 카를 마르크스의 『자본』을 공부하자는 취지로 지난해 여름(2018년 8월) 시작한 프로젝트 <북클럽『자본』> 시리즈 그 여섯 번째 책. 신간 『공포의 집』에서는 마르크스의 『자본』 제3편 ‘절대적 잉여가치의 생산’ 가운데 ‘노동일’ 부분(제8~9장)을 함께 읽고 분석한다.

가치의 실체가 ‘자본’이 아니라 노동자 한 사람 한 사람의 생명을 짜 넣는 ‘노동’에 있음을 확인한 데서 한발 더 나아가, 이번 6권 『공포의 집』은 우리를 더 비참한 현실 속으로 데려간다. 그 끔찍한 공포의 집, 즉 공장과 일터에서 노동자들은 장시간 과로에 시달리며 죽어가고 있다.','고병권','천년의상상','공포','공포의 집.jpg','/files/공포의 집.jpg',13900,10000,0,14000,SYSDATE);


------------------------인문학 51~60  ---------------------------------------------------------------------------------------------------------------------------
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(51,0,'아무것도하지않는법','“아무것도 하지 않는 것은 휴대폰을 내려놓고 그 자리에 가만히 머무는 것이다.” 『아무것도 하지 않는 법』의 저자 제니 오델은 소셜미디어를 비롯한 관심경제에 사로잡힌 관심의 주권을 되찾아 다른 방향으로 확장하자고 제안한다.

우리가 관심을 기울여야 할 곳은 작고 네모난 기기가 아니라 실제 세계의 시공간이다. 새를 관찰하는 시간을 해독제로 여기고, 공원에서 많은 시간을 보내는 저자는 자신의 경험과 예술, 철학, 역사 속에서 건져 올린 다양한 사례를 시적인 문체로 엮으며 관심을 기울일 때 확장되는 세계를 생생하게 펼쳐 보인다. 다정하면서도 선명한 목소리를 지닌 제니 오델의 매력적인 데뷔작은 버락 오바마가 추천하고, 뉴욕타임스 베스트셀러에 오르며 많은 독자와 만났다.','제니 오델','필로우','인문학','아무것도하지않는법.jpg','/files/아무것도하지않는법.jpg',18500,10000,0,1000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(52,0,'관계의 교실','학생들을 아끼고 사랑하지만, 학생과의 관계에서 크고 작은 어려움을 겪는 교사들을 위한 책. 정신과 의사이자 대안학교 교장으로 활동하는 김현수 교수가 관계의 심리학을 연구하는 교사단과 함께 탐독한 후 우리말로 옮겨 소개한다.

지은이 필립 라일리는 교육학자이자 심리학자로, 교사와 상담심리사가 겪는 어려움의 유사성에 주목한다. 두 전문직 모두 관계를 기반으로 고강도의 감정 노동을 수행하지만, 상담심리사가 이에 대한 전문적 훈련을 받는 데 반해 교사는 무방비 상태로 교육 현장에 투입된다. 교사와 학생 간 원초적 감정이 오가는 교실에서 필연적으로 교사는 관계로 인한 어려움에 직면하고 정서적으로 소진된다.

책이 제시하는 해법은 성인 애착 이론이다. 모든 인간관계의 기초가 되는 애착이라는 개념을 설명하고, 교사 자신의 애착 유형, 즉 타인과 관계를 맺는 방식을 자각하게 함으로써 학생을 비롯한 학교 구성원들과의 관계를 재정립할 수 있도록 돕는다. 또한 학교 차원에서 교사들을 위한 정서적 안전기지를 구축하는 방안을 제시하여 모든 교사가 건강한 안정감 속에서 교직 생활을 영위할 수 있도록 안내한다.','필립 라일리','지식의날개','인문학','관계의 교실.jpg','/files/관계의 교실.jpg',35000,10000,1,2000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(53,0,'우리 아이 첫 인문학 사전','스펀지처럼 모든 것을 빨아들이는 초등학교 저학년, 이때 아이가 접하게 되는 단어는 매우 중요하다. 바로 우리 아이의 첫 번째 가치관을 형성하기 때문이다. 이 시기의 아이는 단어의 뜻은 물론, 그것에 담긴 생각과 태도까지도 흡수한다. 자극적인 미디어를 통해 거칠고 폭력적인 어휘에 노출된 아이는 그 단어에 담긴 부정적인 태도를 함께 배우게 된다. 하지만 다양한 삶의 태도와 책을 통해 아름다운 가치를 지닌 단어를 많이 접한 아이는 같은 상황에서 완전히 다르게 생각하는 힘을 지닌다.

인문학은 인류 최고의 지성들이 만든 삶의 나침반과도 같다. 자녀교육 멘토 김종원 작가는 육아의 방향성을 잃은 부모들이 인문학 수업을 통해 변하는 모습을 지켜보며, 그 힘을 아이들에게도 전하고자 《우리 아이 첫 인문학 사전》을 집필했다. 이 책에는 저자가 직접 선별한 30개의 단어를 수록했는데, 단어를 단순히 나열한 것이 아니라 ‘지혜롭게 말하기’, ‘쓸모 찾기’, ‘가능성 열기’ 등 아이가 단어에 담긴 구체적인 행동을 생각해 보고 옮길 수 있도록 구성했다.

또한 단어가 지닌 뜻을 일러스트로 제시하고, 단어에 담긴 인문학적인 가치를 쉽게 풀어 설명했다. 아이와 함께 단어를 배운 뒤에는 ‘생각하기’에 있는 질문들을 꼭 던져 보자. 단어를 통해 배운 좋은 태도를 어떻게 실천하면 좋을지 구체적으로 생각할 수 있는 중요한 과정이다. 마지막으로 ‘낭독하기’를 통해 아이가 소리 내어 읽으며 굳은 다짐을 통해 단어와 그 안에 담긴 가치를 자신의 것으로 만들 수 있도록 했다.

이러한 학습법으로 인문학 단어 30개에 담긴 건강하고 단단한 태도가 고스란히 아이에게 스며들 것이다. 스스로 생각하고 답을 찾는 아이, 그 어떤 어려움에도 휘둘리지 않는 아이로 키우고 싶다면 이 책은 그 완벽한 첫걸음이다.','김종원','청림Life','인문학','우리 아이 첫 인문학 사전.jpg','/files/우리 아이 첫 인문학 사전.jpg',13000,10000,0,3000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(54,0,'부의 인문학','지금까지 인문학을 ‘투자’라는 렌즈를 통해 바라본 책은 없었다. 인문학을 이토록 쉽고 재미있게, 투자의 눈을 뜨게 하는 도구로 사용할 수 있다는 것만으로도 흥미롭다. 저자는 자기 안에서 소화된 인문학과 지금의 우리 현실을 씨실과 날실로 엮어가며 투자에 대한 거대한 태피스트리를 엮어간다.

1장은 우리가 왜 책을 읽어야 하는지, 철학이 우리의 생각과 삶의 모습을 어떻게 변화시키는지 일상의 언어로 설명하며 철학이 어떻게 투자의 무기가 되는지 알려준다. 2장에서는 정치나 정책 안에서 경제와 경기가 움직이는 원리가 무엇인지, 그것이 우리의 삶을 어떻게 변화시키는지 자세히 설명하며 사람들이 왜 ‘노예의 삶’을 선택하는지 이야기한다.

3장에서는 부동산 가격이 움직이는 메커니즘을 통해 오늘 우리에게 필요한 현실적인 부동산 투자법은 무엇인지 제안하고, 4장에서는 천재 경제학자들의 이론에서 도출해 낸 필승 주식 투자법을 소개해 개인 투자가들이 실수와 실패를 줄일 수 있도록 응원한다. 5장에서는 인문학을 기반으로 돈의 흐름과 부의 작동원리를 읽는 법을 밝힘으로써 투자에 대한 고정관념과 오해를 깨치고 하고, 6장에서는 인간의 본성과 자본주의의 원리를 간파하고 성공 투자의 청사진을 그릴 수 있게 이끌어준다.
','우석','오픈마인드','인문학','부의 인문학.jpg','/files/부의 인문학.jpg',17000,10000,0,4000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(55,0,'66일 인문학 대화법','대한민국 30만 학부모가 선택한 인문학 자녀교육의 멘토이자 『부모의 말』, 『내 아이를 위한 하루 한 줄 인문학』, 『하루 한 줄 인문학 질문의 기적』 김종원 작가의 책이다. 육아서를 아무리 읽어도 정작 ‘말’이 달라지지 않아 고민인 부모들에게 가뭄에 단비 같은 자녀교육 실용서이다.

이 책은 하나의 행동이 한 사람의 삶을 바꿀 습관으로 만들어지는 데 필요한 최소한의 기간인 ‘66일’과 ‘인문학 대화법’이라는 지적 장치를 하나로 연결함으로써 부모들의 실천력을 더욱 효과적으로 끌어올린 자녀교육 실용서이다. 저자는 지난 20년간 인문학을 연구하고 부모와 아이를 위한 75권의 책을 출간한 끝에, 인문학에 있어 무엇보다 중요한 것은 ‘가장 소중한 사람에게 예쁘게 말하기’임을 깨달았다.

부모의 한 마디의 격려와 진실한 칭찬이 울고 있는 아이의 현실을 바꿀 수 있고, 그로써 아이의 미래는 근사하게 변화하기 때문이다. 그리고 66일 동안 하루에 하나씩 부모가 직접 실천할 수 있는, 아이의 사고를 키워주고 지적인 능력을 상승하게 도와주는 부모의 66가지 인문학 대화법을 이 책에 알차게 담아냈다.

저자가 말하는 ‘인문학 대화법’이란 거창하지도, 비장하지도 않다. 모든 부모가 쉽게 따라 할 수 있는 일상의 언어로 구성되었기에 ‘이번에는 정말 부모의 말을 제대로 배우고 습관으로 만들겠다!’ 하고 마음만 먹는다면 누구든 곧바로 실천할 수 있다. 또한, 부모의 말을 단순히 눈으로 읽기만 하는 것이 아니라 부모가 직접 손으로 따라 쓰고 낭독하며 마음에 새길 수 있도록 ‘필사와 낭독’ 공간을 본문 곳곳에 마련해두었다.
','김종원','카시오페아','인문학','66일 인문학 대화법.jpg','/files/66일 인문학 대화법.jpg',17500,10000,0,5000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(56,0,'자본주의 인문학 산책','인류가 현재 누리고 있는 21세기 ‘물질적 풍요’를 만들어내는 제도는 자본주의다. 자본주의는 세계를 하나로 만들었지만, 내용을 자세히 들여다보면 놀라울 정도의 문화적 다양성이 존재한다. 일상의 영역에서 그 요소들을 하나하나 들여다보면 당대의 문화적인 시대상과 사회상이 담겨 있고, 역사·미학·경제학적 의미까지 다양한 해석이 존재할 수 있다. 지구촌 물질문명을 매개로 자본주의와 문화의 상호작용을 관찰해보면, 얼마나 다채롭고 흥미로운 발견이 많을까?

우리 일상의 의식주를 시작으로 유통, 화폐, 금융, 건강, 스포츠, 예술, 관광, 교육, 전쟁, 정치까지… 인류 역사상 중요한 23가지 테마별로 자본주의 세계가 시간의 흐름에 따라 어떻게 변모해왔는지를 들여다보는 작업은 매우 재미있고 유익한 경험이 될 것이다. 일상의 자본주의는 어떻게 우리의 세계를 움직이고 변화시켰는가? 그 흥미진진한 이야기가 펼쳐진다.
','조홍식','한국경제신문','인문학','자본주의 인문학 산책.jpg','/files/자본주의 인문학 산책.jpg',19800,10000,0,6000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(57,0,'인문학 독자를 위한 금강경','집착과 고통의 번뇌는 시시때때로 생겨나 우리를 옭아맨다. 그런 번뇌를 끊는 강력한 지혜를 담은 『금강경』, 이 경전에 담긴 붓다의 가르침은 무엇이며, 현재를 살아가는 우리에게 어떤 도움을 줄 수 있을까? 이러한 질문들에 명쾌한 답을 내려줄 『금강경』 해설서가 출간됐다.

동국대 다르마칼리지 부교수로 재직하며, 강단에서 『금강경』의 가르침을 전하고 있는 저자의 글은 “누군가 애써 마음먹은 불교 공부가 낯선 개념과 용어들에 가로막히는 일은 없었으면 하는 바람으로” 완성되었다. 마그리트의 파이프 그림, 무지개의 스펙트럼과 같은 친숙한 사례들을 예시로 들어 수수께끼 같은 경전 속 말들이 어떤 의미인지 차근차근 소개하는 글을 차분히 읽어나가면 알쏭달쏭하던 『금강경』의 뜻이 와닿을 것이다.','김성옥','불광출판사','인문학','인문학 독자를 위한 금강경.jpg','/files/인문학 독자를 위한 금강경.jpg',16000,10000,0,7000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(58,0,'직원의 심리를 꿰뚫어줄 치과용 인문학','저자가 치과 관리자로 근무했던 6년 중 마지막 3년 동안 퇴사자는 없었다. 이는 치과계에서 굉장히 이례적인 사례인데, 심지어 당시 내부 분위기도 상당히 좋았다고 한다. 그때 활용했던 심리학, 인문학 이론들을 모두 담아 이 책이 나오게 되었다.

일반 치과위생사 직원이었던 저자는 처음 관리자라는 직함을 달았을 때만 해도 크게 부담이 없었다. 하지만 범람하는 새 업무들과 앞으로 익혀야 할 낯선 일들을 감당하기가 벅찼다. 관리자라는 위치에 맞게 책임도 무거워진 와중에 가장 힘들었던 것은 다름 아닌 ‘직원들 사이의 갈등 수습하기’였다.

그때 저자를 일으켜준 건 인문학이었다. 원래 하고 있던 심리학 공부와 더불어 다양한 인문학 이론을 알게 된 저자는 그것을 본인의 치과 업무에도 적용해보았고, 인간의 마음을 꿰뚫는 이론을 통해 직원들의 퇴사를 막을 수 있었다. 만약 당신이 직원들이 계속 퇴사하는 치과의 리더라면, 쓸쓸히 다음 퇴사자를 맞이하지 않도록 근본적인 문제해결을 해야 한다. 흔히들 급여 인상이나 복지 늘리기를 가장 많이 택하지만 리더들에게 필요한 요소는 따로 있다. 바로 ‘인간의 다양성에 대한 이해’이다.
','조성용','미다스북스','인문학','직원의 심리를 꿰뚫어줄 치과용 인문학.jpg','/files/직원의 심리를 꿰뚫어줄 치과용 인문학.jpg',20000,10000,0,8000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(59,0,'완벽한 자유와 부를 만드는 인생투자','인생과 투자는 문제은행 방식으로 움직이지 않는다. 세상에 똑같은 순간은 단 1초도 없는 것처럼, 투자는 절대 반복되지 않는다. 앵무새처럼 외워서는 이길 수 없는 게임이 투자의 세계다. 어제의 정답이 오늘은 틀린 이유를 스스로 찾아야 성공할 수 있다. 매사를 전략적으로 생각하고 천천히 움직여야 한다.

우석의 이야기는 한결같다. 그래서 읽을 때마다 새롭다. 이 작은 역설이 성공투자의 비결이다. 날마다 새롭게 새기는 흔들리지 않는 철학이야말로 성공의 열쇠이기 때문이다.

이 책은 성공한 투자가이며 관련 분야의 독보적인 논객인 우석의 인생철학을 담고 있다. 경제적 자유를 얻는 방법뿐만 아니라 직장 생활은 어떤 마인드로 해야 하는지, 불행을 피하고 행복하게 살기 위해서는 어떻게 해야 하는지, 자녀를 어떤 마음으로 키워야 하는지 등 평소 그가 갖고 있던 생각을 그대로 담았다. 그는 학교에서 가르쳐주지는 않지만 인생에서 꼭 필요하고 생각하는 것에 대해 자신이 깨달은 바를 나누고 싶다고 밝히고 있다. 투자에 성공하기 위해 장착해야 할 삶의 철학을 잔잔한 호흡으로 풀어가고 있다.
','우석','오픈마인드','인문학','완벽한 자유와 부를 만드는 인생투자.jpg','/files/완벽한 자유와 부를 만드는 인생투자.jpg',19800,10000,0,9000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(60,0,'아이를 위한 하루 한 줄 인문학','10만 부모가 극찬한 인문 교육의 대가, 김종원 작가의 자녀교육 지혜를 한 권으로 집약한 책. 이제 부모들은 단순히 ‘공부만 잘하는 아이’ ‘시험 1등’이 아니라 ‘자존감이 높고, 마음이 건강한 아이’로 키우는 방법에 대해 고민한다. 부모들의 고민이 예전보다 더 다양해지고 심화되고 있는 것이다. 저자는 이러한 고민들의 해답이 ‘인문학 교육’이 될 수 있다고 강조하며, 인문학을 우리 삶에 적용시킬 수 있는 방법을 수십 년 동안 연구해왔다.

수많은 고전을 분석하고 위인들의 교육법을 연구하며 저자가 얻은 특별한 자녀교육법은 바로 ‘하루 한 줄 인문학’이다. 이 책은 아이의 내면의 힘을 탄탄하게 길러줄 ‘하루 한 줄 인문학’의 의미와 구체적인 방법을 소개하고 있다. 무엇보다도 ‘쉽고 실용적이고 일상생활에서 활용 가능한 인문학 교육’이 이 책의 가장 큰 특장점이다.

하루 한 줄 인문학 수업은 저자가 직접 쓴 ‘인생 문장’을 부모와 아이가 함께 읽고, 쓰고, 느낌을 이야기하는 방식으로 진행된다. 이를 통해 아이는 삶의 지혜를 배울 수 있음은 물론, 발표 수업과 논술 시험에서 자신의 생각을 조리 있게 말하고 쓸 수 있는 표현력 또한 기르게 된다. 아이의 인성과 자존감, 창의력, 사고력, 자기 주도 학습력 등 마음과 두뇌의 잠재력을 골고루 키워주고 싶은 부모들에게 가장 효과적인 교육법이 될 것이다.','김종원','청림Life','인문학','아이를 위한 하루 한 줄 인문학.jpg','/files/아이를 위한 하루 한 줄 인문학.jpg',14500,10000,0,15000,SYSDATE);



------------------------어린이 61~70  ---------------------------------------------------------------------------------------------------------------------------

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(61,0,'어린이를 위한 역사의 쓸모 인생 편 1','어린이들이 역사를 통해 현재의 고민을 해결할 수 있도록 돕는 책, 《어린이를 위한 역사의 쓸모》가 1년 만에 ‘인생 편’으로 다시 돌아왔다. 이번 시리즈는 대한민국 1등 역사 강사인 저자의 생생한 목소리와 함께 역사를 만들어 간 인물들의 인생을 들여다본다. 평강 공주부터 안중근까지, 한 번의 인생을 멋지게 살아간 사람들의 이야기가 담겨 있다.

어린이에게 역사가 필요한 이유는 무엇일까? 그것은 역사야말로 어린이의 인생을 바꿔 주는 가장 강력한 무기이기 때문이다. 역사 속에서 사람들은 선택을 내린다. 이러한 선택들이 수없이 모여 역사가 된다. 따라서 역사를 알고 있으면 보다 지혜로운 선택을 내릴 수 있다. 또 역사 속 사람들의 인생에서 앞으로 살아가는 데 필요한 지혜와 용기를 함께 얻을 수 있다. 그래서 앞으로 살아갈 날이 많은 어린이에게, 역사는 더욱 중요하다고 할 수 있다.

《어린이를 위한 역사의 쓸모 인생 편》 1권은 선택의 순간 앞에서 용기를 냈던 인물들의 삶이 담겨 있다. 재미있고 흥미롭게 인물들의 삶을 다루지만, 책이 담고 있는 메시지는 결코 가볍지 않다. 이 책에 수록된 열두 명의 인물의 삶을 들여다보며, 어린이들은 인생에 필요한 답을 스스로 찾아 나갈 수 있을 것이다.','최태성','다산어린이','어린이','어린이를 위한 역사의 쓸모 인생 편 1.jpg','/files/어린이를 위한 역사의 쓸모 인생 편 1.jpg',13500,10000,0,1000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(62,0,'어린이 마음 약국','14년 차 초등 교사, 좋아서하는그림책연구회 대표 이현아가 어린이의 마음을 치유하기 위해 그림책 처방전을 책으로 냈다. 그림책 처방이란, 어린이의 고민이나 사연을 듣고 문제 해결에 도움을 될 만한 마음 약 편지와 함께 그림책을 처방해 주는 것이다.

저자는 지난 7년 동안 교실 속 ‘마음 약사’로 활동하며, ‘교실 우체통’을 만들어 아이들의 고민과 사연을 들었다. 오후 4시, 수업이 마치면 우체통을 열어 반 아이들의 사연을 읽고, 때로는 상담을 하고 때로는 편지도 쓰며 어린이의 마음을 치유해 주었다. 그에 더해 증상별 고민 해결에 도움이 될 만한 그림책을 추천해 주었는데, 그림책은 부작용이 없고 효과가 오래가는 읽는 약이기 때문이다.

그림책의 효능에 대해 알리고, 마음이 아픈 전국의 어린이 독자를 치유하고자 ‘그림책 처방전’을 모아 책으로 냈다. 독자는 책 속의 문진표, 마음 약 편지, 처방전을 읽다 보면, 어느새 마음이 한결 가벼워질 것이다. 오늘 학교에서 무슨 일이 있었던 거냐고 다그치며 즉각적인 대답을 요구하려 했던 부모라면, 먼저 아이에게 이 책을 건네 보길 바란다.
','이현아','창비교육','어린이','어린이 마음 약국.jpg','/files/어린이 마음 약국.jpg',17000,10000,0,2000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(63,0,'어린이를 위한 데일 카네기의 인간관계론','어린이를 위한 데일 카네기의 인간관계론','김지연','제제의숲','어린이','어린이를 위한 데일 카네기의 인간관계론.jpg','/files/어린이를 위한 데일 카네기의 인간관계론.jpg',13800,10000,0,3000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(64,0,'어린이라는 세계','어린이에 대해 생각할수록 우리의 세계는 넓어진다. 어린이는 잘 보이지 않는다. 몸이 작아서이기도 하고, 목소리가 작아서이기도 하다. 양육이나 교육, 돌봄을 맡고 있는 사람이 아니라면 우리 곁에 어린이가 ‘있다’는 사실을 의식하지 못한 채 살아가기 쉽다. 10년 남짓 어린이책 편집자로 일했고, 지금은 독서교실에서 어린이들과 책을 읽는 김소영은 어린이의 존재를 더 잘 보이게 하기 위해 부지런히 글을 쓰고 목소리를 내 왔다.

이 책에는 김소영이 어린이들과 만나며 발견한, 작고 약한 존재들이 분주하게 배우고 익히며 자라나는 세계가 담겨 있다. 이 세계의 어린이는 우리 곁의 어린이이기도 하고, 우리 모두가 통과해온 어린이이기도 하며, 동료 시민이자 다음 세대를 이루는 어린이이기도 하다.

독서교실 안팎에서 어린이들 특유의 생각과 행동을 유심히 관찰하고 기록하는 김소영의 글은 어린이의 세계에 반응하며 깨닫는 어른의 역할과 모든 구성원에게 합당한 자리를 마련해야 할 사회의 의무에 이르기까지 점차 넓게 확장해 간다.

어린이를 더 잘 이해해 보려는 노력은 나 자신을, 이웃을, 우리 사회를 구석구석까지 살피려는 마음과 다르지 않다. 이 책을 통해 우리는 모두가 경험하지만 누구도 선뜻 중요하다고 말하지 못했던 어린이에 관한 이야기를 비로소 시작해 볼 수 있을 것이다.','김소영','사계절','어린이','어린이라는 세계.jpg','/files/어린이라는 세계.jpg',15000,10000,0,4000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(65,0,'어린이를 위한 주님은 나의 최고봉','어린이 365 묵상집. 오랜 시간 동안 많은 그리스도인의 사랑을 받아온 오스왈드 챔버스의 「주님은 나의 최고봉」을 어린이의 눈높이로 풀어낸 책이다. 어린이가 일상생활에서 경험할 수 있는 이야기로 그날의 주제를 제시한 후, 오스왈드 챔버스의 메시지를 알기 쉽게 설명해 주고 있어 어린이가 재미있게 매일매일 말씀을 가까이할 수 있다.','정지영','토기장이','어린이','어린이를 위한 주님은 나의 최고봉.jpg','/files/어린이를 위한 주님은 나의 최고봉.jpg',18000,10000,0,5000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(66,0,'어린이를 위한 초등 매일 글쓰기의 힘 세줄쓰기','글쓰기의 시작은 한 줄부터다. 한 줄을 채워지면, 두 줄이 가능해지고, 세 줄이 어렵지 않게 된다. 이 책은 글쓰기를 시작하는 아이들이 쉽게 글쓰기에 성취감을 느낄 수 있도록 구성되었다. 총 120가지의 만만하고 쉬운 주제 중에서 아이가 원하는 것을 아무거나 하나 고른 뒤, 주제와 관련한 자신의 생각으로 세 줄을 채우면 된다. 아이가 주제를 읽었는데도 무엇을 써야 할지 모르겠다고 해도 괜찮다. 저자 이은경 선생님이 써 둔 예시글을 한번 읽고, 거기에서 힌트를 얻어 쓰면 된다. 목표는 ‘잘’ 쓰는 게 아니라 ‘쓰는’ 것이다.','이은경','상상아카데미','어린이','어린이를 위한 초등 매일 글쓰기의 힘 세줄쓰기.jpg','/files/어린이를 위한 초등 매일 글쓰기의 힘 세줄쓰기.jpg',10000,10000,0,6000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(67,0,'세밀화로 그린 보리 어린이 동물 도감','아이들이 꼭 알아야 할 동물 160가지를 그린 세밀화 도감. 동물들의 특징이 살아있고, 쉬운 우리말로 되어 있어 아이들도 혼자서 찾아볼 수 있다. 손에 잡힐듯 생생한 세밀화가 압권이다.
','남상호','보리','어린이','세밀화로 그린 보리 어린이 동물 도감.jpg','/files/세밀화로 그린 보리 어린이 동물 도감.jpg',35000,10000,0,7000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(68,0,'긴긴밤','제21회 문학동네어린이문학상 대상 수상작. 세상에 마지막 하나 남은 코뿔소가 된다면, 소중한 이를 다 잃고도 ‘마지막 하나 남은 존재’의 무게를 온 영혼으로 감당해야 한다면 어떠할까? 친구의 마지막 부탁을 들어주기 위해, 어린 생명이 마땅히 있어야 할 안전한 곳을 찾아 주기 위해 본 적도 없는 바다를 향해 가는 마음은 어떤 것일까?

이 책은 지구상의 마지막 하나가 된 흰바위코뿔소 노든과 버려진 알에서 태어난 어린 펭귄이 수없는 긴긴밤을 함께하며, 바다를 찾아가는 이야기이다. 울퉁불퉁한 길 위에서 엉망인 발로도 다시 우뚝 일어설 수 있게 한 것은, 잠이 오지 않는 길고 컴컴한 밤을 기어이 밝힌 것은, “더러운 웅덩이에도 뜨는 별” 같은 의지이고, 사랑이고, 연대이다.

수단에게서 시작된 이야기 <긴긴밤>은 “압도적인 감동의 힘” “인생의 의미에 대한 깊이 있는 질문과 그것을 찾아가는 과정의 엄숙함” “멸종되어 가는 코뿔소와 극한의 상황에서도 포기하지 않는 펭귄의 모습을 아름답게 그려 낸 작품”이라는 평을 받으며 <5번 레인>과 함께 제21회 문학동네어린이문학상 대상을 받았다.
','루리','문학동네','어린이','긴긴밤.jpg','/files/긴긴밤.jpg',11500,10000,0,8000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(69,0,'어린이를 위한 시크릿','세상을 바꾼 위대한 사람들은 모두 자신이 가진 삶의 장애와 한계를 극복한 사람들이다. 쉽게 포기하고, 쉽게 지치는 우리 아이들에게 끊임없는 노력과 끝까지 할 수 있다는 의지가 어떻게 삶을 바꾸는지 감동적으로 전해 준다. <시크릿>의 어린이 판.
','윤태익','살림어린이','어린이','어린이를 위한 시크릿.jpg','/files/어린이를 위한 시크릿.jpg',14000,10000,0,9000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(70,0,'나쁜 어린이 표','황선미 작가의 학창 시절 스승에 대한 추억과 이제는 다 자라 엄마 품을 떠난 큰 아들의 경험을 모티브로 써낸 <나쁜 어린이 표>. 아이의 내면과 정서를 따뜻하게 감싸 안는 작가 의식 위에 사실적인 캐릭터와 흥미로운 사건, 감동적인 결말로 마무리되는 이 책은 오랜 세월 수많은 어린이, 부모, 선생님들의 가슴을 적시며 우리 창작 동화의 고전으로 자리 잡았다. 국내 창작 동화 최초로 100쇄를 출간하고, 100만 부 돌파 기록을 세웠던 그 <나쁜 어린이 표>가 출간 18년 만에 새 옷으로 갈아입고 독자 여러분을 만나게 되었다.','황선미','서울초등국어교과교육연구회','어린이','나쁜 어린이 표.jpg','/files/나쁜 어린이 표.jpg',12000,10000,0,16000,SYSDATE);


------------------------자서전 71~80 ---------------------------------------------------------------------------------------------------------------------------
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(71,0,'벤저민 프랭클린 자서전','문학동네 세계문학전집 231권. 한미한 집안 출신인 프랭클린은 독학으로 이어간 공부와 매사에 근면성실하고 정직한 태도만으로 문학 · 과학 · 정치 등 다양한 분야에서 놀라운 성공을 거둔 입지전적인 인물이다. 후손들에게 자신의 인생역정과 성공 비결을 허심탄회하게 털어놓는 형식의 『벤저민 프랭클린 자서전』은 미국 산문문학의 전범으로 자리잡아 현재까지도 두루 읽히고 있다.','벤저민 프랭클린 자서전','문학동네','자서전','벤저민 프랭클린 자서전.jpg','/files/벤저민 프랭클린 자서전.jpg',15000,10000,1,1000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(72,0,'슈독 나이키 창업자 필 나이트 자서전','슈독 나이키 창업자 필 나이트 자서전','필 나이트','사회평론','자서전','슈독 나이키 창업자 필 나이트 자서전.jpg','/files/슈독 나이키 창업자 필 나이트 자서전.jpg',22000,10000,0,2000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(73,0,'요가난다, 영혼의 자서전','스티브 잡스의 아이패드에 저장된 단 한 권의 책이 바로 <요가난다, 영혼의 자서전>이었다. 파라마한사 요가난는 평생 동안 진리의 길을 걸어간 인도의 영적 스승이다. 그의 전 생애가 담긴 <요가난다, 영혼의 자서전>은 한 진실한 구도자의 깨달음의 기록이자 인도의 요가 과학과 유구한 명상 전통에 대한 깊이 있는 안내서이다.

여기에는 삶과 죽음의 근본 문제, 편협한 에고의 허물을 벗고 진정한 자아를 찾는 법, 신과의 합일을 통해 궁극의 자유에 이르는 길 등 우리의 정신을 충만하게 채워주는 지혜들이 가득하다. 요가난다는 우리를 진리에 근거한 삶으로 이끈다. 그것은 인간 존재의 근원적인 불행이 제거되고 사랑, 행복, 기쁨, 환희, 평온으로 빛나는 삶이다.

감각적 욕망에 대한 집착을 끊고 영적으로 진일보하는 삶이다. 이런 삶을 살 때 비로소 우리 안의 신성을 경험할 수 있으며, 인간의 본질이 곧 신이고 우주 그 자체라는 진리를 깨닫게 된다고 요가난다는 말한다. 그리고 이 모든 것은 정신을 통제하는 인도의 요가와 명상 수행을 통해 얻을 수 있다고 가르친다. 20세기 최고의 영적도서로 선정된 책이다.
','파라마한사 요가난다','뜨란','자서전','요가난다, 영혼의 자서전.jpg','/files/요가난다, 영혼의 자서전.jpg',32000,10000,0,3000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(74,0,'최승희, 나의 자서전','한국의 아름다운 문장 3권. 1936년에 『나의 자서전』(니혼쇼소(日本書?), 도쿄) 초판이 출간된 이후 80여 년 만에 처음 번역 출간한 것이다. 그이가 직접 쓴 자서전이다. 이상하게도 이 책은 출간된 후 한 번도 제대로 번역되지 않았다.

최승희는 오랫동안 한국에서 금기였다. 월북 예술가였기 때문이다. 이들이 남긴 작품은 1988년 해금 조치가 이루어지기 전까지 대중에 공개할 수 없었다. 학술적 목적이라 하더라도 월북 예술가의 이름 한 글자를 가리고 써야 할 정도로 그 이름조차 제대로 표기할 수 없었다. 그사이에 많은 자료는 반공 이데올로기가 지배하는 사회 분위기 속에서 망실되거나 고의로 버려지고 불태워지기도 했다. 종이쪼가리 하나조차도 불온한 것이라면 어떤 갖은 수모를 당할지 모르는 어두운 시대였기 때문이다.
','최승희','청색종이','자서전','최승희, 나의 자서전.jpg','/files/최승희, 나의 자서전.jpg',17000,10000,0,4000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(75,0,'간디 자서전','간디 자서전','마하트마 간디','한길사','자서전','간디 자서전.jpg','/files/간디 자서전.jpg',20000,10000,0,5000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(76,0,'헬렌 켈러 자서전','보지 못하고 듣지 못하였으나 비장애인도 하기 어려운 과업을 수없이 이루어내며 인생을 즐긴 헬렌 켈러의 자서전. 내가 살아온 이야기와 나의 낙관주의, 2편의 에세이를 수록하였다. 특히 나의 낙관주의는 여태껏 국내에 소개된 적이 없었던 헬렌 켈러의 주옥같은 수필 중 하나로서 국내에 처음으로 완역·소개된다.
내가 살아온 이야기는 헬렌 켈러가 대학 2학년 때 영문학 교수의 권유로 쓰기 시작한 자서전으로 암흑 속에 갇혔으나 자연을 벗삼아 뛰어놀던 천진난만한 어린 시절, 설리번 선생님을 처음 만나 세상과 연결되는 한줄기 끈을 붙잡게 되었을 때의 감격과 환희, 설리번 선생님의 헌신적인 노력으로 점자책을 읽고 독서에 빠지게 되는 과정, 말하기를 배워 자신의 목소리로 말하게 되었을 때의 기쁨 등을 자세하게 기록했다.','헬렌 켈러','문예출판사','자서전','헬렌 켈러 자서전.jpg','/files/헬렌 켈러 자서전.jpg',9000,10000,0,6000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(77,0,'아르센 벵거 자서전','축구계의 아이콘이자 전설적인 감독, 아르센 벵거의 첫 자서전이 출간되었다. 그간 몇 권의 책들이 아르센 벵거의 성공과 그의 업적을 책으로 정리해 내놓았지만, 아르센 벵거 자신이 직접 본인의 삶과 커리어를 반추하여 기록한 책은 현재로선 이 책이 유일하다. 그만큼 그를 사랑했던, 그리고 축구를 사랑했던 팬들에겐 크나큰 선물이 아닐 수가 없다.
프리미어리그 최초의 49경기 무패 기록과 115년 만의 무패 우승을 달성한 감독, 비영국인으로서 프리미어 리그에 당당히 입성해 축구의 판도를 완전히 바꾼 감독, 감독은 항상 혁신가여야 한다.고 말한 아르센 벵거 감독의 진짜 이야기를 이 책에서 만나보자. 나는 잘 모른다. 축구를 그리고 아르센 벵거를. 그런데 알고 싶어졌다. 그의 인생과 가치관에 대해. 그의 어록으로 축구 문외한인 나의 프리뷰를 마무리하고자 한다. 어떤 팀도 경기마다 매력적이고 환상적일 수 없다. 하지만 팬들에게 보내는 내 메시지는 다음과 같다. 행복해지자','아르센 벵거','한즈미디어','자서전','아르센 벵거 자서전.jpg','/files/아르센 벵거 자서전.jpg',22000,10000,0,7000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(78,0,'밥 딜런 자서전','뮤지션 밥 딜런의 삶의 여정과 내면 고백을 담은 책이다. 가수 겸 작곡가의 꿈을 안고 뉴욕에 진출, 맨해튼에서 무명가수로 고생하던 시절의 일화, 창작과 영감에 관한 이야기를 들려주면서 자신과 예술을 지금의 자리에까지 이끌어 준 사람들과 장소들에 대해 회고한다.

아내와 아이들을 사랑하는 평범한 가장으로서의 밥 딜런의 모습을 만나볼 수 있으며, 가수 해리 벨라폰테와 첫 녹음을 가졌던 추억도 소개된다. 미국의 고등학교와 대학교 교과서에 노랫말이 실리고, 몇 차례 노벨문학상 후보에 오르는 등 그간 보여준 밥 딜런의 문학적 재능이 이번 자서전에도 고스란히 드러난다. 2004년 뉴욕타임스가 뽑은 올해 최고의 책에 선정되었고, 내셔널 북 어워드(National Book Critics Circle Award)를 수상했다. 밥 딜런은 2016년 노벨문학상을 수상했다.','밥 딜런','문학세계사','자서전','밥 딜런 자서전.jpg','/files/밥 딜런 자서전.jpg',13000,10000,0,8000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(79,0,'안중근 의사 자서전','안중근 의사 자서전. 1909년 10월 26일 오전 안중근 의사는 만주 하얼빈 역에서 아시아 침략의 원흉이자 조선통감부 총독인 이토 히로부미를 저격하였다. 이 자서전은 안의사가 뤼쑨감옥에 5개월 동안 투옥되어 있을 당시, 200여 개가 넘는 유묵과 함께 쓰여진 책이다.
우리의 근대사에 큰 인물로 자리잡고 있는 안의사는 순국 90년이 넘는 오늘에도 겨레와 나라를 사랑하는 만인에게 숭모의 대상이 되고 있다. 이 책은 자서전 외에 동양평화론과 인심결합론, 유묵과 당시 대한매일신보 게재 기사, 그리고 최후 공판 기록 등을 실었다.','안중근','종합출판범우','자서전','안중근 의사 자서전.jpg','/files/안중근 의사 자서전.jpg',13000,10000,0,9000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(80,0,'김수영, 시로 쓴 자서전','오랫동안 김수영의 시편을 분석의 대상으로 삼아온 시인 겸 문학평론가 김응교 교수(숙명여대)가 정교한 기획과 구성 하에 수년에 걸쳐 퇴고를 거듭해 완성한 ‘김수영론’이다. 저자 김응교는 김수영이 남긴 시편이 그의 생애를 설명하는 가장 결정적인 단초라는 전제 하에 김수영이 초기부터 세상을 떠날 때까지 치열하게 써온 전체 작품 120편 중 72편을 선별한 후 김수영의 연대기에 그대로 대응시켜 총체로서의 문학적 삶을 설명하는 방법을 택했다.
','김응교','삼인','자서전','김수영, 시로 쓴 자서전.jpg','/files/김수영, 시로 쓴 자서전.jpg',29800,10000,0,17000,SYSDATE);


------------------------잡지 81~90  ---------------------------------------------------------------------------------------------------------------------------

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(81,0,'에스콰이어 Esquire A형','에스콰이어 Esquire A형','에스콰이어 편집부','허스트중앙','잡지','에스콰이어 Esquire A형.jpg','/files/에스콰이어 Esquire A형.jpg',12900,10000,0,1000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(82,0,'마리끌레르 Marie Claire A형 2023.9 (표지  지수)','마리끌레르 Marie Claire A형 2023.9 (표지  지수)','마리끌레르','마리끌레르','잡지','마리끌레르 Marie Claire A형 2023.9 (표지  지수).jpg','/files/마리끌레르 Marie Claire A형 2023.9 (표지  지수).jpg',10000,10000,0,2000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(83,0,'데이즈드 앤 컨퓨즈드 Dazed & Confused Korea B형 2023.9','데이즈드 앤 컨퓨즈드 Dazed & Confused Korea B형 2023.9 (표지 제로베이스원 성한빈)','렉스트림 편집부','렉스트림','잡지','데이즈드 앤 컨퓨즈드 Dazed & Confused Korea B형 2023.9 (표지 제로베이스원 성한빈).jpg','/files/데이즈드 앤 컨퓨즈드 Dazed & Confused Korea B형 2023.9 (표지 제로베이스원 성한빈).jpg',12000,10000,0,3000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(84,0,'생명의 삶 2023.9','생명의 삶 2023.9','생명의삶 편집부','두란노','잡지','생명의 삶 2023.9.jpg','/files/생명의 삶 2023.9.jpg',5000,10000,0,4000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(85,0,'한경비즈니스 1450호','한경비즈니스 1450호','한경비즈니스 편집부','한국경제신문','잡지','한경비즈니스 1450호.jpg','/files/한경비즈니스 1450호.jpg',4500,10000,0,5000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(86,0,'게이머즈 Gamer 2023.8','게이머즈 Gamer 2023.8','게이머즈','게임문화','잡지','게이머즈 Gamer 2023.8.jpg','/files/게이머즈 Gamer 2023.8.jpg',15900,10000,0,6000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(87,0,'우먼센스 2023.9','우먼센스 2023.9','우먼센스','서울문화사','잡지','우먼센스 2023.9.jpg','/files/우먼센스 2023.9.jpg',10800,10000,0,7000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(88,0,'인공지능과 소설가의 일','인공지능과 소설가의 일','김연수','이음','잡지','인공지능과 소설가의 일.jpg','/files/인공지능과 소설가의 일.jpg',15000,10000,0,8000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(89,0,'럭셔리 Luxury 2023.9','럭셔리 Luxury 2023.9','력셔리','디자인하우스','잡지','럭셔리 Luxury 2023.9.jpg','/files/럭셔리 Luxury 2023.9.jpg',15000,10000,0,9000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(90,0,'PC사랑 2023.9','PC사랑 2023.9','PC사랑','컴퓨터생활','잡지','PC사랑 2023.9.jpg','/files/PC사랑 2023.9.jpg',9500,10000,0,18000,SYSDATE);


------------------------과학 91~100  ---------------------------------------------------------------------------------------------------------------------------
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(91,0,'기후변화','기후변화','마크 매슬린','교유서가','과학','기후변화.jpg','/files/기후변화.jpg',22500,10000,0,1000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(92,0,'사회과학 하기','사회과학 하기','장-피에르 카바이예','후마니타스','과학','사회과학 하기.jpg','/files/사회과학 하기.jpg',18900,10000,0,2000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(93,0,'처음 떠나는 시공간 여행','처음 떠나는 시공간 여행','스테판 다스콜리,','북스힐','과학','처음 떠나는 시공간 여행.jpg','/files/처음 떠나는 시공간 여행.jpg',18000,10000,0,3000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(94,0,'해파리책','해파리책','파올라 비탈레','원더박스','과학','해파리책.jpg','/files/해파리책.jpg',8900,10000,0,4000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(95,0,'운동의 뇌과학','몸을 움직일 때 우리 뇌에 생기는 놀라운 변화가 어떻게 우울증, 불안장애, 수면장애 극복에 도움을 주고, 집중력·창의력 향상, 노화 지연에 영향을 미치는지 삶의 다양한 각도에서 탐험한 “뇌과학 기반 운동 실천서”다. 저자는 이 책에서 불안장애로 인해 힘겨웠던 육아와 자신의 결혼생활을 진솔하게 털어놓으며, 사방이 막힌 듯 인생이 막막했을 때 운동이 자신을 구출했던 과정을 드라마틱하게 서술한다. 저자의 뉴로핏 연구소(NeuroFit Lab)에서 진행한 다양한 뇌과학 실험 결과와 흥미진진한 최신 뇌과학 정보를 바탕으로 하여 운동의 힘을 역설하며, 직접 실천해볼 수 있는 뇌과학 기반 운동 프로그램까지 소개함으로써 독자들을 운동의 세계로 인도한다.
','제니퍼 헤이스','현대지성','과학','운동의 뇌과학.jpg','/files/운동의 뇌과학.jpg',18000,10000,0,5000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(96,0,'EBS 수능완성 과학탐구영역 지구과학 1 (2023년)','EBS 수능완성 과학탐구영역 지구과학 1 (2023년)','EBS','한국교육방송공사','과학','EBS 수능완성 과학탐구영역 지구과학 1 (2023년).jpg','/files/EBS 수능완성 과학탐구영역 지구과학 1 (2023년).jpg',7700,10000,0,6000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(97,0,'과학 교양서의 문제적 질문들','과학 교양서 전성시대. 왜 우리는 과학 교양서를 읽는가? 물고기는 정말 존재하지 않는가? 다정한 것이 살아남는가? 인간은 이기적 유전자를 넘어설 수 있을까? 인간을 인간으로 만든 것은 무엇인가? 교양 과학서의 문제적 질문을 통해 보는 과학의 의미. 상온 초전도체 논쟁과 과학적 태도에 대하여. 메타인지 전문가 손리사 교수가 말하는 메타인지에 대한 몇 가지 오해들. 도요새의 위대한 비상. 유전자 교정으로 슈퍼맨을 만들 수 있을까. 정치적 올바름과 21세기 종교 전쟁 등 흥미로운 기사로 가득한 스켑틱 35호.','스켑틱 협회','바다출판사','과학','과학 교양서의 문제적 질문들.jpg','/files/과학 교양서의 문제적 질문들.jpg',17500,10000,0,7000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(98,0,'누구나 알지만 아무도 모르는 소식의 과학','『정재훈의 생각하는 식탁』을 통해 식탁 위의 담론을 과학의 장으로 끌어들인 저자 정재훈 약사가 이번에는 ‘소식’의 이모저모를 완전히 파헤친다. 저자가 이야기하는 소식은 단순한 미용 목적의 다이어트 방법이 아니다. 무작정 ‘굶는’ 것 또한 아니다. 소식은 우리 몸을 근본적으로 개선하고 건강하게, 그리고 오래 살기 위한 총체적인 비결이다. 그리고 여기에는 물론 과학적인 근거가 있다. 저자는 막연히 ‘좋다’는 이야기를 넘어서, 소식의 기전과 효능을 과학적으로 분석한다.','정재훈','동아시아','과학','누구나 알지만 아무도 모르는 소식의 과학.jpg','/files/누구나 알지만 아무도 모르는 소식의 과학.jpg',16000,10000,0,8000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(99,0,'역사가 묻고 생명과학이 답하다','갈수록 치열해지는 질문, ‘인간이란, 나아가 생명이란 무엇인가?’를 생각해볼 수 있는 역사 속 격변의 순간들을 되짚는다. ‘출산, 유전, 질병, 장기, 감염, 통증, 소화, 노화, 실험’ 등 열 가지 키워드를 통해 인류의 ‘생로병사’가 단지 과학적 현상을 넘어 사회문화적 환경과 영향을 주고받으며 어떻게 천변만화해왔는지 살펴본다.
고대 그리스의 철학 전통부터 현대 분자생물학의 정밀의학까지 다양한 발견과 실험과 이야기가 펼쳐진다. 저자는 과학에 관심 많은 일반 독자뿐 아니라, 의생명과학 분야 지망생이나 종사자가 많이 읽어주길 바라며 썼다. 이질적 아이디어를 색다르게 결합하는 창의력이 절실한 시대, 과학적 소양과 인문적 소양을 균형 있게 쌓아 ‘생각하는 훈련’을 하는 데 보탬이 되고픈 마음에서다.','전주홍','지상의책','과학','역사가 묻고 생명과학이 답하다.jpg','/files/역사가 묻고 생명과학이 답하다.jpg',18500,10000,0,9000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(100,0,'아파트 속 과학','우리나라 사람 절반 이상이 아파트에 산다. 또 전체 주택의 3분의 2가 아파트다. 아파트는 명실상부 한국을 대표하는 주거공간이다. 국민 절반 이상이 거주하며 영혼을 끌어모아서라도 소유하고 싶은 아파트. 그런 아파트에 관해 우리는 무엇을 얼마나 알고 있을까?

집값에 관해서라면 몇 시간이고 이야기할 수 있는 사람도 아파트가 딛고 선 과학적 토대에 관해 질문하면 제대로 된 답을 내놓지 못한다. 우리나라 아파트 수명이 왜 다른 나라보다 현저히 짧은지, 60억 원 넘는 초고가 아파트마저 왜 층간소음에서 벗어날 수 없는지, 2000년대 초반 갑자기 우리나라에서 새집증후군이 대두한 이유가 무엇인지 등 수백, 수천 세대의 삶을 떠받치는 핵심 기둥은 ‘과학’이다.

아파트의 뼈와 살을 이루는 콘크리트에는 나노과학이, 건물 사이를 흐르는 바람에는 전산유체역학이, 열효율을 높이고 층간소음을 줄이는 벽과 바닥에는 재료공학이 숨어 있다. 오늘날 수많은 학문의 성취가 아파트에 담겨 있다. 과학의 시선으로 아파트를 구석구석 탐사하는 색다른 집들이에 여러분을 초대한다.
','유병재','비채','과학','아파트 속 과학.jpg','/files/아파트 속 과학.jpg',20000,10000,0,19000,SYSDATE);


------------------------수학 101~110 ---------------------------------------------------------------------------------------------------------------------------

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(101,0,'수학의 정석','수학의 정석','홍성대','성지출판','수학','수학의 정석.jpg','/files/수학의 정석.jpg',15300,10000,0,1000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(102,0,'EBS 50일 수학 (상) (2023년용)','EBS 50일 수학 (상) (2023년용)','EBS','한국교육방송공사','수학','EBS 50일 수학 (상) (2023년용).jpg','/files/EBS 50일 수학 (상) (2023년용).jpg',7000,10000,0,2000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(103,0,'경제적 자유를 위한 최소한의 수학','수학을 실타래 삼아 경제적 자유의 가능성을 짜나간다. 현대 사회에서 수학이 돈이 되는 구체적인 장면과 그 원리들을 알기 쉽게 설명한다. 주식이나 복권 등에 적용할 수 있는 수학적 전략은 물론, 그 기본이 되는 베팅의 수학을 차근차근 풀어낸다.

아울러 비트코인과 인터넷뱅킹, 그리고 구글과 페이스북의 저변에 어떤 수학적인 원리가 깔려 있는지 다룬다. 실무에서 수학을 활용하는 방법 같은 쏠쏠한 지식도 담겨 있다. 저자는 수학을 통해 현대 사회에 대한 이해도를 높이고, 이를 영리하게 파고들어 경제적 자유에 이르도록 안내해준다.
','휴 바커','김일선','수학','경제적 자유를 위한 최소한의 수학.jpg','/files/경제적 자유를 위한 최소한의 수학.jpg',18800,10000,0,3000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(104,0,'개념원리 중학 수학 2-2 (2023년용)','개념원리 중학 수학 2-2 (2023년용)','이홍섭','개념원리수학연구소','수학','개념원리 중학 수학 2-2 (2023년용).jpg','/files/개념원리 중학 수학 2-2 (2023년용).jpg',17000,10000,0,4000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(105,0,'개념원리 RPM 알피엠 고등 수학 (상) (2023년용)','개념원리 RPM 알피엠 고등 수학 (상) (2023년용)','이홍섭','개념원리수학연구소','수학','개념원리 RPM 알피엠 고등 수학 (상) (2023년용).jpg','/files/개념원리 RPM 알피엠 고등 수학 (상) (2023년용).jpg',16000,10000,0,5000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(106,0,'개념원리 중학 수학 1-2 (2023년용)','개념원리 중학 수학 1-2 (2023년용)','이홍섭','개념원리수학연구소','수학','개념원리 중학 수학 1-2 (2023년용).jpg','/files/개념원리 중학 수학 1-2 (2023년용).jpg',17000,10000,0,6000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(107,0,'개념원리 고등 수학 1 (2023년용)','개념원리 고등 수학 1 (2023년용)','이홍섭','개념원리수학연구소','수학','개념원리 고등 수학 1 (2023년용).jpg','/files/개념원리 고등 수학 1 (2023년용).jpg',19000,10000,0,7000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(108,0,'라이트쎈 고등 수학 (하) (2023년용)','라이트쎈 고등 수학 (하) (2023년용)','홍범준','신사고수학콘텐츠연구회','수학','라이트쎈 고등 수학 (하) (2023년용).jpg','/files/라이트쎈 고등 수학 (하) (2023년용).jpg',14500,10000,0,8000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(109,0,'EBS 올림포스 수학 (하) (2023년용)','EBS 올림포스 수학 (하) (2023년용)','EBS','한국교육방송공사','수학','EBS 올림포스 수학 (하) (2023년용).jpg','/files/EBS 올림포스 수학 (하) (2023년용).jpg',5000,10000,0,9000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(110,0,'EBS 중학 뉴런 수학 1 (상) (2023년용)','EBS 중학 뉴런 수학 1 (상) (2023년용)','EBS','한국교육방송공사','수학','EBS 중학 뉴런 수학 1 (상) (2023년용).jpg','/files/EBS 중학 뉴런 수학 1 (상) (2023년용).jpg',14000,10000,0,20000,SYSDATE);


---------------------------------------------------------------------------------------------------------------------------------------------------

------------------------역사 111~120  ---------------------------------------------------------------------------------------------------------------------------

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(111,0,'위기의 역사','1990년대 ‘아시아의 네 마리 용’ 중 하나로 불릴 정도로 고도성장을 구가하던 한국은 전 세계적인 PC 붐에 힘입은 반도체 시장의 강한 성장과 엔화 초강세를 통해 얻어낸 상대적인 수출 가격 경쟁력 덕분에 호경기를 이어갔다. 언제까지나 계속될 것만 같은 호경기 속에 금융기관들은 단기 외채를 크게 늘렸고, 기업들은 그런 금융기관들에서 돈을 빌려 투자를 확대했다. 하지만 어느 순간 PC 시장이 흔들렸고, 10년간의 강세를 끝으로 엔화는 빠른 약세로 전환했다. 부채가 늘어난 상황에서 맞이한 급격한 환경의 변화를 견디지 못한 한국은 1997년 외환위기의 파고에 휩쓸렸다.

호경기에 계속될 것이라는 ‘낙관론’과 예상치 못한 ‘환경의 급격한 변화’는 1997년 외환위기만의 이야기가 아니다. 저자 오건영은 1997년 한국의 외환위기, 닷컴 버블의 형성과 붕괴, 2008년 글로벌 금융위기, 그리고 코로나19 이후 인플레이션 불안 등 20세기 말부터 현재까지 한국 사회를, 더 나아가 전 세계를 강타했던 경제 위기의 기저에는 ‘장기간의 안정적인 경제 환경 속에서 싹튼 안이함’과 ‘급격한 금융 환경의 변화’라는 공통점이 있다고 말한다. 또한, 비슷한 이유와 비슷한 착각으로 똑같은 일이 계속 반복되는 이유는 단순히 위기를 걸어 지나왔을 뿐, 제대로 알지 못하기 때문이라고도 말한다. 200건의 언론 기사를 적극 인용하여 경제위기라는 거대한 역사의 맥락 속에 위기의 실체를 생생하게 전달하고, 막연한 공포나 극단적 낙관에서 벗어나 조금 더 객관적인 시선으로 지금의 경제 상황을 판단하는 데 도움을 줄 수 있는 책이다.','오건영','페이지2','역사','위기의 역사.jpg','/files/위기의 역사.jpg',28000,10000,0,1000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(112,0,'대한민국 돈의 역사','
한국 경제와 주식, 부동산의 모든 역사
전근대 동아시아 사회에 ‘거울 감(鑑)’자는 역사를 뜻하는 글자로 사용되기도 하였다. 물그릇(皿)에 비친 자신을 바라보는 모습을 뜻하는 볼 감(監)자에 쇠 금(金)자를 합하여 청동 거울의 모습과 용도를 설명한 글자인데, 거울에 자신의 모습을 비추어 보듯 역사에 현재를 비추어 교훈을 얻기를 바라는 의도가 담겨있다. 이처럼 역사를 바라보는 인간은 그 안에서 현재의 문제를 해결할 지혜를 얻고, 미지의 내일을 대비하기 위한 통찰을 얻기를 기대한다. 역사를 공부하는 데에 저마다 수많은 이유가 있을 수 있으나, 그 가운데 포폄과 감계는 동서고금을 막론하여 늘 보편적으로 기대되는 역사의 쓰임이다.

이코노미스트 홍춘욱은 투자를 잘하려면 어떻게 공부해야 하나요? 라는 질문에 첫 번째는 기초적인 거시 경제 이론이며, 두 번째는 투자의 역사를 이해하는 것이라고 답한다. 지난 세월 한국은 굵직굵직한 경제 위기를 빈번하게 겪어왔는데, 주식이나 부동산 같은 한국의 주요 자산은 경제 위기가 발생할 때마다 무너졌고, 또 어떨 때는 영영 회복되지 못할 것 같은 충격을 경험하기도 했다. 따라서 경제가 어떤 식으로 작동하며, 우리 경제가 어떤 요인에 큰 영향을 받는지 이해하는 것이 위험관리의 첫걸음이다. 역사는 반복된다고 주장하는 저자는, 반세기 넘게 이어진 버블의 형성과 붕괴의 반복 속에서 역사의 사이클을 읽어낼 수 있는 통찰을 얻을 수 있다고 말한다. 남북 분단과 농지개혁에서부터 2020년 코로나 팬데믹까지, 한국 경제와 주식, 부동산의 흐름을 바꾼 주요 사건들을 중심으로 대한민국 돈의 역사를 모두 담았다.','홍춘옥','상상스퀘어','역사','대한민국 돈의 역사.jpg','/files/대한민국 돈의 역사.jpg',33000,10000,0,2000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(113,0,'신의 역사','카렌 암스트롱을 세계적인 종교학자의 자리에 올려놓은 책, <신의 역사>가 25년 만에 전면개역판으로 출간됐다. 30여 년간 아마존 종교 분야의 베스트셀러에서 빠지지 않은 이 시대의 고전으로, 한국어판 절판 이후 복간만을 기다려온 독자들에겐 여름날의 선물 같은 소식이다. 이번 개역판에선 놓쳤던 오역과 유려한 글맛을 모두 잡아 기존의 번역본에서 확연한 탈바꿈을 했다.

인간 역사는 곧 신의 역사다. "인간은 언제나 자기 시대에 유용한 신을 창조해 왔다." 인간의 정신은 왜 신을 갈구하는가? 책은 고대 바빌로니아의 창조 신화에서부터 19세기 포이어바흐, 니체, 프로이트의 무신론에 이르기까지 인류사의 굵직한 신에 관한 사유들을 살핀다. 삶의 고통, 불행, 불안, 세상의 악과 종교의 관계는 어떻게 해석해야 하는지, 지금의 시대에 걸맞은 신은 어떤 모습인지, 카렌 암스트롱이 통찰 있는 탐구를 통해 강렬한 대답을 내어 놓는다.','카렌 암스트롱','교양인','역사','신의 역사.jpg','/files/신의 역사.jpg',36000,10000,0,3000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(114,0,'인생의 역사','신형철 평론가의 시화(詩話) 『인생의 역사』를 2023 서울국제도서전 리커버 에디션으로 선보인다. 도서전 프로그램 <다시, 이 책>의 일환으로, 책이 가진 물성, 북디자이너의 감상 팁을 천천히 살펴보면서 책을 마주할 때의 첫 느낌, 첫 기억을 새로이 새겨보자는 취지에서다.

서울국제도서전을 통해 최초 공개되는 이번 에디션은 박서보 화백의 또다른 작품 <묘법 No.130119>을 실었다. 일반판과 동네서점 에디션에 이어 세번째 ‘묘법(描法, ecriture)’이니, 인생이라는 무한한 스펙트럼 가운데 다채의 또 한 면을 담아냈다.

『인생의 역사』는 그 제목이 저자의 입에서 처음 흘러나온 그 순간부터 마지막 만듦새가 완성될 때까지 박서보 화백의 화집에서 손을 못 놓게, 참으로 손을 모자라게 만든 책이었다. 수많은 작품 앞에서 오래 입술을 뜯은 건 이 그림을 ‘얼굴’로 저 그림을 ‘몸’으로 우리 책의 ‘정신’을 보임에 어떤 부연이라는 게 일절 필요하지 않은 까닭이었다.

작위를 모르고 자연을 따르는 책의 주제라 할 ‘시’가 큰 역할을 한다면, 평생 붓을 등뼈로 인생을 곧추세워온 박서보 화백의 ‘삶’을 시에 비유하는 데도 큰 무리가 없어서였을 것이다. 그리하여 이번 여름 서울국제도서전을 맞아, 작년 가을 신형철 평론가가 표지로 삼고 싶다 간절히 바랐던 작품을 심는다. 묵음은 깊음이라는 믿음으로.','신형철','난다','역사','인생의 역사.jpg','/files/인생의 역사.jpg',18000,10000,0,4000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(115,0,'역사논문 작성법','역사학 논문을 처음 작성하는 사람들을 위한 안내서. 매년 졸업 시즌이 되면 졸업을 앞둔 대학생과 대학원생들은 거의 대부분 극도의 스트레스 상태에 접어들곤 한다. 생애 처음으로 본인의 학술적인 연구 결과를 체계적으로 집필하여 심사를 받아야 하기 때문이다. 바로 ‘논문’이다.

논문 작성은 많은 공력과 노력을 요하는 고난도의 과제이다. 게다가 익숙한 일도 아니다. 리포트나 쪽글 등으로 예행연습을 진행했다고 하지만 논문은 양적·질적으로 다르다. 논문을 어떻게 작성해야 하는지에 대한 공부가 따로 필요하다. 그러나 논문 작성을 배울 수 있는 공간은 많지 않다. 개설된 강의도 거의 없을뿐더러 관련 도서도 여러 분야를 망라하는 포괄적인 학술논문 안내서가 대부분이다. 분과학문용 안내서는 자연과학, 공학, 의학, 사회과학 분야뿐이다. 인문학 논문 작성법 안내서는 찾기 힘들다.

《역사논문 작성법》은 석사학위 논문 집필을 앞둔 사학과 대학원생과 대학 졸업논문을 제출해야 하는 사학과 졸업반 학생들의 논문 작성을 돕기 위해 집필된 안내서이다. 역사학 논문을 처음 작성하는 사람들에게 도움을 줄 수 있는 지침서가 되는 게 이 책의 목적이다. 역사논문은 “취업이나 프로젝트 등과 같은 안정된 연구 여건을 갖추는 데 결정적인 역할”을 한다. 이에 저자는 주제 선정부터 문장·문체 만들기까지 모든 것을 아우르면서 사학도들의 역사논문 작성에 도움을 주고자 한다.','임경석','푸른역사','역사','역사논문 작성법.jpg','/files/역사논문 작성법.jpg',15900,10000,0,5000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(116,0,'역사의 쓸모','최태성은 누적 수강생이 500만 명에 달하는 손꼽히는 역사 강사다. 그의 역사 강의를 듣는 많은 학생들은 역사 교과의 이해와 역사 시험의 성적을 목표로 하니, 그만큼 ‘역사의 쓸모’를 강조하며 설파해온 이도 드물겠다. 그런데 그가 전하는 역사의 쓸모는 “선생님 강의 듣고 시험 합격했습니다”에도 있겠으나, “선생님 강의를 듣기 전과 후의 삶의 모습이 달라졌어요.”라는 반응이 훨씬 반갑다고 하니, 그가 역사를 공부하고 강의하는 방향은 사실과 실체보다는 감정과 삶에 가깝다 하겠다.

살다보면 누구나 문제를 만나고 이를 해결할 방법을 찾아야만 하는데, 이때 앞서 살아간 그리고 동시대를 살아가는 이들의 고민과 삶을 참조하기 마련이다. 문제는 숱한 사례와 이야기 가운데 어느 것이 나의 상황에 적절한 도움을 전할지 고르기가 쉽지 않다는 데 있다. 이 책은 혁신, 성찰, 공감, 소통 등 오늘날 시대의 과제에서 시작해 다른 이의 삶을 이해하는 방법과 인생의 답을 찾아가는 과정에서 잊지 말아야 할 태도까지, 평생 역사를 들여다보며 온갖 질문을 던지고 답을 찾아 다른 이들과 나눠온 저자의 역사 사용법을 한데 모아 전한다. "삶이라는 문제에 역사보다 완벽한 해설서가 없다"는 그의 말을 새기며 이 책을 기본 교재로 삼아 당면한 과제를 하나씩 풀어보자.','최태성','다산초당','역사','역사의 쓸모.jpg','/files/역사의 쓸모.jpg',15000,10000,0,6000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(117,0,'역사 문해력 수업','역사의 쓸모가 궁금한 이들이 알아야 할 역사 사용 설명서. 독일사와 역사이론을 전공한 지은이가 역사를 읽고 쓰는 법, 즉 역사 문해력literacy에 관해 이야기한다. 18세기 유럽의 계몽주의 시대에 능동적인 독자였던 시민들이 세상을 바꿔갔듯이, 4차 산업혁명이 가속화하는 실용 만능의 시대라 해도 역사를 제대로 아는 것이 현재를 파악하고 미래를 예측하는 데 여전히 유용하다고 여기기 때문이다.

지은이는 1부 실용 만능의 시대에도 역사를 찾는 이유 에서 역사의 효용으로 올바름의 기준, 방향성 제시, 교훈 등을 든다. 2부 역사적 진실과 사실, 4부 시간 감각과 역사의식, 8부 다시, 역사란 무엇인가에선 역사란 무엇인지 그 의미를 찾아나선다. 3부 역사가의 방법 사용설명서, 5부 시간 감각과 역사의식, 6부 세계사를 읽는 네 개의 키워드, 7부 객관적 역사서술의 꿈은 숱하게 명멸해간 역사가들의 방법론과 역사관을 보여준다.','최호근','푸른역사','역사','역사 문해력 수업.jpg','/files/역사 문해력 수업.jpg',20000,10000,0,7000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(118,0,'종교의 흑역사','최근 넷플릭스에서 다룬 종교의 비리가 대한민국을 크게 들썩였다. 한 번이라도 뉴스를 본 적 있는 사람이라면 누구나 ‘AI와 챗GPT의 시대에 아직도 종교가 문제라고?’라는 의문을 가졌을 것이다. 우리말로 ‘최고의 가르침’이라는 뜻의 종교(宗敎). 그러나 탄생부터 지금까지 종교의 관심은 인류의 구원이 아닌 ‘돈’일 때가 많았고, 모순적이게도 세상의 변화에 불 지펴 온 가장 강력한 두 축 역시 종교와 돈이었다.

이 책은 신의 이름으로 비즈니스를 하거나, 국가와 권력 다툼을 한 종교부터 나라 안 최고 재벌이 된 사찰의 이야기까지 우리가 미처 몰랐던 ‘종교의 흑역사’를 모았다. 종교를 중심에 두고 역사의 흐름을 읽으면 각각의 사건으로 흩어진 세계사가 머릿속에서 명쾌하게 정리되고, 부의 흐름을 읽어내는 눈까지 얻을 수 있다. 교과서에서 알려준 지식의 한계에서 벗어나 세상의 진짜 모습을 이 한 권으로 알게 되길 바란다.','오무라 오지로','유노책주','역사','종교의 흑역사.jpg','/files/종교의 흑역사.jpg',16700,10000,0,8000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(119,0,'문학의 역사','우리는 왜 문학을 읽을까? 무한한 상상력과 지성으로 인간과 세계를 해석하고 표현하는 문학은 역사 속에서 여러 형태와 방식으로 존재해왔다. 고대에는 신화와 서사시로, 중세에는 신비극으로, 인쇄 혁명 이후에는 종이책으로, 그리고 현대에는 전자책과 같은 디지털 콘텐츠로.

이러한 수천 년간의 변화 속에서도, 정치·사회·문화·과학기술이 발전하면서 인간의 삶이 엄청나게 진전했는데도 여전히 독자들의 사랑을 받고 있는 문학 작품은 어떤 매력을 갖고 있을까? 작품 속 배경과 전개 방식이 이질적이고, 현실에서는 절대 일어날 수 없는 허구임을 뻔히 알면서도 우리는 그 이야기에 빠져들어 슬퍼하거나 웃음을 터뜨린다. 왜 그럴까? 이 책에서 문학의 진면목을 제대로 마주해보자.','전 서덜랜드,','소소의책','역사','문학의 역사.jpg','/files/문학의 역사.jpg',24000,10000,0,9000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(120,0,'과학의 역사','과학은 언제나 경이롭고 흥미진진하다. 우리가 살고 있는 세계와 인간에 대한 호기심, 그리고 끝없는 상상력은 과학 발전의 원동력으로 작용했다. 고대에는 마법, 종교, 기술, 과학이 혼재했지만 중세 암흑기를 거쳐 다양한 분야로 세분화된 현대에 이르기까지 과학은 눈부신 성과를 거두었다.

지구와 우주를 둘러싼 논쟁, 인체의 구성 요소와 작동 원리, 뉴턴 혁명, 원소와 방사능 연구, 상대성이론, 빅뱅, 인터넷과 컴퓨터 혁명 등 과학은 실로 엄청난 발전을 이어왔다. 이 책은 그러한 과학사의 중요 지점을 명쾌하게 다루면서 끊임없는 연구로 폭넓은 지식과 이론을 확립한 과학자들의 이야기를 담고 있다.','윌리엄 바이넘','소소의책','역사','과학의 역사.jpg','/files/과학의 역사.jpg',23000,10000,0,21000,SYSDATE);




------------------------에세이 121~130 ---------------------------------------------------------------------------------------------------------------------------

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(121,0,'인듀어런스','인듀어런스','김세중','뜨인돌','에세이','인듀어런스.jpg','/files/인듀어런스.jpg',15000,10000,1,1000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(122,0,'느리게 산다는 것','느리게 산다는 것','피에르 쌍소','드림셀러','에세이','느리게 산다는 것.jpg','/files/느리게 산다는 것.jpg',15200,10000,0,2000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(123,0,'드랍 더 비트','드랍 더 비트','김근','쌤앤파커스','에세이','드랍 더 비트.jpg','/files/드랍 더 비트.jpg',40000,10000,0,3000,SYSDATE);

INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(124,0,'아무것도 하지 않는 법','“아무것도 하지 않는 것은 휴대폰을 내려놓고 그 자리에 가만히 머무는 것이다.” 『아무것도 하지 않는 법』의 저자 제니 오델은 소셜미디어를 비롯한 관심경제에 사로잡힌 관심의 주권을 되찾아 다른 방향으로 확장하자고 제안한다.

우리가 관심을 기울여야 할 곳은 작고 네모난 기기가 아니라 실제 세계의 시공간이다. 새를 관찰하는 시간을 해독제로 여기고, 공원에서 많은 시간을 보내는 저자는 자신의 경험과 예술, 철학, 역사 속에서 건져 올린 다양한 사례를 시적인 문체로 엮으며 관심을 기울일 때 확장되는 세계를 생생하게 펼쳐 보인다. 다정하면서도 선명한 목소리를 지닌 제니 오델의 매력적인 데뷔작은 버락 오바마가 추천하고, 뉴욕타임스 베스트셀러에 오르며 많은 독자와 만났다.
','제니 오델','필로우','에세이','아무것도 하지 않는 법.jpg','/files/아무것도 하지 않는 법.jpg',18500,10000,0,4000,SYSDATE);


INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(125,0,'벨기에 에세이','영국 요크셔의 황량하고 거친 들판은 19세기 두 편의 위대한 소설의 배경이었다. 바로 샬럿 브론테의 『제인 에어』(1847)와 에밀리 브론테의 『폭풍의 언덕』(1847)이다. 백 년이 넘은 오늘날까지도 독자들의 마음을 뒤흔들어 놓은 작품들이다. 그들의 막내 여동생인 앤 브론테 역시 『아그네스 그레이』를 쓴 재능 있는 소설가였다.

어머니가 일찍 세상을 뜨고 목사인 아버지와 이모의 손에서 자란 브론테 자매는 일기를 함께 쓰고, 상상의 세계를 공유하며 이야기를 만드는 등 내밀한 관계를 유지했다. 그들이 남긴 일기와 편지, 그리고 샬럿과 에밀리가 벨기에 브뤼셀에서 유학하며 쓴 프랑스어 에세이들을 엮어 『벨기에 에세이』에 담았다.
','샬롯 브론테','미행','에세이','벨기에 에세이.jpg','/files/벨기에 에세이.jpg',15000,10000,1,5000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(126,0,'에세이즘','아일랜드의 비평가이자 에세이스트인 저자 브라이언 딜런은 에세이가 무엇인지, 무엇까지 될 수 있는지, 걸출한 에세이스트들이 그들의 글에 무엇을 담아왔는지 말한다. 그는 에세이가 취하는 형식에 대하여, 잘 쓴 에세이들에 내재하는 원칙에 대하여, 그 자신이 사랑하는 에세이의 특징들에 대하여 쿨한 분석을 내어 놓는다. 롤랑 바르트와 수전 손택과 존 디디온을 오가는, 에세이에 관한 독특하고 흥미로운 에세이가 이어진다.

폄하되거나 오독되어 왔던 에세이라는 장르의 진가를 짚어내는 이 글들엔 어딘가 시원하고 통쾌하고 또 달달한 맛이 있다. 정확한 옹호, 뻔하지 않은 칭찬의 달달한 맛. 글쓰기에 관한 책은 잘 써야만 설득력이 있고 에세이에 관한 에세이 또한 마찬가지다. 어려운 주제를 저자만의 방식으로 잘 살려낸 책이다.
','브라이언 딜런','카라칼','에세이','에세이즘.jpg','/files/에세이즘.jpg',16800,10000,1,6000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(127,0,'평범하게 비범한 철학 에세이','철학은 어떻게 삶의 의미가 되는가? 우리의 삶은 평범하기도 하고 비범하기도 하다. 전체로 놓고 보면 우리의 삶은 너무나 평범하다. 우리 모두는 태어나서 늙고 병들고 죽는다. 알고 보면 그게 다이다. 하지만 그러한 평범한 삶의 여정 속에는 반짝반짝 빛나는 비범한 순간들이 있다. 그 반짝반짝 빛나는 비범한 순간은 아름다운 순간일 수도 있고, 깨달음의 순간일 수도 있고, 고통스러운 순간일 수도 있다. 하지만 비범한 순간들은 결국은 평범 속에 묻혀 버린다.

『평범하게 비범한 철학 에세이』는 묻히고 사라질 것 같은 그 비범한 순간들의 이야기이다. 영화를 보다가, 소설을 읽다가, 그림을 보다가, 여행을 하다가, 평범한 일상 속에서 포착한 반짝이는 비범한 순간들, 지극히 평범하지만 누구나 비범한 우리들의 이야기를 담았다. 어느 날, 철학이 내게 들어왔다. 철학 유튜브 1위, ‘5분 뚝딱 철학’ 김필영 박사의 삶의 의미를 되묻는 26가지 철학 스토리!','김필영','스마트북스','에세이','평범하게 비범한 철학 에세이.jpg','/files/평범하게 비범한 철학 에세이.jpg',17800,10000,1,7000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(128,0,'시맨틱 에러 포토에세이','왓챠 오리지널 드라마 ‘시맨틱 에러’ 포토에세이. 베스트셀러이자 스테디셀러인 원작의 인기에 힘입어 웹툰화에 이어 드라마화를 성사시키며 크랭크인 전부터 장르 팬들의 이목을 집중시킨 이슈작이다. 좋은 원작, 찰떡 캐스팅, 완성도 높은 각색과 연출까지 삼박자가 맞아떨어졌다는 평을 들으며 방영 내내 왓챠 TOP10 1위를 차지했다.

일명 ‘드에러’로 불리며 인기를 끌고 있는 이 웹드라마를 포토에세이 속에 머리끝부터 발끝까지 담았다. 임팩트 있는 명장면부터 못 보고 지나친 작은 재미들까지 곱씹을 수 있도록, 영상과는 또 다른 각도의 풍성한 스틸컷 위주로 구성했다. 대본으로 적절히 각색되어 새로운 느낌을 주었던 명대사, 드라마에서만 볼 수 있었던 배우들의 섬세한 감정 연기, 감각 있는 연출로 가슴 뛰게 했던 씬들이 가득 담겨 있다.','왓챠','블랙디','에세이','시맨틱 에러 포토에세이.jpg','/files/시맨틱 에러 포토에세이.jpg',22000,10000,1,8000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(129,0,'그럴 수 있어','『그러라 그래』로 큰 울림을 준 양희은이 더 깊은 이야기로 들고 2년 만에 돌아왔다. 양희은의 글은 특별하다. 함부로 누군가를 위로하지 않고, 섣부르게 사랑한다고 말하지도 않는다. 하지만 어느새 내린 가랑비에 완전히 젖어들 듯 그의 덤덤한 사색은 우리 안에 서글픔을 찾아 축축하게 적시며 인생의 어떤 시간들을 반추하게 만든다. 이번 책에서는 나이 들어감을 넘어 이별에 더 한발 가까이 다가선다.

자신의 이별 준비 노트를 쓰고, 가장 가까웠던 친구의 이별 전화를 받고 하늘이 더없이 맑아 통일전망대에서 개성 송악산이 보였다는 어떤 날에 목 놓아 운 이야기를 써 내려간다. 이별을 겪을 때마다 가슴 한가운데가 막혀서 한강 둔치를 하염없이 걷고 봄이 겨울을 밀어내듯 슬픔이 지나가길 기다리는 순전한 인내는 마음을 깊게 파고든다.
','양희은','웅진지식하우스','에세이','그럴 수 있어.jpg','/files/그럴 수 있어.jpg',16800,10000,1,9000,SYSDATE);
INSERT into book (BOOKID,  MEMBERID, BOOKNAME ,BOOKCONTENT, AUTHOR, PUBLISHER, GENRE ,FILENAME, FILEPATH ,PRICE ,SALESQUANTITY,recommendedBook, VIEWS,PUBLICATIONYEAR)
values(130,0,'나의 못 말리는 하우스메이트','어스름 새벽부터 어디론가 분주히 움직이는 사람들, 저녁에도 시린 불빛들이 가득한 빌딩숲, 뜨거운 아스팔트와 귀를 찌르는 경적 소리, 쏜살같이 오고가는 자동차들. 이 모든 것들이 존재하는 대도시 서울. 이곳으로 천둥이가 상경한다.

몸무게 26킬로그램, 고동빛 털이 매력적인 진도풍산리트리버 천둥이는 누가 봐도 멋쟁이 대형견이다. 강원도 산골에서 집을 지켜주는 듬직한 개로 무럭무럭 자란 천둥이는 서울에선 입장이 조금, 아니 많이 달라졌다. 자전거, 닭뼈, 염화칼슘 등 조심해야할 것들이 가득한 산책길은 물론이고, 피할 길 없는 오해와 이유 없는 편견과 자주 마주해야 했다.

“서울에서 우리 둘의 작은 자리를 확보하는 것은 어떤 순간에는 일종의 투쟁에 가까웠다.”고 김소담 작가는 말한다. 결코 쉬운 일은 아니지만 그럼에도 작가는 천둥이와 도시 생활에 서서히 적응해간다. 적응하며 나아간다. 그러면서 깨닫는다. 아이처럼 대형견 한 마리를 키우는데도 하나의 마을이 필요하다는 것을.

《나의 못 말리는 하우스메이트》는 작가가 <인문교양 월간 유레카>라는 잡지사에서 일하는 동안 연재한 글들을 바탕으로 만들어진 에세이다. 각 에피소드마다 들어간 그림은 연재할 때부터 함께한 이파람 작가가 그려주었다. 편안한 선으로 이루어진 그의 그림들은 대부분 실제 사진을 보고 그린 것이라 더없이 친근하고 다정한 분위기를 자아낸다.','김소담','나무의말','에세이','나의 못 말리는 하우스메이트.jpg','/files/나의 못 말리는 하우스메이트.jpg',16800,10000,1,22000,SYSDATE);



---------------------------------------------------------------------------------------------------------------------------------------------------


------------------------cart---------------------------------------------------------------------------------------------------------------------------
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(1,1,1,1,16000);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(2,2,2,1,37800);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(3,3,3,1,35000);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(4,4,4,1,35000);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(5,5,5,1,35000);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(6,1,6,1,35000);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(7,2,7,1,35000);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(8,3,8,1,3500);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(9,4,9,1,18000);
INSERT into cart (CARTID,MEMBERID,BOOKID,WISHQUANTITY,AMOUNT)
values(10,5,10,1,17000);



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




------------------------Comments---------------------------------------------------------------------------------------------------------------------------
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(1,0,1,'관리자가 강추하는 도서입니다!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(2,1,1,'살까 말까?',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(3,2,1,'구매 후기 댓글에부탁!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(4,3,1,'사고싶다',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(5,4,1,'이거 샀는데 너무 좋더라',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(6,5,1,'이 책 강추!!!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(7,1,1,'최고!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(8,2,1,'최고!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(9,3,1,'진짜 산다!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(10,1,2,'다들 꼭 사세요 엄청좋아요!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(11,2,3,'다들 꼭 사세요 엄청좋아요!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(12,3,4,'다들 꼭 사세요 엄청좋아요!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(13,4,5,'다들 꼭 사세요 엄청좋아요!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(14,5,6,'다들 꼭 사세요 엄청좋아요!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(15,1,7,'다들 꼭 사세요 엄청좋아요!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(16,2,8,'다들 꼭 사세요 엄청좋아요!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(17,3,9,'다들 꼭 사세요 엄청좋아요!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(18,4,10,'다들 꼭 사세요 엄청좋아요!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(19,5,11,'다들 꼭 사세요 엄청좋아요!',SYSDATE);
INSERT into comments (COMMENTID,MEMBERID,BOOKID,COMMENTCONTENT,COMMENTDATE) values(20,1,12,'다들 꼭 사세요 엄청좋아요!',SYSDATE);


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




------------------------Notice---------------------------------------------------------------------------------------------------------------------------
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(1,0,'긴급공지입니다','8월19일 14시 점검합니다','중요',SYSDATE,0);

INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(16,0,'리뷰이벤트 진행예정','8월20일~8월30일 전 상품 30% 여름 할인예정!','중요',SYSDATE,0);

INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(15,0,'택배 지연발생 공지','택배 지연발생시 문의바랍니다','공지',SYSDATE,0);

INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(14,0,'이달의 도서 공지','8월 베스트셀러 스티브잡스입니다!','공지',SYSDATE,0);

INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(13,0,'환불/교환 공지','환불 또는 교환 필요시 031-1234-5678로 전화문의 바랍니다','공지',SYSDATE,0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(12,0,'환불/교환 공지','환불 또는 교환 필요시 031-1234-5678로 전화문의 바랍니다','공지',SYSDATE,0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(11,0,'환불/교환 공지','환불 또는 교환 필요시 031-1234-5678로 전화문의 바랍니다','공지',SYSDATE,0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(10,0,'환불/교환 공지','환불 또는 교환 필요시 031-1234-5678로 전화문의 바랍니다','공지',SYSDATE,0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(9,0,'환불/교환 공지','환불 또는 교환 필요시 031-1234-5678로 전화문의 바랍니다','공지',SYSDATE,0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(8,0,'환불/교환 공지','환불 또는 교환 필요시 031-1234-5678로 전화문의 바랍니다','공지',SYSDATE,0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(7,0,'환불/교환 공지','환불 또는 교환 필요시 031-1234-5678로 전화문의 바랍니다','공지',SYSDATE,0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(6,0,'환불/교환 공지','환불 또는 교환 필요시 031-1234-5678로 전화문의 바랍니다','공지',SYSDATE,0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(5,0,'환불/교환 공지','환불 또는 교환 필요시 031-1234-5678로 전화문의 바랍니다','공지',SYSDATE,0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(4,0,'환불/교환 공지','환불 또는 교환 필요시 031-1234-5678로 전화문의 바랍니다','공지',SYSDATE,0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(3,0,'환불/교환 공지','환불 또는 교환 필요시 031-1234-5678로 전화문의 바랍니다','공지',SYSDATE,0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(2,0,'환불/교환 공지','환불 또는 교환 필요시 031-1234-5678로 전화문의 바랍니다','공지',SYSDATE,0);



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





------------------------Orders---------------------------------------------------------------------------------------------------------------------------
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(1,1,11,'1','1',15300,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(2,1,12,'2','2',15000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(3,1,13,'3','3',18000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(4,1,14,'4','4',16800,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(5,2,15,'5','5',16800,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(6,2,16,'6','6',5900,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(7,2,17,'7','7',9000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(8,2,18,'8','8',10000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(9,3,19,'9','9',11000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(10,3,20,'10','10',15000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(11,3,21,'11','11',13000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(12,3,22,'12','12',9000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(13,4,23,'13','13',10000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(14,4,24,'14','14',14000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(15,4,25,'15','15',15000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(16,4,26,'16','16',23000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(17,5,27,'17','17',14000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(18,5,28,'18','18',7600,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(19,5,29,'19','19',17000,1,SYSDATE,0);
INSERT into orders (ORDERID,  MEMBERID, BOOKID ,ORDERNUM, IMPUID, AMOUNT, WISHQUANTITY,ORDERDATE,USEPOINT)
values(20,5,30,'20','20',13000,1,SYSDATE,0);


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------Delivery---------------------------------------------------------------------------------------------------------------------------

select * from  member;
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(1,1,1,'안유진집','01012345678','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬101호','101호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(2,2,1,'안유진집','01012345678','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬101호','101호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(3,3,1,'안유진집','01012345678','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬101호','101호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(4,4,1,'안유진집','01012345678','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬101호','101호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(5,5,2,'손흥민집','01034567890','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬201호','201호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(6,6,2,'손흥민집','01034567890','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬201호','201호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(7,7,2,'손흥민집','01034567890','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬201호','201호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(8,8,2,'손흥민집','01034567890','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬201호','201호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(9,9,3,'유재석집','01023456789','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬301호','301호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(10,10,3,'유재석집','01023456789','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬301호','301호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(11,11,3,'유재석집','01023456789','13111','경기 성남시 수정구 태평동 7210동','수앤수캐슬301호','301호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(12,12,3,'유재석집','01023456789','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬301호','301호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(13,13,4,'아이유집','01022334455','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬401호','401호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(14,14,4,'아이유집','01022334455','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬401호','401호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(15,15,4,'아이유집','01022334455','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬401호','401호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(16,16,4,'아이유집','01022334455','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬401호','401호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(17,17,5,'이강인집','01099998888','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬501호','501호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(18,18,5,'이강인집','01099998888','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬501호','501호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(19,19,5,'이강인집','01099998888','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬501호','501호',5000,SYSDATE,'배송중');
INSERT into delivery (DELIVERYID, ORDERID ,MEMBERID  ,RECIPIENT, DELIVERYTEL, POSTCODE, ADDRESS ,DETAILADDRESS, EXTRAADDRESS ,DELIVERYCOST ,ORDERDATE,DELIVERYSTATE)
values(20,20,5,'이강인집','01099998888','13111','경기 성남시 수정구 태평동 7210','수앤수캐슬501호','501호',5000,SYSDATE,'배송중');




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




------------------------Review---------------------------------------------------------------------------------------------------------------------------



INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(1,1,11,1,'너무 별루임 별점1점','처음부터 끝까지 내용 이상함 나만그런가??','일간 이슬아 수필집.jpg','/reviewImg/일간 이슬아 수필집.jpg',1,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(2,2,15,5,'이거말고 딴 책읽으셈 ','완전별루ㅠㅠ','한국대표수필 75.jpg','/reviewImg/한국대표수필 75.jpg',2,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(3,3,19,9,'대박!!','진짜 수필에 관해서 최고인듯^^','수필 쓰기.jpg','/reviewImg/수필 쓰기.jpg',4,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(4,4,23,13,'다들 강추 이거 꼭보세요','진정한 코미디책인듯 너무재밌어!!!!','헷갈려 코미디.jpg','/reviewImg/헷갈려 코미디.jpg',4,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(5,5,27,17,'난 별루...','...별루','새드엔딩은 없다.jpg','/reviewImg/새드엔딩은 없다.jpg',1,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(6,1,12,2,'이게짱이네','진짜 읽는내내 빵터져서봄','관촌수필.jpg','/reviewImg/관촌수필.jpg',4,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(7,2,16,6,'ㅋㅋㅋㅋ처음 리뷰써봄','대박이라는 말밖에 ㅋㅋㅋㅋ','수필.jpg','/reviewImg/수필.jpg',5,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(8,3,20,10,'괜찮네요','적당히 재밌는데 다들읽어보세요! 권력','손광성의 수필 쓰기.jpg','/reviewImg/손광성의 수필 쓰기 권력.jpg',3,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(9,4,24,14,'그저 그럼 평펌한듯요','무난 무난','로맨스와 코미디가 만났을 때.jpg','/reviewImg/로맨스와 코미디가 만났을 때 교실.jpg',3,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(10,5,28,18,'다신 안살듯 별루','완전별루 1점드릴게요 ','조선 로맨틱 코미디.jpg','/reviewImg/조선 로맨틱 코미디.jpg',1,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(11,1,13,3,'완전 내스타일!!','진짜 보면서 빵터졌네 ㅋㅋ','아름다운 우리 수필.jpg','/reviewImg/아름다운 우리 수필.jpg',4,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(12,2,17,7,'수필좋아하시는분 강추!','고전수필중에 베스트5인듯','아름다운 우리 고전 수필.jpg','/reviewImg/아름다운 우리 고전 수필.jpg',4,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(13,3,21,11,'노잼인데 이거','별루 하나도 안웃김 ㅋㅋㅋ돈아까워','블랙코미디.jpg','/reviewImg/블랙코미디.jpg',2,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(14,4,25,15,'다시 또 살게요!','좋아요','코미디, 웃음과 행복의 텍스트.jpg','/reviewImg/웃음과 행복의 텍스트.jpg',3,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(15,5,29,19,'개별루 배송도 구림','별루','웃음박제.jpg','/reviewImg/웃음박제.jpg',5,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(16,1,14,4,'배송엄청 빨라요!!','오메 배송 ㅠㅠ','전등수필.jpg','/reviewImg/전등수필.jpg',5,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(17,2,18,8,'책 보다 배송이 문제임 이거','배송느려여','좋은수필 2023.7.jpg','/reviewImg/좋은수필 2023.7.jpg',2,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(18,3,22,12,'스토리 대박!!','짱 굿','코미디영화의 이해.jpg','/reviewImg/코미디영화의 이해.jpg',1,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(19,4,26,16,'너무 재밌어요 추천합니다!','추천합니다!!!','차이에서 배워라.jpg','/reviewImg/차이에서 배워라.jpg',4,0,'리뷰완료',sysdate);
INSERT into review (REVIEWID, MEMBERID ,BOOKID  ,ORDERID, REVIEWSUBJECT, REVIEWCONTENT, REVIEWFILENAME,REVIEWFILEPATH,GRADE,VIEWS,REVIEWSTATE,REVIEWDATE)
values(20,5,30,20,'최고!!','잼써요','진지함의 중요성.jpg','/reviewImg/진지함의 중요성.jpg',5,0,'리뷰완료',sysdate);


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

commit;

select * from member;
select * from book;
select * from orders;
select * from delivery;
select * from comments;
select * from notice;
select * from review;




