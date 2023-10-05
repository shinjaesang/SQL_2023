
--5-1
SELECT custid, (select address
                from customer cs
                where cs.custid=od.custid)"addess",
                     sum(saleprice)"total"
from orders od
group by od.custid;

--5-2 �ֹ��� �� ���� �̸�, ��� ���Ű����� ���Ͻÿ�
select cs.name, s
from (select custid, avg(saleprice)s
      FROM orders
      group by custid) od, customer cs
where cs.custid = od.custid;

--5-3 ����ȣ�� 3���� ���� ���� �Ǹűݾ��� �հ踦 ���Ͻÿ�
select sum(saleprice)"total"
from orders od
where exists (select *
              from customer cs
              where custid <= 3 and cs.custid = od.custid);



--å �̸��� �����̶�� �ܾ ���Ե� ������� ����Ͻÿ�
select * from book
where bookname like '%����%';

create view v_book
as select * from book
where bookname like '%����%';

--�ּҿ� �����̶�� �ܾ ���Ե� �並 �����Ͻÿ�
select * from customer
where address like '%����%';

create view vw_customer
as select * from customer
where address like '%����%';

select * from vw_customer;

--�ֹ�ü�̺��� ���̸�, ���� �̸��� �ٷ� Ȯ���� �� �ִ� �並 ������ ��, 
-- �迬�� ���� ������ ������ �ֹ���ȣ, ������, �ֹ����� ����Ͻÿ�

create view vw_orders(orderid, name, custid, bookid, bookname, saleprice, orderdate)
as select o.orderid,c.name, o.custid, o.bookid, b.bookname, o.saleprice, o.orderdate
    from orders o, customer c, book b
    where o.custid = c.custid and o.bookid = b.bookid;
    
select * from vw_orders;

select orderid, bookname, saleprice
from vw_orders
where name='�迬��';

create or replace view vw_custome(custid, name, address)
as select custid, name, address
from customer
where address like '%����%';

select * from customer;

select * from vw_customer;

--�� ����
DROP; 

--8-1
create view highorders
as select o.bookid, b.bookname, c.name, b.publisher, o.saleprice
    from customer c, orders o, book b
    where c.custid = o.custid and o.bookid = b.bookid and saleprice >= 20000;
    
    
--8-2
select bookname, name
from highorders;

--8-3
create or replace view highorders
as select o.bookid, b.bookname, c.name, b.publisher
    from customer c, orders o, book b
    where c.custid=o.custid and o.bookid=b.bookid and saleprice >=20000;
    

exec insertbook(13, '����������','������м���', 25000);


exec insertupdate(11,'��������ſ�','������м���', 30000);
exec insertupdate(11,'��������ſ�','������м���', 20000);

set serverout on;
declare 
    averageVal number;
begin
    averagePrice(averageVal);
    dbms_output.put_line('������հ��� : ' ||averageVal);
end;

