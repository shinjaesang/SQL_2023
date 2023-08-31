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
        
--book테이블에서 출판사가 굿스포츠, 해냄, 웅진지식하우스인 도서를 검새하시오.
--단 in 연산자를 사용하시오.
select * from book
        where publisher in('굿스포츠', '해냄', '웅진지식하우스');
        
--book테이블에서 출판사가 굿스포츠, 해냄, 웅진지식하우스인 도서를 검새하시오.
--단 in 연산자를 사용하지 마시오(비교연산자와 or 연산자 사용).
select * from book
        where publisher='굿스포츠' or publisher='해냄' or publisher='비즈니스북스';
        
select * from book
        where publisher<>'굿스포츠' and publisher<>'해냄' and  publisher<>'웅진지식하우스';


--book테이블에서 도서명에 축구의 역사를 검색하시오.
select * from book
        where bookname='축구의 역사';
        
select * from book
        where bookname like '축구의 역사';
--book테이블에서 도서명에 축구라는 문자열이 포함된 행을 검색하시오.
select * from book
        where bookname like '%축구%';
        
--book테이블에서 도서명에 과학이라는 문자열이 포함된 행을 검색하시오.
select * from book
        where bookname like '%과학%';
        
--book테이블에서 도서명에 과학이라는 문자열로 끝나는 행을 검색하시오.
select * from book
        where bookname like '%과학';
        
--book테이블에서 도서명에 '의'자 앞에 임의의 3글자가 포함된 문자열을 갖는 행을 검색하시오.
select * from book
        where bookname like '___의';