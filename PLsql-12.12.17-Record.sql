 ------------------------------Record
 ------------------------------Example 1(Table Based Record) 
 declare 
    customer_rec customers%rowtype;
    begin
        select * into customer_rec from customers where id=5;
        dbms_output.put_line('customerid: '||customer_rec.id);
        dbms_output.put_line('customername: '||customer_rec.name);
        dbms_output.put_line('customeraddress: '||customer_rec.address);
        dbms_output.put_line('customersalary: '||customer_rec.salary);
        end;
------------------------------end
------------------------------Example 2(Cursor Based Record)
declare
    Cursor customer_cur is select id,name,salary from customers;
    customer_rec customer_cur%rowtype;                        --this is cursor based so rec type should be according to cursor
    begin
        open customer_cur;
        loop
        fetch customer_cur into customer_rec;
        exit when customer_cur%notfound;
        dbms_output.put_line('customer id:'||customer_rec.id);
        dbms_output.put_line('customer name:'||customer_rec.name);
        dbms_output.put_line('customer salary:'||customer_rec.salary);
        end loop;
        close customer_cur;
  end;
------------------------------end
------------------------------Example 3(User define record work)
declare 
    type books is record (title varchar(50),author varchar(50),subject varchar(50),book_id number);
    book1 books;
    book2 books;
    begin
    book1.title:='c programing';
    book1.author := 'ali';
    book1.subject := 'c totorial';
    book1.book_id := 1234;
    book2.title:='banking programing';
    book2.author := 'hamza';
    book2.subject := 'banking totorial';
    book2.book_id := 5678;
    dbms_output.put_line('Book 1 title: '||book1.title);
dbms_output.put_line('Book 1 author: '||book1.author);
dbms_output.put_line('Book 1 subject: '||book1.subject);
dbms_output.put_line('Book 1 Book_id: '||book1.book_id);
    

    dbms_output.put_line('Book 2  title: '||book2.title);
dbms_output.put_line('Book 2 author: '||book2.author);
dbms_output.put_line('Book 2 subject: '||book2.subject);
dbms_output.put_line('Book 2 Book_id: '||book2.book_id);

end;
------------------------------end
------------------------------Example 4(Use procedure  to print type define record)
declare 
    type books is record (title varchar(50),author varchar(50),subject varchar(50),book_id number);
    book1 books;
    book2 books;
    procedure printbook(book books)
            is
            begin
                    dbms_output.put_line('Book  title: '||book.title);
                    dbms_output.put_line('Book  author: '||book.author);
                    dbms_output.put_line('Book  subject: '||book.subject);
                    dbms_output.put_line('Book  Book_id: '||book.book_id);        
            end;
    begin
    book1.title:='c programing';
    book1.author := 'ali';
    book1.subject := 'c totorial';
    book1.book_id := 1234;
    book2.title:='banking programing';
    book2.author := 'hamza';
    book2.subject := 'banking totorial';
    book2.book_id := 5678;
    --use procedure to print
    printbook(book1);
    printbook(book2);
end;
------------------------------end