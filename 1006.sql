set SERVEROUTPUT on;
exec interest;

create table book_log(
    bookid_l number,
    bookname_l VARCHAR2(40),
    publisher_l VARCHAR2(40),
    price_l NUMBER
);