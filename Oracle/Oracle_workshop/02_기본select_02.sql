-- 01. 2001 년에 입학 한 사학과 학생이 몇 명인지 학생수를 조회하시오.
-- 사학과 코드는 TB_DEPARTMENT 에서 검색한다. (join 사용 x)

SELECT count(student_no) as 학생수
from tb_student 
where (department_no = (select department_no from tb_department where department_name = '사학과'))
and EXTRACT(YEAR from ENTRANCE_DATE ) = 2001;

-- *** EXTRACT(YEAR from ENTRANCE_DATE) : date값을 가진 컬럼에서 year 값만 추출

-- 02. 계열이 ‘공학’인 학과 중 입학정원이 20 이상, 30 이하인 학과의 계열, 학과이름, 
-- 정원을 조회하시오. 단 학과이름을 기준으로 오름차순 정렬하시오.

SELECT category as 계열, department_name as 학과이름, CAPACITY as 정원
from tb_department
where (category='공학') and (CAPACITY between 20 and 30)
ORDER BY department_name;

-- 03. '학'자가 들어간 계열의 소속 학과가 몇 개 있는지 계열, 학과수를 출력하시오.
-- 단 학과수가 많은 순으로 정렬하시오. (group by 이용)

select category as 계열, count(*) as 학과수
from tb_department
where category like '%학%'
GROUP BY category
order by count(*) DESC;

-- 04. . ‘영어영문학과’ 교수이름, 출생년도, 주소를 조회하고 나이가 많은 순으로 정렬하시오.
-- 영어영문학과 코드는 TB_DEPARTMENT 에서 검색한다. (Join 을 사용하지 않는다.)

SELECT PROFESSOR_NAME as 교수이름, substr(PROFESSOR_SSN,1,2) as 출생년도, PROFESSOR_ADDRESS as 주소
from tb_professor
where department_no = (SELECT department_no from tb_department where department_name = '영어영문학과')
order by 2;

-- 05. 국어국문학과 학생 중 서울에 거주하는 학생의 학과번호, 학생이름, 휴학여부를 조회하고
-- 학생이름으로 오름차순 정렬하시오. 단 휴학여부는 값이 ‘Y’이면 ‘휴학’으로 ‘N’이면
-- ‘정상’으로 출력한다. 국어국문학과 코드는 TB_DEPARTMENT 에서 찾는다.
-- (Join 을 사용하지않는다) ( decode 함수 이용)

select department_no as 학과번호, student_name as 학생이름, 
decode(ABSENCE_YN,'Y','휴학','N','정상') as 휴학여부
from tb_student
WHERE (department_no = (select department_no from tb_department where department_name = '국어국문학과'))
and STUDENT_ADDRESS like '서울%';





