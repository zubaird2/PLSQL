 ---------------------------------------------------------OBJECT OREINTED
----------------------------------------------------------
create or replace type address as object
(
    house_no varchar2(10),
    street varchar2(30),
    city varchar2(20),
    state varchar2(10),
    pincode varchar2(10)
);
---------------------------------------------------------exa 1
-----------------------------------------------------------instantiating
declare 
 residence address;
    begin
        residence := address('032a','m.g.good','jai','raj','000222');
        dbms_output.put_line('House no '||residence.house_no);
        dbms_output.put_line('street '||residence.street);
        dbms_output.put_line('city '||residence.city);
        dbms_output.put_line('state '||residence.state);
     end;
--------------------------------------------------------exa 2
---------------------------------------------------------
 --for comparison we have two methods
    --1-map methord
    --2-order method
    
  --map methord for rectangle
  create or replace type rectangle as object
  ( 
    length number,
    width number,
    member function enlarge (inc number) return rectangle,
    member procedure display,
    map member function measure return number
  );
  --body
  create or replace type body rectangle as 
  member function enlarge(inc number) return rectangle
  is 
  begin
        return rectangle(self.length+inc,self.width+inc);
  end enlarge;
  member procedure display 
  is
  begin
  dbms_output.put_line('length: '||length);
  dbms_output.put_line('width: '||width);
  end display;
  map member function measure return number
   is 
   begin
    return (sqrt(length*length+width*width));
    end measure;
 end;
 --------------------------------------------------------exa 2
--------------------------------------------------------- --map method for rectangle
declare 
    r1 rectangle;
    r2 rectangle;
    r3 rectangle;
    inc_factor number := 5;
    begin
        r1 := rectangle(3,4);
        r2 := rectangle(5,7);
        r3 := r1.enlarge(inc_factor);
        r3.display;
        if(r1>r2) then --calling measure
                r1.display;
         else
                r2.display;
                end if;
    end;
 --------------------------------------------------------exa 3
---------------------------------------------------------order method for rectangle
--
     --order methord for rectangle
     
 --------------------------------------------------------exa 4
---------------------------------------------------------declare
--------------inheritance
 CREATE OR REPLACE TYPE newrect AS OBJECT 
(length number, 
 width number, 
 member function enlarge( inc number) return rectangle, 
 NOT FINAL member procedure display) NOT FINAL 
 --------------------------------------------------------exa 4
---------------------------------------------------------body
CREATE OR REPLACE TYPE BODY newrect AS 
   MEMBER FUNCTION enlarge(inc number) return rectangle IS 
   BEGIN 
      return rectangle(self.length + inc, self.width + inc); 
   END enlarge;  
   MEMBER PROCEDURE display IS 
   BEGIN 
      dbms_output.put_line('Length: '|| length); 
      dbms_output.put_line('Width: '|| width); 
   END display; 
END; 
---------------------------------------------------------inheritance
---------------------------------------------------------child 
CREATE OR REPLACE TYPE tabletop UNDER newrect 
(   
   material varchar2(20), 
   OVERRIDING member procedure display 
)
---------------------------------------------------------
---------------------------------------------------------body child
CREATE OR REPLACE TYPE BODY tabletop AS 
OVERRIDING MEMBER PROCEDURE display IS 
BEGIN 
   dbms_output.put_line('Length: '|| length); 
   dbms_output.put_line('Width: '|| width); 
   dbms_output.put_line('Material: '|| material); 
END display;
end;
---------------------------------------------------------
---------------------------------------------------------instantiate chlld
DECLARE 
   t1 tabletop; 
   t2 tabletop; 
BEGIN 
   t1:= tabletop(20, 10, 'Wood'); 
   t2 := tabletop(50, 30, 'Steel'); 
   t1.display; 
   t2.display; 
END;
---------------------------------------------------------
---------------------------------------------------------end