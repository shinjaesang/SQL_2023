
--5-1
SELECT custid, (select address
                from customer cs
                where cs.custid=od.custid)"addess",
                     sum(saleprice)"total"
from orders od
group by od.custid;

--5-2 주문을 한 고객별 이름, 평균 구매가격을 구하시오
select cs.name, s
from (select custid, avg(saleprice)s
      FROM orders
      group by custid) od, customer cs
where cs.custid = od.custid;

--5-3 고객번호가 3보다 작은 고객의 판매금액의 합계를 구하시오
select sum(saleprice)"total"
from orders od
where exists (select *
              from customer cs
              where custid <= 3 and cs.custid = od.custid);



--책 이름에 과학이라는 단어가 포함된 결과행을 출력하시오
select * from book
where bookname like '%과학%';

create view v_book
as select * from book
where bookname like '%과학%';

--주소에 서울이라는 단어가 포함된 뷰를 생성하시오
select * from customer
where address like '%서울%';

create view vw_customer
as select * from customer
where address like '%서울%';

select * from vw_customer;

--주문체이블에서 고객이름, 도서 이름을 바로 확인할 수 있는 뷰를 생성한 후, 
-- 김연아 고객이 구입한 도서의 주문번호, 도서명, 주문액을 출력하시오

create view vw_orders(orderid, name, custid, bookid, bookname, saleprice, orderdate)
as select o.orderid,c.name, o.custid, o.bookid, b.bookname, o.saleprice, o.orderdate
    from orders o, customer c, book b
    where o.custid = c.custid and o.bookid = b.bookid;
    
select * from vw_orders;

select orderid, bookname, saleprice
from vw_orders
where name='김연아';

create or replace view vw_custome(custid, name, address)
as select custid, name, address
from customer
where address like '%영국%';

select * from customer;

select * from vw_customer;

--뷰 삭제
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
    

exec insertbook(13, '스포츠과학','마당과학서적', 25000);


exec insertupdate(11,'스포츠즐거움','마당과학서적', 30000);
exec insertupdate(11,'스포츠즐거움','마당과학서적', 20000);

set serverout on;
declare 
    averageVal number;
begin
    averagePrice(averageVal);
    dbms_output.put_line('도서평균가격 : ' ||averageVal);
end;

