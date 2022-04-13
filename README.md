# That's my main annotation file for SQL learning I'll be writing all my doubts and make it as a sheet.

**SELECT** is the most common statement used, *it's used to retrieve data from a table.* Syntax Example: SELECT column_name FROM table_name;

**DISTINCT** command chooses the *first unused names in a column,* often it's used with parenthesis. Syntax Example : SELECT DISTINCT column_name FROM table_name;

**COUNT** function returns the *number of input rows that match a specific condition of a query.* It does mandatorily needs the parenthesis, otherwise it'll not work. Syntax Example: SELECT COUNT ( DISTINCT (amount)) FROM payment;

## Select and Where fundamentals. ##

The **WHERE** statement allows us to specify conditions on columns for the rows to be returned. Syntax Example: SELECT column1, column2 FROM table WHERE 
conditions;
The conditions are used to filter the rows returned from the SELECT statement.
 i.e. **SELECT** name,choice **FROM** table **WHERE** (name="David" **AND** choice="Red");

**ORDER BY** is used to sort rows based on a column value, in either ascending or descending order. Syntax Example: SELECT column1,column2 FROM table_name ORDER BY column1 ASC/
DESC.

**LIMIT** command allows us to limit the number of rows returned for a query.

**BETWEEN** operator can be used to match a value against a range of values. Syntax Example: BETWEEN low AND high.

**IN** operator creates a condition to check if a variable is included is a list of known names. Syntax Example: SELECT color FROM table WHERE color IN ('red':'blue':'green');


**LIKE** operator allows us to perform pattern matching against string data with the use of *wildcard characters*

*OBS:* LIKE is **case-sensitive**, we can use ILIKE which is not.

- Percent %: Matches any sequence of characters;
    1. Example: **All names that begin with an 'A':**
        > WHERE name LIKE 'A%';
    2. Example: **All names that end with an 'a':**
        > WHERE name LIKE '%a';

- Underscore _: Matches any single character;
    1. Example: **Get all Mission Impossible films:**
        > WHERE title LIKE 'Mission Impossible _'


## Aggregate Functions ##

The main idea behind an **aggregate function** is to take multiple inputs and return a single output.

**GROUP BY** allows us to aggregate columns per some category. Also, it must appear right after a FROM or WHERE statement.
Syntax Example:  SELECT category_col, AGG(data_col) FROM table WHERE category_col != 'A' GROUP BY category_col

**HAVING** allows us to use the aggregate result as a filter along with a GROUP BY. Syntax Example: SELECT company, SUM(sales) FROM finance_table WHERE company != 'Google' GROUP BY company HAVING SUM(sales) > 1000

**COLUMN NAME ALIASES** is similar to bash aliases and changes the name of columns to preferred ones. Syntax Example: SELECT SUM(column) AS new_name FROM table; 

*OBS*: it only gets assigned after the code compiles so it can't be used in the main expression.

## JOIN ##

*Join allow us to combine multiple tables together, the main reason for the different JOIN types is to decide how to deal with information only present in one of the joined tables.*

**Inner Joins**  will result with the set of record that match in both tables. Syntax Example: SELECT * FROM TableA INNER JOIN TableB ON TableA.col_match = TableB.col_match

**Full Outer Joins** select everything from both tables. 
Syntax Example: SELECT * FROM customer
FULL OUTER JOIN payment 
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.payment_id is null

**Left Outer Join** result in the set of records that are in the left table, if there is no match with the  right table, the result are null. Syntax Example: SELECT * FROM Registrations LEFT OUTER JOIN Logins ON Registrations.name = Logins.name

**Right Join** is essentially the same as a LEFT JOIN, except the tables are switched. 

**Union** operator is used to combine the result-set of two or more SELECT statements.

## Data Types ##

- Examples 
  - TIME = Contains only time
  - DATE = Contains only date
  - TIMESTAMP = Contains date and time 
  - TIMESTAMPZ = Contains date, time and timezone

- Functions
    - TIMEZONE
    - NOW
    - TIMEOFDAY
    - CURRENT_TIME
    - CURRENT_DATE
    - EXTRACT() - Allows the user to extract or obtain a sub-component of a date value.
    - AGE() - Calculates and returns the current age given a timestamp.
    - TO_CHAR() - General function to convert data types to text.

## Creating Databases ##

- **A primary key** is a column or a group of columns used to identify a row uniquely in a table

- **A foreign key** is a field or group of fields in a table that uniquely identifies a row in another table.

- **Constrains** are the rules enforced on data columns on a table. Also prevents invalid data from being entered into the database.
  
    - There are two types of constrains:
        
        1. Columns Constrains: Constrains the data in a column to adhere to certain conditions.
        2. Table Constrains: applied to the entire table rather than to an individual column.
    
    - Most Common Column **Constrains**:
        
        1. **NOT NULL** : Ensures that a column cannot have NULL value.
        2. **UNIQUE** : Ensures that all values in a column are different. 
        3. **CHECK** : Ensures that all values in a column satisfy certain conditions.
        4. **EXCLUSION** : Ensures that if any two rows are compared on the specified column or expression using the specified operator, not all of these comparisons will return TRUE.

    - Most Common Table **Constrains**:

        1. **CHECK** (condition) : To check a condition when inserting or updating data. 
        2. **REFERENCES** : to constrain the value stores in the column that must exist in a column in another table.
   
- **Data Types** are the different types of data that can be stored in a database. 
  - SERIAL: A serial data type is a data type that is used to store a sequence of integers. A sequence is often used as the primary key column in a table.

- **INSERT** command allows you to add in rows to a table. Syntax Example: INSERT INTO table_name (column1, column2, column3) VALUES (value1, value2, value3);
  - Also allows to add in rows to a table. Syntax Example : INSERT INTO table_name(column1,column2,...) SELECT column1,column2,... FROM table_name2 WHERE condition;

- **UPDATE** keyword allows for the changing of values of the columns in a table. Syntax Example: UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;

- **DELETE** keyword allows for the deletion of rows from a table. Syntax Example: DELETE FROM table_name WHERE condition;
  - A deletion can be made based on their presence in other tables. Syntax Example: DELETE FROM tableA USING tableB WHERE tableA.column = tableB.column; 
                                            
- **ALTER** clause allows you to change the structure of a table. Syntax Example: ALTER TABLE table_name ADD column_name data_type;
    - Adding, dropping, or renaming columns.
    - Changing a column's data type.
    - Set DEFAULT values for a column.
    - Add CHECK constraints.
    - Rename table.

- **DROP** allows for the complete removal of a column in a table. Syntax Example: ALTER TABLE table_name DROP COLUMN column_name (Use CASCADE here if you want to delete the data in the column as well);

- **CHECK** constraint allows us to create more customized constraints that adhere to a certain condition. Such as making sure all inserted integer values fall below a certain threshold. Syntax Example: CREATE TABLE example(ex_id SERIAL PRIMARY KEY, age SMALLINT CHECK(age > 21), parent_age SMALLINT CHECK(parent_age > age);

## Conditional Expressions and Procedures ##

- **CASE** statement to only execute SQL code when certain conditions are met. Basically IF/ELSE stamente
  - There are two ways to use a CASE statement, either a general CASE or a CASE expression.
  - Both methods are similar, but the general CASE statement is used when you want to execute different SQL code based on different conditions.
  - Syntax  Example: 
  CASE 
     WHEN condition1 THEN result1 
     WHEN condition2 THEN result2 
    ELSE result3 
    END;
  - Syntax Example2: SELECT a, CASE WHEN a = 1 THEN 'one WHEN a = 2 THEN 'two' ELSE 'other' END FROM table;
  - **CASE expression** Syntax Example: CASE expression WHEN value1 THEN result1 WHEN value2 THEN result2 ELSE some_other_result END;
