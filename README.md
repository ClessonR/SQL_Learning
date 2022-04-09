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