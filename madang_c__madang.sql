insert into orders values (1, 1, 1, 6000, TO_DATE('2023-01-10', 'yyyy-mm-dd'));
insert into orders values (2, 1, 3, 21000, TO_DATE('2023-03-15', 'yyyy-mm-dd'));
insert into orders values (3, 2, 7, 8000, TO_DATE('2022-11-07', 'yyyy-mm-dd'));
insert into orders values (4, 3, 6, 6000, TO_DATE('2023-07-12', 'yyyy-mm-dd'));
insert into orders values (5, 4, 7, 20000, TO_DATE('2023-07-07', 'yyyy-mm-dd'));
insert into orders values (6, 1, 2, 12000, TO_DATE('2023-11-14', 'yyyy-mm-dd'));
insert into orders values (7, 4, 8, 13000, TO_DATE('2023-08-28', 'yyyy-mm-dd'));
insert into orders values (8, 3, 10, 12000, TO_DATE('2023-08-04', 'yyyy-mm-dd'));
insert into orders values (9, 2, 10, 7000, TO_DATE('2022-10-29', 'yyyy-mm-dd'));
insert into orders values (10, 3, 8, 13000, TO_DATE('2022-10-04', 'yyyy-mm-dd'));

insert into imported_book VALUES(21, 'Zen Golf', 'Person', 12000);
insert into imported_book VALUES(22, 'Sccoer Skills', 'Human Kineics', 15000);


select publisher, price from book
                        where bookname like '�౸�� ����';

select * from customer
                where name='�迬��';

--book���̺��� ������� ������ �˻��Ͻÿ�.
select bookname, price from book;
--book���̺��� ���ݰ� �������� �˻��Ͻÿ�.
select price, bookname from book;
--book���̺��� ������ȣ, ������, ���ǻ�, ������ �˻��Ͻÿ�.
select * from book;
--book���̺��� ��� ���ǻ縦 �˻��Ͻÿ�.
select publisher FROM book;
--book���̺��� ��� ���ǻ縦 �˻��Ͻÿ�(�ߺ�����).
select distinct publisher from book;

--book���̺��� ������ 15000�� �̸��� ������ �˻��Ͻÿ�.
select * from book
        where price < 15000;
--book���̺��� ������ 10000�� �̻� 15000 �̸��� ������ �˻��Ͻÿ�.
select * from book
        where price between 10000 and 15000;
        
--book���̺��� ������ 10000�� �̻� 15000 �̸��� ������ �˻��Ͻÿ�.
--between ��� ����
select * from book
        where price >= 10000 and  price <= 15000;