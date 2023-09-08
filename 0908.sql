--집합연산자: 합집합(union), 차집합(minus), 교집합(intersect)
--차집합 연산자 사용
-- 도서를 주문하지 않은 고객의 이름
select name from customer;

select DISTINCT custid from orders;

select name from customer
where custid in (select DISTINCT custid from orders);

select name from customer
minus
select name from customer
where custid in(select DISTINCT custid from orders);

--집합자 연산자 사용하지 않은 경우
select name from customer
where custid not in(select distinct custid from orders);

--exists: 서브쿼리의 결과가 존재하는 경우에 true
--주문이 있는 고객의 이름과 주소를 출력
-- in연산자 사용한 경우
select name, address from customer
where custid in(select DISTINCT custid from orders);

--동등조인과 중복행 제거
select distinct name, address from customer c, orders o
where c.custid=o.custid;

-- exists 사용한 경우
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
and c.name='박지성';

--1-7
select distinct bookname
from book b,orders o,customer c
where b.bookid=o.bookid
and c.custid=o.custid
and c.name!='박지성';

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

--ddl (data defination language): 데이터 정의어
-- create table/alter table/drop table
--테이블 생성 연습1
create table newbook1(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number);
    
--테이블 생성 연습2
create table newbook2(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key (bookid));
--테이블 생성 연습3    
create table newbook3(
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
    );

--bookname 컬럼:null값 가질 수 없음
--publisher 컬럼: 동일한 값을 가질 수 없음
--price 컬럼: 가격이 입력되어 있지 않으면 기본값을 10000으로 하고 입력될 때 1000초과로 함
--bookname, publisher 컬럼을 복합키로 설정

create table newbook4(
    bookname varchar2(20) not null,
    publisher varchar2(20) unique,
    price number default 10000 check ( price > 1000),
    primary key(bookname, publisher)
    );