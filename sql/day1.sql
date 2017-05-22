-- dialect ['daɪəlekt] n. 方言；地方话
-- RDBMS SQL

SHOW DATABASES; -- Ctrl(Command) + Enter  显示数据库
CREATE DATABASE db_1702;-- 创建数据库

DROP DATABASE db_1702; -- 删除数据库

-- USE db_1702;

SHOW TABLES; -- 显示列表

CREATE TABLE db_1702.t_student ( -- 创建表格
  sno    VARCHAR(10), -- variable character 可变长字符类型
  sname  VARCHAR(10), -- 属性 列 字段 column   -- 可以显示10个字符
  gender CHAR(1),
  age    INT(2)
);
DROP TABLE db_1702.t_student; -- 删除表格

SELECT *
FROM db_1702.t_student;

INSERT INTO db_1702.t_student
VALUES ('2017001', '张三', '男', 18);

-- 1PB = 1024 TB

SELECT 1 + 1;