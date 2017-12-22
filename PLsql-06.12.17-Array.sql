------------------------Example 2----------------------
Declare 
   cursor  c_customers is   select name from customers;
    type c_list is varray(5) of customers.name%type;
    name_list c_list := c_list();--initialized before refrencing
    counter integer := 0;
    begin
    for n in c_customers loop
        counter := counter + 1;
        name_list.extend;
        name_list(counter) := n.name;
        dbms_output.put_line('Customer('||counter||'):'||name_list(counter));
      end loop;
      end;
 ---------------------------------------------------------
 select * from customers;
------------------------Example 1----------------------
declare 
    type namearray is varray(5) of varchar(10);
    type grades is varray(5) of integer;
    names namearray;
    marks grades;
    total integer;
    begin
        names := namearray('abc','def','gef','hik','jkl');
        marks := grades(2,3,5,4,6);
        total := names.count;
        dbms_output.put_line('Total '||total||' students');
        for i in 1 .. total loop
            dbms_output.put_line('Student '||names(i)||' Marks '||marks(i));
            end loop;
     end;
