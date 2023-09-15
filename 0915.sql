--DDL(Data Defination language): 데이터 정의어

--고객정보(newcustomer 테이블)
--custid(기본키), name, address, phone
create table newcustomer(
    custid number primary key,
    name VARCHAR2(40),
    address VARCHAR2(40),
    phone varchar2(30)
    
);
--주문정보(neworders 테이블)
--oderid(기본키), custid(not null, customer custid 참조해서 외래키, 연쇄삭제)
--bookid(not null, newbook1 bookid 참조해서 외래키, 연쇄삭제)
--saleprice
--orderdate(date형)
create table neworders(
    orderid NUMBER PRIMARY key,
    custid NUMBER not null,
    bookid NUMBER not null,
    saleprice number,
    orderdate date,
    foreign key(custid) REFERENCES newcustomer(custid) on DELETE CASCADE,
    foreign key(bookid) REFERENCES newbook3(bookid) on DELETE CASCADE
);

--alter 문
--이미 생성된 테이블의 구조를 변경할 때 사용
-- add(추가), drop(삭제), miudfy(수정)

--기존의  newbook1 테이블 삭제하고 새 테이블 자성
create table newbook1(
    bookid number,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price number
    );
    
-- isbn컬럼추가
alter table newbook1
add isbn VARCHAR2(13);
--isbn컬럼의 자요형 변경
alter table newbook1
MODIFY isbn number;

--isbn 컬럼 삭제
alter table newbook1 drop COLUMN isbn;

--bookname 컬럼의 varchar2(30) not null 제약조건 변경
alter table newbook1
MODIFY bookname varchar(30) not null;

--bookid 컬럼에 not null 제약조건
alter table newbook1
MODIFY bookid number not null;
-- bookid 컬럼의 기본키 추가
alter table newbook1
add PRIMARY KEY(bookid);

--테이블 삭제
drop table newbook1;

--DML(select, insert(데이터삽입), update(데이터수정), delete(데이터삭제))
-- insert 1번  : 속성(컬럼)리스트 생략
 insert into book
 VALUES(11, '개미', '해냄', 12000);
 
 --insert 2번: 속성(컬럼)리스트 명시
insert into book(bookid, bookname, publisher, price)
VALUES(12, '라임오렌지나무', '좋은책', 8000);

 --insert 3번: 컬럼의 순서를 변경
insert into book(bookid, price, publisher, bookname)
VALUES(13, 28000, '부자나라', '부의 습관');

 --insert 4번: 특정 컬럼의 값을 생략
insert into book(bookid, price, bookname)
VALUES(14, 10000, '아침 명상');

--테이블구조가 같은 다른 테이블의 데이터행 삽입하는 방법
insert into book(bookid, bookname, price, publisher)
select bookid, bookname, price, publisher
from imported_book;

-- update : 데이터 변경
-- 고객번호가 5번인 고객의 주소를 대한민국 부산으로 변경
select * from customer;
update customer
set address = '대한민국 부산'
where custid = 5;

--박세리 고객의주소를 김연아 고객의 주소와 동일하게 변경
update customer
set address=(select address
             from customer
             where name='김연아')
where name='박세리';

--박세리 고객의 전화번호를 김연아 고객의 전화번호와 동일하게 변경
update customer
set phone=(select phone
             from customer
             where name='김연아')
where name='박세리';

--모든 고객을 삭제하시오
delete from customer;

select * from orders;
select * from customer;

--박세리 고객을 삭제하시오
delete from customer
where name='박세리';

rollback;
commit;
