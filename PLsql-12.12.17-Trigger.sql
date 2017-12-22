---------------------------------------------------------------------Trigger Create
---------------------------------------------------------------------
CREATE OR REPLACE TRIGGER display_salary_changes 
BEFORE DELETE OR INSERT OR UPDATE ON customers 
FOR EACH ROW 
WHEN (NEW.ID > 0) 
DECLARE 
   sal_diff number; 
BEGIN 
   sal_diff := :NEW.salary  - :OLD.salary; 
   dbms_output.put_line('Old salary: ' || :OLD.salary); 
   dbms_output.put_line('New salary: ' || :NEW.salary); 
   dbms_output.put_line('Salary difference: ' || sal_diff); 
END; 
---------------------------------------------------------------------Trigger replace
---------------------------------------------------------------------
create or replace trigger display_salary_changes 
before update on customers
for each row
when (new.id > 0)
declare
    sdiff number;
    begin 
        sdiff := :NEW.salary - :OLD.salary;
        dbms_output.put_line(:OLD.salary||'-'||:NEW.salary||'-'||sdiff);
        end;
        -------------------------------------------------------------------delete trigger
-------------------------------------------------------------------------
 drop trigger  display_salary_changes;
---------------------------------------------------------------------
---------------------------------------------------------------------
select * from customers;
---------------------------------------------------------------------insert values no change found
---------------------------------------------------------------------
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (9, 'Kriti', 22, 'HP', 5.00 ); 
---------------------------------------------------------------------
---------------------------------------------------------------------update values to find change
UPDATE customers 
SET salary = salary + 500 
WHERE id = 2; 
---------------------------------------------------------------------
---------------------------------------------------------------------