create or replace trigger afterinsertbook
after insert on book for each row
declare
    average number;
begin
    insert into book_log
    values(:new.bookid, :new.bookname, :new.publisher,:new.price);
    dbms_output.put_line('���� ���� book_log ���̺� ����߽��ϴ�.');
end;

insert into book values(16, '���� ���ƿ�', '���й̵��' , 25000);
select * from book where bookid=16;
select * from book_log where bookid_l = 16;