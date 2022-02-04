# That's my main annotation file for SQL learning I'll be writing all my doubts and make it as a sheet.

**SELECT** is the most common statement used, *it's used to retrieve data from a table.* Syntax Example: SELECT column_name FROM table_name;

**DISTINCT** command chooses the *first unused names in a column,* often it's used with parenthesis. Syntax Example : SELECT DISTINCT column_name FROM table_name;

**COUNT** function returns the *number of input rows that match a specific condition of a query.* It does mandatorily needs the parenthesis, otherwise it'll not work. Syntax Example: SELECT COUNT ( DISTINCT (amount)) FROM payment;

## Select and Where fundamentals. ##

The **WHERE** statement allows us to specify conditions on columns for the rows to be returned. Syntax Example: SELECT column1, column2 FROM table WHERE 
conditions;
<mark>The conditions are used to filter the rows returned from the SELECT statement.</mark>
 i.e. **SELECT** name,choice **FROM** table **WHERE** (name="David" **AND** choice="Red");

**ORDER BY** is used to sort rows based on a column value, in either ascending or descending order. Syntax Example: SELECT column1,column2 FROM table_name ORDER BY column1 ASC/
DESC.

**LIMIT** command allows us to limit the number of rows returned for a query.

**BETWEEN** operator can be used to match a value against a range of values. Syntax Example: BETWEEN low AND high.

**IN** operator creates a condition to check if a variable is included is a list of known names. Syntax Example: SELECT color FROM table WHERE color IN ('red':'blue':'green');
