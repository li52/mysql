SHOW DATABASES;
USE db_1702;
SHOW TABLES;

SHOW FULL COLUMNS FROM db_1702.student;
SHOW FULL COLUMNS FROM db_1702.course;
SHOW FULL COLUMNS FROM db_1702.student_course;

SELECT *
FROM db_1702.student;

SELECT *
FROM db_1702.course;

SELECT *
FROM db_1702.student_course;

TRUNCATE TABLE db_1702.student_course;

DELETE FROM db_1702.course
WHERE id > 2;

INSERT INTO db_1702.student
VALUES (NULL, '20170001', 'Tom', 'asdf', NULL, NULL, 1.7, 1234567.891, '1999-5-1', '2017-5-1 1:39:01');


DROP TABLE IF EXISTS db_1702.student_course;
CREATE TABLE db_1702.student_course (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  studentId INT COMMENT '学生 ID',
  courseId  INT COMMENT '课程 ID',
  score     INT COMMENT '考试成绩'
);


ALTER TABLE db_1702.student_course
  ADD CONSTRAINT
  fk_student_course_studentId
FOREIGN KEY (studentId)-- 字段必须指定
REFERENCES db_1702.student (id); -- a href hyper reference

ALTER TABLE db_1702.student_course
  ADD CONSTRAINT
  fk_student_course_courseId
FOREIGN KEY (courseId)
REFERENCES db_1702.course (id);

SHOW FULL COLUMNS FROM db_1702.student_course;

INSERT INTO db_1702.student_course
VALUES (NULL, 1, 1, NULL);

INSERT INTO db_1702.student_course
VALUES (NULL, 1, 2, NULL);

INSERT INTO db_1702.student_course
VALUES (NULL, 1, 3, NULL);

INSERT INTO db_1702.student_course
VALUES (NULL, 3, 2, NULL);
SELECT *
FROM student_course;
SHOW COLUMNS FROM db_1702.student;
SHOW COLUMNS FROM db_1702.student_course;

SELECT *
FROM db_1702.course;

DELETE FROM db_1702.course
WHERE id = 10;

DELETE FROM db_1702.student_course;

SELECT *
FROM db_1702.student;

DELETE FROM db_1702.student;