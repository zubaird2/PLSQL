declare
    subtype name is char(20);
    subtype message is char(180);
    salutation name;
    greetings message;
    begin
        salutation := 'Zubair';
        greetings := 'this is techlogix and you shall work here';
        dbms_output.put_line('welcome '||salutation||greetings);
        end;
        --local/global variable
  declare 
    --Global variable
    num1 number := 95;
    num2 number := 85;
    begin
        dbms_output.put_line('outer variable num1 : '||num1);
        dbms_output.put_line('outer variable num2 : '||num2);
  declare 
    --local variable
    num1 number := 195;
    num2 number := 185;
    begin
        dbms_output.put_line('inner variable num1 : '||num1);
        dbms_output.put_line('inner variable num2 : '||num2);
        end;
end;
        
        