---------------------------------------------------------sql-Collection
----------------------------------------------------------
--it has 3 types
--index by table associative arra;y
--nested table array
--variabl size array
---------------------------------------------------------exa 1
----------------------------------------------------------index by table 
declare 
    type salary is table of number index by varchar2(20);
    salary_list salary;
    name varchar2(20);
    begin
        --add elements
        salary_list('raj') := 5200;
        salary_list('min') := 6200;
        salary_list('mar') := 7200;
        salary_list('ram') := 8200;
        salary_list('jam') := 9200;
        --print
        name := salary_list.first;
        while name is not null loop
            dbms_output.put_line('salary '|| name || ' is ' || to_char(salary_list(name)));
            name:= salary_list.next(name);
            end loop;
  end;
  ----------------------------------------------------------end
-----------------------------------------------------------exa 1(with  %type)
declare
    cursor c_customer is select name from customers;
    type c_list is table of customers.name%type index by binary_integer;
    name_list c_list;
    counter integer := 0;
    begin
        for n in c_customer loop
            counter := counter+1;
            name_list(counter) := n.name;
            dbms_output.put_line('customer('||counter||'):'||name_list(counter));
            end loop;
      end;
 ---------------------------------------------------------end 
----------------------------------------------------------exa 2
declare 
    type name_table is table of varchar2(10);
    type grade is table of integer;
    names name_table;
    marks grade;
    total integer;
    begin
        names := name_table('kav','ris','aya','pri','azi');
        marks := grade (10,20,30,40,50);
        total := names.count;
        dbms_output.put_line('total  '|| total || 'students' );
        for i in 1..total loop
            dbms_output.put_line('student ('||names(i)|| ')marks: '||marks(i));
         end loop;
     end;
---------------------------------------------------------end
----------------------------------------------------------exa 2(%rowtype or %type)
declare
    cursor c_customer is select name from customers;
    type c_list is table of customers.name%type;
    name_list c_list :=  c_list();
    counter integer := 0 ;
    begin
        for n in c_customer loop
            counter := counter+1;
            name_list.extend;
            name_list(counter) := n.name;
            dbms_output.put_line('customer(' || counter ||'):'||name_list(counter));
            end loop;
      end;