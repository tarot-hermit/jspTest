-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.44 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- springgreen 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `springgreen` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `springgreen`;

-- 테이블 springgreen.hoewon 구조 내보내기
CREATE TABLE IF NOT EXISTS `hoewon` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int DEFAULT '20',
  `gender` char(2) DEFAULT '여자',
  `address` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 springgreen.hoewon:~7 rows (대략적) 내보내기
DELETE FROM `hoewon`;
INSERT INTO `hoewon` (`idx`, `name`, `age`, `gender`, `address`) VALUES
	(1, '홍길동', 25, '남자', '서울'),
	(2, '김말숙', 55, '남자', '울산'),
	(3, '이기자', 39, '남자', '제주'),
	(6, '아톰', 22, '여자', '서울'),
	(7, '비톰맨', 44, '남자', '청주'),
	(8, '씨톰', 20, '여자', '서울'),
	(10, '디톰', 20, '여자', '제주');

-- 테이블 springgreen.insa 구조 내보내기
CREATE TABLE IF NOT EXISTS `insa` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int DEFAULT '20',
  `gender` char(2) DEFAULT '여자',
  `ipsail` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 springgreen.insa:~17 rows (대략적) 내보내기
DELETE FROM `insa`;
INSERT INTO `insa` (`idx`, `name`, `age`, `gender`, `ipsail`) VALUES
	(1, '홍길동', 20, '남자', '2026-01-23 13:48:03'),
	(2, '김말숙', 20, '여자', '2026-01-23 13:48:04'),
	(3, '김연아', 20, '여자', '2026-01-23 13:48:05'),
	(4, '홍길순', 33, '여자', '2023-05-06 00:00:00'),
	(5, '이겨라', 28, '남자', '2023-04-04 00:00:00'),
	(7, 'atom', 12, '여자', '2024-05-10 00:00:00'),
	(8, '비톰', 23, '남자', '2015-02-02 00:00:00'),
	(9, 'ctom', 34, '여자', '2021-12-21 00:00:00'),
	(10, '디톰', 45, '여자', '2016-05-11 00:00:00'),
	(11, 'etom', 32, '여자', '2025-12-23 00:00:00'),
	(12, 'ftom', 44, '남자', '2003-09-10 00:00:00'),
	(13, 'gtom', 19, '남자', '2023-03-08 00:00:00'),
	(14, 'htom', 32, '여자', '2026-05-07 00:00:00'),
	(15, 'jtom', 32, '여자', '2013-09-01 00:00:00'),
	(16, 'aaaa', 23, '여자', '2025-04-04 00:00:00'),
	(17, 'bbbb', 33, '여자', '2020-04-08 00:00:00'),
	(18, 'cccc', 35, '남자', '2017-04-06 00:00:00');

-- 테이블 springgreen.insa2 구조 내보내기
CREATE TABLE IF NOT EXISTS `insa2` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int DEFAULT '20',
  `gender` char(2) DEFAULT '여자',
  `ipsail` datetime DEFAULT CURRENT_TIMESTAMP,
  `photo` varchar(50) DEFAULT 'noimage.jpg',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 springgreen.insa2:~17 rows (대략적) 내보내기
DELETE FROM `insa2`;
INSERT INTO `insa2` (`idx`, `name`, `age`, `gender`, `ipsail`, `photo`) VALUES
	(1, '홍길동', 22, '남자', '2026-11-26 00:00:00', ''),
	(2, '김말숙', 20, '여자', '2026-01-26 20:44:19', 'noimage.jpg'),
	(3, '김연아', 20, '여자', '2026-01-26 20:44:20', 'noimage.jpg'),
	(4, 'atom', 12, '여자', '2025-04-04 00:00:00', 'noimage.jpg'),
	(5, 'btom', 32, '여자', '2026-04-01 00:00:00', 'noimage.jpg'),
	(8, 'itom', 32, '여자', '2026-01-01 00:00:00', '소리설정.jpg'),
	(9, 'jtom', 55, '남자', '2025-05-01 00:00:00', 'noimage.jpg'),
	(10, 'ktom', 77, '여자', '2023-01-04 00:00:00', '소리설정.jpg'),
	(11, 'ltom', 43, '여자', '2026-01-01 00:00:00', '소리설정_b.jpg'),
	(12, 'mtom', 22, '여자', '2026-04-01 00:00:00', 'noimage.jpg'),
	(13, 'otom', 32, '남자', '2026-03-01 00:00:00', '20251123_151927.jpg'),
	(14, 'ptom', 1234, '남자', '2025-01-02 00:00:00', '소리설정_b.jpg'),
	(16, 'rtom', 33, '여자', '2026-01-01 00:00:00', 'aws1260126094220.jpg'),
	(17, 'stom', 55, '여자', '2026-01-01 00:00:00', 'aws1_260126094319.jpg'),
	(18, 'ttom', 1234, '여자', '2026-01-01 00:00:00', 'aws1.jpg'),
	(20, 'ytom', 55, '여자', '2024-03-08 00:00:00', 'b5b7208f-6f5f-4af3-9f47-f08dd8519508.png'),
	(21, 'xtom', 11, '여자', '2024-01-01 00:00:00', '7.jpg');

-- 테이블 springgreen.jproduct 구조 내보내기
CREATE TABLE IF NOT EXISTS `jproduct` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `content` text,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 springgreen.jproduct:~0 rows (대략적) 내보내기
DELETE FROM `jproduct`;

-- 테이블 springgreen.salary 구조 내보내기
CREATE TABLE IF NOT EXISTS `salary` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `code` char(4) NOT NULL,
  `name` varchar(20) NOT NULL,
  `department` varchar(10) NOT NULL,
  `position` varchar(10) NOT NULL,
  `overtime` int DEFAULT '0',
  `netpay` int NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 springgreen.salary:~8 rows (대략적) 내보내기
DELETE FROM `salary`;
INSERT INTO `salary` (`idx`, `code`, `name`, `department`, `position`, `overtime`, `netpay`) VALUES
	(2, 'CK05', '홍길순', '총무과', '과장', 6, 2385000),
	(3, 'SS03', '나가자', '생산과', '사원', 6, 1512000),
	(4, 'SS02', '김빛나', '생산과', '사원', 9, 1593000),
	(5, 'YB01', '영원히', '영업과', '부장', 1, 2727000),
	(6, 'IB01', '강감찬', '인사과', '부장', 2, 2754000),
	(7, 'IB02', '아톰맨', '인사과', '부장', 3, 2781000),
	(8, 'CS06', '씨톰', '총무과', '사원', 3, 1431000);

-- 테이블 springgreen.test 구조 내보내기
CREATE TABLE IF NOT EXISTS `test` (
  `name` varchar(20) NOT NULL,
  `age` int DEFAULT '20',
  `gender` char(2) DEFAULT '여자',
  `ipsail` datetime DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 springgreen.test:~11 rows (대략적) 내보내기
DELETE FROM `test`;
INSERT INTO `test` (`name`, `age`, `gender`, `ipsail`, `address`) VALUES
	('강감찬', 50, '남자', '2026-01-15 18:02:13', '제주'),
	('가나다', 20, '남자', '2000-10-01 00:00:00', '광주'),
	('소나무', 34, '남자', '2023-06-25 00:00:00', '울산'),
	('이순신', 42, '남자', '2024-09-09 00:00:00', '서울'),
	('오하늘', 58, '여자', '2000-02-01 00:00:00', '청주'),
	('오하늘', 58, '여자', '2000-02-01 00:00:00', '청주'),
	('강감찬', 50, '남자', '2026-01-16 09:01:00', '제주'),
	('가나다', 20, '남자', '2000-10-01 00:00:00', '광주'),
	('소나무', 34, '남자', '2023-06-25 00:00:00', '울산'),
	('이순신', 42, '남자', '2024-09-09 00:00:00', '서울'),
	('오하늘', 58, '여자', '2000-02-01 00:00:00', '청주');

-- 테이블 springgreen.test2 구조 내보내기
CREATE TABLE IF NOT EXISTS `test2` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int DEFAULT '20',
  `gender` char(2) NOT NULL DEFAULT '남자',
  `address` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 springgreen.test2:~14 rows (대략적) 내보내기
DELETE FROM `test2`;
INSERT INTO `test2` (`idx`, `name`, `age`, `gender`, `address`) VALUES
	(1, '홍길동', 20, '남자', NULL),
	(2, '', 20, '남자', NULL),
	(3, '', 0, '남자', NULL),
	(4, '에프톰', 20, '남자', NULL),
	(5, '김말숙', 20, '여자', ''),
	(7, '김연아', 29, '남자', '서울'),
	(8, '소나무', 55, '남자', '청주'),
	(9, '오하늘', 39, '여자', '서울'),
	(10, '가나다', 39, '여자', '제주'),
	(11, '고인돌', 39, '남자', '광주'),
	(12, '아톰', 19, '여자', '청주'),
	(13, '비톰', 44, '남자', '제주'),
	(16, '씨톰', 46, '여자', '서울'),
	(17, '연습맨', 20, '남자', NULL),
	(18, '연습맨2', 39, '여자', '청주');

-- 테이블 springgreen.test3 구조 내보내기
CREATE TABLE IF NOT EXISTS `test3` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `mid` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 springgreen.test3:~2 rows (대략적) 내보내기
DELETE FROM `test3`;
INSERT INTO `test3` (`idx`, `mid`, `name`, `age`) VALUES
	(1, 'hkd1234', '홍길동', 25),
	(2, 'hks1234', '홍길순', 22),
	(3, 'lkj1234', '이기자', 12);

-- 테이블 springgreen.test4 구조 내보내기
CREATE TABLE IF NOT EXISTS `test4` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `bookName` varchar(20) NOT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `mid` (`mid`),
  CONSTRAINT `test4_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `test3` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 springgreen.test4:~2 rows (대략적) 내보내기
DELETE FROM `test4`;
INSERT INTO `test4` (`idx`, `mid`, `bookName`, `price`) VALUES
	(2, 'lkj1234', '노인과바다', 10000),
	(3, 'hkd1234', '노을저편', 25000);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
