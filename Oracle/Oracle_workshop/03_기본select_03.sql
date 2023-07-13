-- 06. 80 ����� ���л� �� ���� ���衯���� �л��� �ֹι�ȣ, �л��̸��� ��ȸ�Ͻÿ�.
-- �� �л��̸����� �������� �����Ͻÿ�.

select '['||substr(STUDENT_SSN,1,8)||'*******]' as �ֹι�ȣ, student_name as �̸�
from tb_student
where substr(student_ssn,1,1) = '8' and  student_name like '��%' and
substr(STUDENT_SSN,8,1) = '2'
order by 2;

-- 07. �迭�� ����ü�ɡ��� �а��� ������ �������� 40 �̻��̸� ���밭�ǽǡ� 30 �̻��̸� ���߰��ǽǡ� 
-- �������� ���Ұ��ǽǡ��� ����Ѵ�. ��, ������ ���� ������ ���� �Ѵ�.

select department_name as �а��̸�, CAPACITY as ����,
case
when CAPACITY >= 40 then '�밭�ǽ�'
when CAPACITY >=30 then '�߰��ǽ�'
else '�Ұ��ǽ�'
END as ���ǽ�ũ��
from tb_department
where CATEGORY = '��ü��'
order by 2 DESC;

-- 08. 2005��1��1�Ϻ��� 2006��12��31�ϱ����� �Ⱓ�� ������ �л� �� �ּҰ� ��ϵ��� ����
-- ���л��� �а���ȣ, �л��̸�, ����������ȣ, ���г⵵�� ��ȸ�Ͻÿ�.
-- ���г⵵�� �������� �������� �����Ѵ�.

select department_no as �а���ȣ, student_name as �л��̸�, 
COACH_PROFESSOR_NO as ����������ȣ, extract(year from ENTRANCE_DATE)||'��' as ���г⵵
from tb_student
where extract(year from ENTRANCE_DATE) in (2005,2006) and
STUDENT_ADDRESS is null and
STUDENT_SSN like '_______1%'
order by 4;