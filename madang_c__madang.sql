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
                        where bookname like '축구의 역사';

select * from customer
                where name='김연아';

--book테이블에서 도서명과 가격을 검색하시오.
select bookname, price from book;
--book테이블에서 가격과 도서명을 검색하시오.
select price, bookname from book;
--book테이블에서 도서번호, 도서명, 출판사, 가격을 검색하시오.
select * from book;
--book테이블에서 모든 출판사를 검색하시오.
select publisher FROM book;
--book테이블에서 모든 출판사를 검색하시오(중복제거).
select distinct publisher from book;

--book테이블에서 가격이 15000원 미만인 도서를 검색하시오.
select * from book
        where price < 15000;
--book테이블에서 가격이 10000원 이상 15000 미만인 도서를 검색하시오.
select * from book
        where price between 10000 and 15000;
        
--book테이블에서 가격이 10000원 이상 15000 미만인 도서를 검색하시오.
--between 사용 금지
select * from book
        where price >= 10000 and  price <= 15000;