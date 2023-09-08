--���տ�����: ������(union), ������(minus), ������(intersect)
--������ ������ ���
-- ������ �ֹ����� ���� ���� �̸�
select name from customer;

select DISTINCT custid from orders;

select name from customer
where custid in (select DISTINCT custid from orders);

select name from customer
minus
select name from customer
where custid in(select DISTINCT custid from orders);

--������ ������ ������� ���� ���
select name from customer
where custid not in(select distinct custid from orders);

--exists: ���������� ����� �����ϴ� ��쿡 true
--�ֹ��� �ִ� ���� �̸��� �ּҸ� ���
-- in������ ����� ���
select name, address from customer
where custid in(select DISTINCT custid from orders);

--�������ΰ� �ߺ��� ����
select distinct name, address from customer c, orders o
where c.custid=o.custid;

-- exists ����� ���
select distinct name, address from customer c, orders o
where exists (select * from orders o
                        where c.custid=o.custid);
                       
-- 1-5
select count(publisher)
FROM book b, orders o
WHERE b.bookid = o.bookid
AND o.custid = 1;

--1-6
select bookname,price,price-saleprice
from book b,orders o,customer c
where b.bookid=o.bookid
and o.custid=c.custid
and c.name='������';

--1-7
select distinct bookname
from book b,orders o,customer c
where b.bookid=o.bookid
and c.custid=o.custid
and c.name!='������';

--2-8
select name
from customer c
where not exists(
    select *
    from orders o
    where c.custid=o.custid);


--2-9
select sum(saleprice),avg(saleprice)
from orders;

--2-10
select name, sum(saleprice)
from customer c,orders o
where c.custid=o.custid
group by name;

--2-11
select name, bookname
from book b, customer c, orders o
where b.bookid=o.bookid
and c.custid=o.custid;

--2-12
select *
from book b, orders o 
where b.bookid=o.bookid
and price-saleprice=(select max(price-saleprice)
from book b, orders o
where b.bookid=o.bookid);

--2-13
select name
from customer c, orders o
where c.custid=o.custid
group by name having avg(saleprice)>(select avg(saleprice)
from orders);

--ddl (data defination language): ������ ���Ǿ�
-- create table/alter table/drop table
--���̺� ���� ����1
create table newbook1(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number);
    
--���̺� ���� ����2
create table newbook2(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key (bookid));
--���̺� ���� ����3    
create table newbook3(
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
    );

--bookname �÷�:null�� ���� �� ����
--publisher �÷�: ������ ���� ���� �� ����
--price �÷�: ������ �ԷµǾ� ���� ������ �⺻���� 10000���� �ϰ� �Էµ� �� 1000�ʰ��� ��
--bookname, publisher �÷��� ����Ű�� ����

create table newbook4(
    bookname varchar2(20) not null,
    publisher varchar2(20) unique,
    price number default 10000 check ( price > 1000),
    primary key(bookname, publisher)
    );