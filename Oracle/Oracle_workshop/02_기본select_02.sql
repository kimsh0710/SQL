-- 01. 2001 �⿡ ���� �� ���а� �л��� �� ������ �л����� ��ȸ�Ͻÿ�.
-- ���а� �ڵ�� TB_DEPARTMENT ���� �˻��Ѵ�. (join ��� x)

SELECT count(student_no) as �л���
from tb_student 
where (department_no = (select department_no from tb_department where department_name = '���а�'))
and EXTRACT(YEAR from ENTRANCE_DATE ) = 2001;

-- *** EXTRACT(YEAR from ENTRANCE_DATE) : date���� ���� �÷����� year ���� ����

-- 02. �迭�� �����С��� �а� �� ���������� 20 �̻�, 30 ������ �а��� �迭, �а��̸�, 
-- ������ ��ȸ�Ͻÿ�. �� �а��̸��� �������� �������� �����Ͻÿ�.

SELECT category as �迭, department_name as �а��̸�, CAPACITY as ����
from tb_department
where (category='����') and (CAPACITY between 20 and 30)
ORDER BY department_name;

-- 03. '��'�ڰ� �� �迭�� �Ҽ� �а��� �� �� �ִ��� �迭, �а����� ����Ͻÿ�.
-- �� �а����� ���� ������ �����Ͻÿ�. (group by �̿�)

select category as �迭, count(*) as �а���
from tb_department
where category like '%��%'
GROUP BY category
order by count(*) DESC;

-- 04. . ��������а��� �����̸�, ����⵵, �ּҸ� ��ȸ�ϰ� ���̰� ���� ������ �����Ͻÿ�.
-- ������а� �ڵ�� TB_DEPARTMENT ���� �˻��Ѵ�. (Join �� ������� �ʴ´�.)

SELECT PROFESSOR_NAME as �����̸�, substr(PROFESSOR_SSN,1,2) as ����⵵, PROFESSOR_ADDRESS as �ּ�
from tb_professor
where department_no = (SELECT department_no from tb_department where department_name = '������а�')
order by 2;

-- 05. ������а� �л� �� ���￡ �����ϴ� �л��� �а���ȣ, �л��̸�, ���п��θ� ��ȸ�ϰ�
-- �л��̸����� �������� �����Ͻÿ�. �� ���п��δ� ���� ��Y���̸� �����С����� ��N���̸�
-- ���������� ����Ѵ�. ������а� �ڵ�� TB_DEPARTMENT ���� ã�´�.
-- (Join �� ��������ʴ´�) ( decode �Լ� �̿�)

select department_no as �а���ȣ, student_name as �л��̸�, 
decode(ABSENCE_YN,'Y','����','N','����') as ���п���
from tb_student
WHERE (department_no = (select department_no from tb_department where department_name = '������а�'))
and STUDENT_ADDRESS like '����%';





