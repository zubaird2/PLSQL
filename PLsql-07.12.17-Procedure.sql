-------------------------------------------Create Procedure
CREATE OR REPLACE PROCEDURE greetings 
AS 
   x  number:=1; 
BEGIN 
   dbms_output.put_line('Hello World!'||x); 
END; 
--
execute greetings;
------------------------------------------------------
--IN AND OUT EXAMPLE 1
Declare 
    a number ;
    b number;
    c number;
    procedure findmin(x in number,y in number,z out number)
    is
        begin
            if x<y then
                z:=x;
                else
                 z:=y;
                 end if;
             end;
   begin
    a := 23 ;
    b:= 45;
    findmin(a,b,c);
     dbms_output.put_line('min of (23,45):'||c);
     end;
--IN AND OUT EXAMPLE 2
Declare 
    a Number;
    Procedure Square_Number(X In Out Number) 
    Is 
    Begin
        X:= X*X;
        End;
    begin
        a:=23;
        square_number(a);
        dbms_output.put_line('sqare of 23 is :'||a);
        end;
  ------------------------------------------------------------