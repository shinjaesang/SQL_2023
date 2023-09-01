select * from book;
--book테이블에서 과학이라는 문자열을 포함하고 도서 가격이 15000원 이상인 데이터 행을 검색
select * from book
        where bookname like '%과학%' and price >= 15000;
        
        
--book테이블에서 출판사가 굿스포츠 또는 어크로스인 도서를 검색
select * from book
        where publisher='굿스포츠' or publisher='어크로스';
        
--위의 문제를 in 연산자를 사용하여 수정
select * from book
        where publisher in('굿스포츠', '어크로스');
        
--book테이블에서 도서명순으로 검색
select * from book order by bookname;

--book테이블에서 도서번호 순으로 검색
select * from book order by bookid;

--book테이블에서 가격순으로 검색, 가격이 같으면 이름순으로 검색
select * from book order by price, bookname;

--book테이블에서 가격 내림차순으로 검색, 가격이 같으면 이름을 출판사는 오름차순으로 검색
select * from book order by price desc,  publisher;

select * from orders;
--orders 테이블에서 고객이 주문한 도서의 총 판매액 구하기
--집계함수 사용(합계 : sum)
select sum(saleprice) as 총판매금액 from orders;

--orders 테이블에서 고객번호가 1인 고객이 주문한 도서의 총판매액을 구하시오
select sum(saleprice) as 총판매금액 from orders
                                    where custid=1;

--orders 테이블에서 판매액의 합계, 평균, 최소값, 최대값을구하시오
select sum(saleprice) as 총판매금액,
    avg(saleprice) as 판매액평균,
    avg(saleprice) as 최저가격,
    avg(saleprice) as 최대가격
from orders;

select * from orders;
--orders 테이블에서 판매한 도서의 개수를 구하시오
select count(*) from orders;
--orders 테이블에서 도서가격이 13000원이상인 도서의 개수
select count(*) from orders where saleprice >= 13000;
--orders 테이블에서 고객번호가 1 또는 3인 고객의 주문 개수
select count(*) from orders where custid in (1,3);

--orders 테이블에서 고객별주문한 도서의 개수와 총합계를 구하시오
--그룹화(부분합) : group by
select count(*) 주문수량, sum(saleprice) 주문총액 
from orders
group by custid
order by custid;


----orders 테이블에서 판매가격이 8000원 이상인 도서를 구매한 고객에 대해 고객별 부문 도서의 총 수량
select custid, count(*) as 도서수량 from orders
where saleprice>=8000
group by custid
having count(*) >= 2
order by custid;
--1-1
select bookname from book where bookid=1;
--1-2
select bookname from book where price>=11000;
--1-3
select sum(saleprice) as 총구매액 from orders where custid=1;

--1-4
select count(*) from orders where custid=1;

-- 2-1
select count(bookname) as 총도서수량 from book;
--2-2
select count(publisher) as 총출판사 from book ;
--2-3
select name, address from customer ;
--2-4
select orderid from orders where orderdate >='23/01/01';
--2-5
select orderid from orders where orderdate <'23/01/01';
--2-6
select name, address from customer
        where name like '김%';
--2-7
select name, address from customer
        where name like '김_아';