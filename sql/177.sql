# 1.
# Student 表的定义
# id
# name
# gender
# dob出生日期
# department系名称
# address
DROP DATABASE IF EXISTS db_17021;
CREATE DATABASE db_17021;

DROP TABLE IF EXISTS db_17021.student;
CREATE TABLE db_17021.student (
  id         INT UNIQUE PRIMARY KEY
  COMMENT 'ID PK',
  name       VARCHAR(255) COMMENT '姓名',
  gender     VARCHAR(255) COMMENT '性别',
  dob        DATE COMMENT '出生日期',
  department VARCHAR(255) COMMENT '系名称',
  address    VARCHAR(255) COMMENT '住址'
)
  COMMENT '学生表';
SELECT *
FROM db_17021.student;
# Score 表的定义
# id
# studentId
# course课程名
# grade
DROP TABLE IF EXISTS db_17021.score;
CREATE TABLE db_17021.score (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  studentId INT COMMENT 'FK', -- 学生编号
  course    VARCHAR(255) COMMENT '课程名',
  grade     INT COMMENT '成绩'-- 年级
)
  COMMENT '成绩表';

#创建合理的外键关联
ALTER TABLE db_17021.score
  ADD CONSTRAINT
  score_fk_studentId
FOREIGN KEY (studentId)
REFERENCES db_17021.student (id);
#为student表和score表各增加5条记录
INSERT INTO db_17021.student VALUES (107201, 'Tom', 'M', '1989-08-06', '建筑系', '沈阳');
INSERT INTO db_17021.student VALUES (107202, 'jack', 'F', '1978-09-08', '化学系', '上海');
INSERT INTO db_17021.student VALUES (107203, '张三', 'M', '1990-02-06', '电子系', '山东');
INSERT INTO db_17021.student VALUES (107204, '李四', 'F', '1998-03-07', '教育系', '天津');
INSERT INTO db_17021.student VALUES (107205, '王五', 'F', '1993-02-02', '计算机系', '北京');

INSERT INTO db_17021.score VALUES (NULL, 107201, '计算机', '90');
INSERT INTO db_17021.score VALUES (NULL, 107202, '教育', '99');
INSERT INTO db_17021.score VALUES (NULL, 107201, '电子', '97');
INSERT INTO db_17021.score VALUES (NULL, 107202, '化学', '88');
INSERT INTO db_17021.score VALUES (NULL, 107203, '建筑', '95');
#查询student表的所有记录
SELECT *
FROM db_17021.student;
#查询student表的第2条到4条记录
SELECT *
FROM db_17021.student
LIMIT 1, 3;
#从student表查询所有学生的学号（id）、姓名（name）和院系
# （department）的信息
SELECT
  id,
  name,
  department
FROM db_17021.student;
#从student表中查询计算机系和电子系的学生的信息
SELECT *
FROM db_17021.student
WHERE department IN ('计算机系', '电子系');
#从student表中查询年龄18~22岁的学生信息
# 从student表中查询每个院系有多少人
SELECT
  department,
  COUNT(id)
FROM db_17021.student
GROUP BY department;
# 从score表中查询每个科目的最高分
SELECT
  course,
  MAX(grade)
FROM db_17021.score
GROUP BY course;
# 查询李四的考试科目（c_name）和考试成绩（grade）
SELECT
  course,
  grade
FROM db_17021.score
WHERE studentId = (SELECT id
                   FROM db_17021.student
                   WHERE name = '李四');
# 用连接的方式查询所有学生的信息和考试信息
SELECT
  db_17021.student.id,
  name,
  gender,
  dob,
  department,
  address,
  course,
  grade
FROM db_17021.student, db_17021.score
WHERE db_17021.student.id = db_17021.score.studentId;
# 计算每个学生的总成绩
SELECT *
FROM db_17021.score
WHERE grade IN ('tom', 'jack', '张三', '李四', '王5');
# 计算每个考试科目的平均成绩
SELECT
  course,
  AVG(grade)
FROM db_17021.score
GROUP BY course;
# 查询计算机成绩低于95的学生信息
SELECT *
FROM db_17021.student
WHERE id IN (
  SELECT studentId
  FROM db_17021.score
  WHERE course = '计算机' AND grade < 95);
# 查询同时参加计算机和英语考试的学生的信息
# 将计算机考试成绩按从高到低进行排序
SELECT
  studentId,
  grade
FROM db_17021.score
WHERE course = '计算机'
ORDER BY grade DESC;
# 从student表和score表中查询出学生的学号，然后合并查询结果
SELECT id
FROM db_17021.student
UNION
SELECT studentId
FROM db_17021.score;
# 查询姓张或者姓王的同学的姓名、院系和考试科目及成绩
SELECT
  db_17021.student.id,
  name,
  grade,
  dob,
  department,
  address,
  course,
  grade
FROM db_17021.student, db_17021.score
WHERE
  (name LIKE '张%' OR name LIKE '王%')
  AND
  db_17021.student.id = db_17021.score.studentId;
# 查询都是湖南的学生的姓名、年龄、院系和考试科目及成绩