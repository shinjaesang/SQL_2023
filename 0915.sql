--DDL(Data Defination language): ������ ���Ǿ�

--������(newcustomer ���̺�)
--custid(�⺻Ű), name, address, phone
create table newcustomer(
    custid number primary key,
    name VARCHAR2(40),
    address VARCHAR2(40),
    phone varchar2(30)
    
);
--�ֹ�����(neworders ���̺�)
--oderid(�⺻Ű), custid(not null, customer custid �����ؼ� �ܷ�Ű, �������)
--bookid(not null, newbook1 bookid �����ؼ� �ܷ�Ű, �������)
--saleprice
--orderdate(date��)
create table neworders(
    orderid NUMBER PRIMARY key,
    custid NUMBER not null,
    bookid NUMBER not null,
    saleprice number,
    orderdate date,
    foreign key(custid) REFERENCES newcustomer(custid) on DELETE CASCADE,
    foreign key(bookid) REFERENCES newbook3(bookid) on DELETE CASCADE
);

--alter ��
--�̹� ������ ���̺��� ������ ������ �� ���
-- add(�߰�), drop(����), miudfy(����)

--������  newbook1 ���̺� �����ϰ� �� ���̺� �ڼ�
create table newbook1(
    bookid number,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price number
    );
    
-- isbn�÷��߰�
alter table newbook1
add isbn VARCHAR2(13);
--isbn�÷��� �ڿ��� ����
alter table newbook1
MODIFY isbn number;

--isbn �÷� ����
alter table newbook1 drop COLUMN isbn;

--bookname �÷��� varchar2(30) not null �������� ����
alter table newbook1
MODIFY bookname varchar(30) not null;

--bookid �÷��� not null ��������
alter table newbook1
MODIFY bookid number not null;
-- bookid �÷��� �⺻Ű �߰�
alter table newbook1
add PRIMARY KEY(bookid);

--���̺� ����
drop table newbook1;

--DML(select, insert(�����ͻ���), update(�����ͼ���), delete(�����ͻ���))
-- insert 1��  : �Ӽ�(�÷�)����Ʈ ����
 insert into book
 VALUES(11, '����', '�س�', 12000);
 
 --insert 2��: �Ӽ�(�÷�)����Ʈ ���
insert into book(bookid, bookname, publisher, price)
VALUES(12, '���ӿ���������', '����å', 8000);

 --insert 3��: �÷��� ������ ����
insert into book(bookid, price, publisher, bookname)
VALUES(13, 28000, '���ڳ���', '���� ����');

 --insert 4��: Ư�� �÷��� ���� ����
insert into book(bookid, price, bookname)
VALUES(14, 10000, '��ħ ���');

--���̺����� ���� �ٸ� ���̺��� �������� �����ϴ� ���
insert into book(bookid, bookname, price, publisher)
select bookid, bookname, price, publisher
from imported_book;

-- update : ������ ����
-- ����ȣ�� 5���� ���� �ּҸ� ���ѹα� �λ����� ����
select * from customer;
update customer
set address = '���ѹα� �λ�'
where custid = 5;

--�ڼ��� �����ּҸ� �迬�� ���� �ּҿ� �����ϰ� ����
update customer
set address=(select address
             from customer
             where name='�迬��')
where name='�ڼ���';

--�ڼ��� ���� ��ȭ��ȣ�� �迬�� ���� ��ȭ��ȣ�� �����ϰ� ����
update customer
set phone=(select phone
             from customer
             where name='�迬��')
where name='�ڼ���';

--��� ���� �����Ͻÿ�
delete from customer;

select * from orders;
select * from customer;

--�ڼ��� ���� �����Ͻÿ�
delete from customer
where name='�ڼ���';

rollback;
commit;
