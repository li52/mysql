DROP TABLE db_1702.student;

CREATE TABLE db_1702.student(
  name VARCHAR(255), -- 255是可变字符类型最大值
  intro TEXT,
  gender CHAR(2),-- 长度
  age int UNSIGNED,
  height double(3,2),-- 3代表位数 2代表小数点后面的位数
  price DECIMAL(6,2),-- 长度是6  2是小数点后面两位
  dob DATE,
  time DATETIME
);
INSERT INTO db_1702.student VALUES ('Tom', 'asdgggf', 'k',32951 , 1.7, 123.456, '1995-2-9', '2017-5-16 10:52:03');

SELECT *
FROM db_1702.student;