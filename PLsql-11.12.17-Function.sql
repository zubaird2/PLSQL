------------------------------Example 1
 create or replace function totalcustomers
 return number
 is
    total number(2) := 0;
 begin select count (*) into total from customers;
    return total;
  end;
  -- call it 
  declare 
   c number(2) ;
   begin 
   c:=totalcustomers();
   dbms_output.put_line('total no of customers '||c);
   end;
   ----------------------------end    
 ------------------------------Example 2(max of two numbers in a block)
 declare
    a number;
    b number;
    c number;
    function findmax(x in number , y in number)
    return number
    is
    z number;
    begin 
        if x>y then
            z:=x;
            else
            z:=y;
            end if;
         return z;
         end;
 begin 
    a:=23;
    b:=45;
    c:=findmax(a,b);
    dbms_output.put_line('Max of two(23,45): '||c);
    end;
 ------------------------------end
 ------------------------------Example 3 (recursion)
 declare
    num number;
    factorial number;
    Function Fact(X Number)
    Return Number
    Is
        F Number;
     Begin
        If X=0 Then
            F:=1;
            Else
            F:=X*Fact(X-1);
            End If;
            Return F;
            End;
  begin
    num:=6;
    factorial:=fact(num);
    dbms_output.put_line('Factorial '|| num || ' is ' || factorial);
    end;
    ------------------------------end
    
           
        