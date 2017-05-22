SHOW DATABASES;
CREATE DATABASE db_exam;

SELECT *
 FROM db_exam.student;

CREATE TABLE db_exam.student(
  id     INT     AUTO_INCREMENT PRIMARY KEY COMMENT ' ID PK',
  name  VARCHAR(255)COMMENT '姓名',
  age    INT UNSIGNED COMMENT '年龄',
  gender CHAR(2) DEFAULT '男' COMMENT '性别',
  dob    DATE COMMENT '出生日期',
  departmentId VARCHAR(255)COMMENT '部门'
)COMMENT '学生表';
CREATE TABLE db_exam.department(
  id     INT     AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255)COMMENT '系名称',
  tel     INT  COMMENT '电话号码'
)COMMENT '系别表';
CREATE TABLE db_exam.course(
  id     INT     AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255)COMMENT '课程名称',
  credit INT UNSIGNED COMMENT '学分'
)COMMENT '课程表';
CREATE TABLE db_exam.student_course(
  id   INT  AUTO_INCREMENT PRIMARY KEY ,
  studentId INT COMMENT 'FK',
  departmentId INT  COMMENT 'FK',
  grade INT COMMENT '考试成绩'
)COMMENT '选课表';

-- 为存在的关联的表追加合理的外键
ALTER TABLE db_exam.student
    ADD CONSTRAINT
fk_student_departmentId
FOREIGN KEY (departmentId)
  REFERENCES db_exam.department(id);
ALTER TABLE db_exam.student_course
    ADD CONSTRAINT
fk_student_course_studentId
FOREIGN KEY (studentId)
  REFERENCES db_exam.student(id);
ALTER TABLE db_exam.student_course
    ADD CONSTRAINT
fk_student_course_courseId
FOREIGN KEY (courseId)
  REFERENCES  db_exam.course(id);
DROP TABLE db_exam.course;
DROP TABLE db_exam.student;
DROP TABLE db_exam.department;
DROP TABLE db_exam.student_course;
DROP DATABASE db_exam;
