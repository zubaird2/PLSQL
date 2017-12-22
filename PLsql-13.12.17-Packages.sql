---------------------------------------------------------sql-Packages
----------------------------------------------------------exa 1
create package cust_sal as
    procedure find_sal(c_id customers.id%type);
    end cust_sal; 
---------------------------------------------------------delete
---------------------------------------------------------
drop package cust_sal;
---------------------------------------------------------package body
---------------------------------------------------------
create or replace package body cust_sal 
as
    procedure find_sal(c_id customers.id%type)
    is
    c_sal customers.salary%type;
    begin
        select salary into c_sal from customers where id = c_id;
        dbms_output.put_line('salary: '||c_sal);
        end find_sal;
 end cust_sal;
 --------------------------------------------------------using package element
---------------------------------------------------------
declare
code customers.id%type := &cc_id;
begin
    cust_sal.find_sal(code);
 end;
 ---------------------------------------------------------end
---------------------------------------------------------Example 2
--
select * from customers;
---------------------------------------------------------
---------------------------------------------------------
create or replace package c_package
as
    --add a customer
    procedure addCustomer(c_id customers.id%type,
    c_name customers.name%type,
    c_age customers.age%type,
    c_addr customers.address%type,
    c_sal customers.salary%type);
    
    --removes a customer
    procedure delCustomer(c_id customers.id%type);
    --Lists all customers
    procedure listCustomer;
 end c_package;
 ---------------------------------------------------------body
---------------------------------------------------------c_package
create or replace package body c_package
as 
        procedure addCustomer(c_id customers.id%type,
    c_name customers.name%type,
    c_age customers.age%type,
    c_addr customers.address%type,
    c_sal customers.salary%type)
    is
    begin
        insert into customers(id,name,age,address,salary)
        values(c_id,c_name,c_age,c_addr,c_sal);
     end addCustomer;
    
    --removes a customer
    procedure delCustomer(c_id customers.id%type)
    is
    begin
     delete from customers where id=c_id;
    end delCustomer;
    --Lists all customers
    procedure listCustomer
    is 
    cursor c_customers is select name from customers;
    type c_list is table of customers.name%type;
    name_list c_list := c_list();
    counter integer := 0;
    begin
    dbms_output.put_line('begin');
        for n in c_customers loop
            counter:=counter +1;
            name_list.extend;
            name_list(counter) := n.name;
            dbms_output.put_line('Customer('||counter||') :'||name_list(counter));
            end loop;
       end listCustomer;
  end c_package;
   ---------------------------------------------------------bodyend
-----------------------------------------------------------using the package
declare
    code customers.id%type := 8;
    begin
--  c_package.addcustomer(12, 'Rajnish', 25, 'Chennai', 3500); 
--   c_package.addcustomer(13, 'Subham', 32, 'Delhi', 7500); 
   c_package.listCustomer;
--   c_package.delCustomer(12);
--  c_package.listCustomer;
   end;
      ---------------------------------------------------------end
-----------------------------------------------------------
select * from customers;