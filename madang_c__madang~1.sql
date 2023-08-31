-- �������� Book ���̺�
create table Book(
  bookid NUMBER(2) primary key,
  bookname VARCHAR2(50),
  publisher VARCHAR2(50),
  price NUMBER(8)
);
--���Ե������� Imported_Book ���̺�
create table Imported_Book(
    bookid NUMBER(2),
    bookname VARCHAR2(50),
    publisher VARCHAR2(40),
    price NUMBER(8)
);
-- ������ Customer ���̺�
create table Customer(
    custid NUMBER(2) PRIMARY KEY,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR(20)
);
-- �ֹ����� Orders ���̺�
create table Orders(
    orderid NUMBER(2) PRIMARY KEY,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);
--Book ���̺� 10���� ���� ������ �߰��ϼ���
insert into Book values(1,'�౸�� ����','�½�����',7000);
insert into Book values(2,'�ظ����� ������ ����','����å',17000);
insert into Book values(3,'����','�س�',12000);
insert into Book values(4,' 1%�� �д� ��','����̵�',7000);
insert into Book values(5,' �Ƹ޸�ĭ ���θ��׿콺','���̾𽺺Ͻ�',16000);
insert into Book values(6,'����� ���ΰ� ����־�����','�ٻ�Ͻ�',19000);
insert into Book values(7,'���̳��� ����ħ','���̿�',21000);
insert into Book values(8,'���ϸ��� ���߷�','��ũ�ν�',13000);
--Custmer ���̺� ������ 5�� �߰�
insert into customer values(1,'������','���� ��ü����','000-5000-001');
insert into customer values(2,'�迬��','���� ���۱� �漮��','23-1415-0021');
insert into customer values(3,'��̶�','���� ��걸 ������','123-1515-0031');
insert into customer values(4,'�߽ż�','��õ ������','3432-23523-0031');
insert into customer values(5,'�ڼ���','���� ������','325-5000-001');