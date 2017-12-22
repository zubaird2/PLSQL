---------------------------------------------------------dbms_output
----------------------------------------------------------
select * from customers
---------------------------------------------------------exa 1
----------------------------------------------------------
    declare
        lines dbms_output.chararr;
        num_line number;
        begin
            --enable buffer size with default 20000
            dbms_output.enable;
            dbms_output.put_line('hello world');
            dbms_output.put_line('hope you enjoy tutorial');
            dbms_output.put_line('have a great time exploring plsql');
            num_line := 3;
             dbms_output.get_lines(lines,num_line);
             for i in 1..num_line loop
                dbms_output.put_line('obtaining'|| lines(i));
                end loop;
             end;