SELECT *
FROM scott.emp
LIMIT 3,0;  -- 查询前三条语句 后面可以不写o

SELECT *
FROM scott.emp
LIMIT 3,4;-- 相当与linit4 offset3   3是从第4条开始查询4条
-- 试用与分页  比如第一页查询几条  然后以后每页几条

SELECT *
FROM scoeett.emp-- offset 便宜  抵消  位移
LIMIT 5 OFFSET 10;-- 试用与分页  比如第一页查询几条  然后以后每页几条 5是每页几天 后面是页数除以5

SELECT *
FROM scott.emp
ORDER BY ENAME -- 查询字母开头的  必须先在排序在分页
LIMIT 3 OFFSET 0; -- 标准写法  查询前三条数据

SELECT *
FROM scott.emp
WHERE ENAME LIKE '%a%'; -- like 像 模糊匹配
-- 查询都带字母a的数据  把前面百分号去掉查询以a字母开头的数据
SELECT *
FROM scott.emp         -- 查询带百分号的必须有一个反斜线 必须转义 不再是通配符变成不同字符
WHERE ENAME NOT LIKE '%\_%' ESCAPE '\\';
-- 前两个单词是查询     单引号查询具体的 前面有百分号查询有全部字母的
INSERT INTO scott.emp (EMPNO, ENAME) VALUES (2222, 'A_ADAMS');
-- 自己写的数据         插入列  必须有主键列
-- 正则匹配30
SELECT *
FROM scott.emp
WHERE ENAME REGEXP '[^a-z]+'; -- 包含 a-z 之外的至少一个字符 查询月份-5-   2号入职的就后面加一个美元符号
-- 没有转义符号的是含有a到z的数据 就可以  有的话就是含有之外的一个就可以输出
SELECT *
FROM scott.emp
WHERE HIREDATE NOT RLIKE 'yyy';
-- 查
SELECT *
FROM scott.emp
WHERE DEPTNO NOT IN (10, 20);
-- 查询不在10 和20部门的   没有not查询10 和20部门的数据

SELECT *
FROM scott.emp
WHERE SAL BETWEEN 2000 AND 3000 ; -- 查询2000到三千工资的

SELECT *
FROM scott.emp
WHERE JOB NOT IN ('manager', 'clerk');
-- 查询普通经理和职员   like前面都可以加not  代表反的

SELECT *
FROM scott.emp
-- WHERE sal >= 2000 AND sal <=3000;
WHERE sal NOT BETWEEN 2000 AND 3000; -- [min, max]  ,min) (max,

SELECT
  ENAME '姓名',
  SAL   '基本工资' -- alias 别名\ [ˈeɪliəs]
FROM scott.emp;
-- 查询员工姓名和基本工资
SELECT e.ENAME
FROM scott.emp AS e;
-- 查询全部姓名

SELECT *
FROM scott.emp
WHERE DEPTNO IS  NULL;-- 查询没有部门的员工  加上not  查询有部门的

SELECT *
FROM scott.emp
WHERE COMM IS NULL; -- 查询没有奖金的员工

UPDATE scott.emp
SET JOB = NULL
WHERE ENAME = 'jones';-- 把谁的工作设置为空

SELECT ENAME,
  sal + ifnull(COMM, 0)-- ifnull  函数有两个参数   函数的意义  如果第一个值为空取第二个
FROM scott.emp;
