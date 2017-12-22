declare 
    name varchar2(20);
    company varchar2(30);
    introduction clob;
    choice char(1);
    begin
        name:= 'john smith';
        company := 'Techlogix';
        introduction := 'hello i''m john smith from techlogix';
        choice := 'y';
        if choice = 'y' then
            dbms_output.put_line(name);
             dbms_output.put_line(company);
             dbms_output.put_line(introduction);
            end if;
       end;