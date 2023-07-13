-- 1. �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭"���� ǥ��

select DEPARTMENT_NAME, CATEGORY
FROM tb_department;

-- 2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 ����Ѵ�.
-- �а��� ����
-- --------------------------------------------------
-- ������а��� ������ 20�� �Դϴ�.
-- ������а��� ������ 36�� �Դϴ�.
-- ...

SELECT department_name ||'�� ������'||capacity||'�� �Դϴ�.' as "�а��� ����"
FROM tb_department;

-- "������а�"�� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û�� ���Դ�.
-- �����ΰ�? (�����а��� '�а��ڵ�'�� �а� ���̺�(tb_department)�� ��ȸ

SELECT DEPARTMENT_NO
FROM tb_department
where department_name = '������а�'; --001

SELECT STUDENT_NAME
FROM tb_student
WHERE absence_yn = 'Y' and department_no = 001 
and substr(student_ssn,8,1)=2;

-- 4. ���������� ���� ���� ��� ��ü�ڵ��� ã�� �̸��� �Խ��ϰ��� �Ѵ�.
-- �� ����ڵ��� �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.

SELECT student_name
from tb_student
WHERE student_no in ('A513079','A513090','A513091','A513110','A513119');

-- 5. ���� ������ 20�� �̻� 30�� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
select department_name, category
from tb_department
WHERE capacity BETWEEN 20 and 30;

-- 6. �� ������б��� ������ �����ϰ�� ��� �������� �Ҽ� �а��� ������ �ִ�.
-- �׷� �� ������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ���夷�� �ۼ��Ͻÿ�.

SELECT PROFESSOR_NAME
FROM tb_professor
WHERE department_no is NULL;

-- 7. ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� �Ѵ�.
-- ��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�.

SELECT student_name
from tb_student
where DEPARTMENT_NO is null;

-- 8. ������û�� �Ϸ��� �Ѵ�. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ� �������
-- � �������� �����ȣ�� ��ȸ�غ��ÿ�.

SELECT CLASS_NO
FROM tb_class
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- 9.�� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�Ͻÿ�.
-- *** DISTINCT : ������ �÷��� � ������ �ִ��� �ߺ����� ������ ***

SELECT DISTINCT CATEGORY
FROM tb_department;

-- 10. 02�й� ���� �����ڵ��� ������ ������� �Ѵ�.
-- ������ ������� ������ �������� �л����� �й�, �̸�, �ֹι�ȣ�� ����϶�.

SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM tb_student
WHERE (substr(ENTRANCE_DATE,1,2)='02') AND (absence_yn = 'N')
AND student_address LIKE '����%';




