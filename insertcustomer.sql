create or replace procedure insertcustomer(
    p_custid in number,
    p_name in varchar2,
    p_address in varchar2,
    p_phone in varchar2)
as
begin
    insert into customer(custid, name, address, phone)
    values(p_custid, p_name, p_address, p_phone);
end;

exec insertcustomer(6, '박현경', '서울시 용산구 한남동' , '010-1233-7653');

select * from customer;