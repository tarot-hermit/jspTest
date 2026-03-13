show tables;

CREATE TABLE guest (
    idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  /* 방명록 고유번호 */
    name VARCHAR(20) NOT NULL,                    /* 작성자 성명 */
    content TEXT NOT NULL,                        /* 글 내용 */
    email VARCHAR(60),                            /* 메일주소 */
    homePage VARCHAR(60),                         /* 홈페이지 주소 */
    visitDate DATETIME DEFAULT NOW(),             /* 방문일자 */
    clientIp VARCHAR(30) NOT NULL                   /* 접속 IP */
);

desc guest;

DROP TABLE guest;

insert into guest values (default, '관리자', '방명록 서비스를 시작합니다.' , 'dldk5252@gmail.com', '' , default , '192.168.50.51');

select * from guest;

INSERT INTO guest VALUES (default, '홍유유', '테스트1', '', '', default, '192.168.50.51');
INSERT INTO guest VALUES (default, '홍유유', '테스트2', '', '', default, '192.168.50.51');
INSERT INTO guest VALUES (default, '홍유유', '테스트3', '', '', default, '192.168.50.51');
INSERT INTO guest VALUES (default, '홍유유', '테스트4', '', '', default, '192.168.50.51');
INSERT INTO guest VALUES (default, '홍유유', '테스트5', '', '', default, '192.168.50.51');

SELECT DISTINCT name FROM guest;


