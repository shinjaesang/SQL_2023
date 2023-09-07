--��������(Equi Join)
--�������� ���̺��� ������ �� Ư�� �÷��� ���� ���� ��鸸 �˻��� �� ���

--���� ���� �ֹ��� ���� �����͸� ��� ����Ͻÿ�
select * from customer, orders
where customer.custid = orders.custid;

--���� ���� �ֹ��� ���� �����͸� ��� ����ȣ ������������ ���
select * from customer, orders
where customer.custid = orders.custid
order by customer.custid DESC;

--���� �̸�, �ֹ��� ���� �ʸŰ����� �˻��Ͻÿ�
select name, saleprice from customer c, orders o
where c.custid = o.custid;

-- ������ �ֹ��� ��� ������ ���Ǹž��� ���ϰ� ������ ����
select name, SUM(saleprice)
from customer, orders
where customer.custid = orders.custid
group by customer.name
order by customer.name;

--���� �̸��� �ֹ��� �������̸��� ���Ͻÿ�
-- 3���� ���̺� ���� ��������
select name, bookname from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid
order by name;

--���� ������ 16000���� ������ �ֹ��� ���̸��� �����̸��� ���
select name, bookname 
from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid and price>=10000;

-- �ܺ�����(Outer Join)
-- ���������� �ϰԵǸ� ���� �������� ���� ���� ���õ����� �ܺ������� �ϰԵǸ� ������ �Ǵ� ���̺��� ���� �������� ���� ������ �൵ �����ؼ� ������ش�
-- ������ �������� ���� ���� �����Ͽ� ���̸��� �ֹ��� ������ �ǸŰ����� ����Ͻÿ�
select name, saleprice 
from customer c left OUTER join orders o
on c.custid = o.custid;


--Sub Query(�μ�����)
-- Main Query ���� �ִ� Query


--���������� ���� ��� ����
select max(price) from book;
--�����̸�
select bookname from book;
--���� ������ ���� ��� �����̸��� ����Ͻÿ�
select bookname from book
where price=(select max(price) from book);

--���� ������ ���� �� �����̸� ������ ����Ͻÿ�
select bookname,price from book
where price=(select min(price) from book);

--������ ������ ���� �ִ� ���� �̸��� �˻�
select name
from customer
where custid in (select custid from orders);

--sub query : �ֹ��� ���� �ִ� ����ȣ��
select distinct custid from orders;

--���������Ͽ콺���� ������ ������ ������ ���� �̸��� ���
select name
from customer;
select bookid, bookname
from book
where publisher='���������Ͽ콺';

--������ ������ ����� ����ȣ
select DISTINCT custid from orders;

select name from customer
where custid in (select DISTINCT custid from orders
                 where bookid in (select bookid from book
                                  where publisher='���������Ͽ콺'));

SELECT name
FROM customer c, orders o, book b
WHERE o.bookid = b.bookid and c.custid = o.custid and b.publisher = '���������Ͽ콺';