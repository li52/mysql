DROP DATABASE IF EXISTS db_1702;-- 如果有数据库则删除

CREATE DATABASE db_1702;-- 创建数据库

DROP TABLE IF EXISTS db_1702.student;-- 如果有表格  则删除
CREATE TABLE db_1702.student ( -- 创建表格
  id     INT AUTO_INCREMENT PRIMARY KEY -- auto increment 增量\ ['ɪŋkrɪm\(ə\)nt] 阻建
  COMMENT 'ID',
  name   VARCHAR(255) COMMENT '姓名', -- 255
  intro  TEXT COMMENT '简介',
  gender CHAR(2) COMMENT '性别',
  age    INT UNSIGNED COMMENT '年龄',
  height DOUBLE(3, 2) COMMENT '身高',
  price  DECIMAL(10, 3) COMMENT '价格', -- 1234.56
  dob    DATE COMMENT '出生日期', -- date of birth
  time   DATETIME COMMENT '时间'
);

INSERT INTO db_1702.student VALUES (NULL , 'Jerry', 'asdf', 'M', 18, 1.7, 1234567.891, '1999-5-1', '2017-5-1 1:39:01');

SELECT *
FROM db_1702.student;

DELETE FROM db_1702.student
WHERE id = 2;

DELETE  FROM db_1702.student;

TRUNCATE TABLE db_1702.student;

CREATE TABLE db_1702.student_coures(
  id  INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK1'
)