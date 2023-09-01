select * from book;
--book���̺��� �����̶�� ���ڿ��� �����ϰ� ���� ������ 15000�� �̻��� ������ ���� �˻�
select * from book
        where bookname like '%����%' and price >= 15000;
        
        
--book���̺��� ���ǻ簡 �½����� �Ǵ� ��ũ�ν��� ������ �˻�
select * from book
        where publisher='�½�����' or publisher='��ũ�ν�';
        
--���� ������ in �����ڸ� ����Ͽ� ����
select * from book
        where publisher in('�½�����', '��ũ�ν�');
        
--book���̺��� ����������� �˻�
select * from book order by bookname;

--book���̺��� ������ȣ ������ �˻�
select * from book order by bookid;

--book���̺��� ���ݼ����� �˻�, ������ ������ �̸������� �˻�
select * from book order by price, bookname;

--book���̺��� ���� ������������ �˻�, ������ ������ �̸��� ���ǻ�� ������������ �˻�
select * from book order by price desc,  publisher;

select * from orders;
--orders ���̺��� ���� �ֹ��� ������ �� �Ǹž� ���ϱ�
--�����Լ� ���(�հ� : sum)
select sum(saleprice) as ���Ǹűݾ� from orders;

--orders ���̺��� ����ȣ�� 1�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�
select sum(saleprice) as ���Ǹűݾ� from orders
                                    where custid=1;

--orders ���̺��� �Ǹž��� �հ�, ���, �ּҰ�, �ִ밪�����Ͻÿ�
select sum(saleprice) as ���Ǹűݾ�,
    avg(saleprice) as �Ǹž����,
    avg(saleprice) as ��������,
    avg(saleprice) as �ִ밡��
from orders;

select * from orders;
--orders ���̺��� �Ǹ��� ������ ������ ���Ͻÿ�
select count(*) from orders;
--orders ���̺��� ���������� 13000���̻��� ������ ����
select count(*) from orders where saleprice >= 13000;
--orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ����
select count(*) from orders where custid in (1,3);

--orders ���̺��� �����ֹ��� ������ ������ ���հ踦 ���Ͻÿ�
--�׷�ȭ(�κ���) : group by
select count(*) �ֹ�����, sum(saleprice) �ֹ��Ѿ� 
from orders
group by custid
order by custid;


----orders ���̺��� �ǸŰ����� 8000�� �̻��� ������ ������ ���� ���� ���� �ι� ������ �� ����
select custid, count(*) as �������� from orders
where saleprice>=8000
group by custid
having count(*) >= 2
order by custid;
--1-1
select bookname from book where bookid=1;
--1-2
select bookname from book where price>=11000;
--1-3
select sum(saleprice) as �ѱ��ž� from orders where custid=1;

--1-4
select count(*) from orders where custid=1;

-- 2-1
select count(bookname) as �ѵ������� from book;
--2-2
select count(publisher) as �����ǻ� from book ;
--2-3
select name, address from customer ;
--2-4
select orderid from orders where orderdate >='23/01/01';
--2-5
select orderid from orders where orderdate <'23/01/01';
--2-6
select name, address from customer
        where name like '��%';
--2-7
select name, address from customer
        where name like '��_��';