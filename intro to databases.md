# Exercises

Create a new repository on GitHub to hold your assignments for the Databases module. Create a new branch for Checkpoint 1. Submit your answers.

1. What data types do each of these values represent?
   1. "A Clockwork Orange" -- **string**
   1. 42 -- **integer**
   1. 09/02/1945 -- **date**
   1. 98.7 -- **float**
   1. $15.99 -- **integer**

1. Explain when a database would be used. Explain when a text file would be used.
    * text: fairly limited amount of data. never running in more than one instance at a time.
    * db: when needing to support multiple applications accessing data at once. when needing data to persist between instances. when needing to easy query stored data.
1. Describe one difference between SQL and other programming languages.
   * procedural vs declarative: sql is a declarative language, meaning one does not need to explicity state how the underlying engine must search for our query. We provide the query and the database engine determines the most efficient way to deliver the results.
  
1. In your own words, explain how the pieces of a database system fit together at a high level.
    * a table uses rows and columns to store data. each column in a table dictates what kind of information will be found in the spaces below the header. each row represents one record and the data in each row is stored in cells. cells are found at the intersection of each row and column and are analogous to key-value pairs in objects.
1. Explain the meaning of table, row, column, and value.
    * table - data structure utilizing rows and columns to organize and store data in a logical and easily retrievable way.
    * row - individual instance of data in our table
    * column - describes what data is collected in cells below it
    * value - content of a cell of data in our table

1. List three data types that can be used in a table.
    1. integers
    1. strings
    1. date
1. Given this payments table, provide an English description of the following queries and include their results:

    ``` SQL
     SELECT date, amount
     FROM payments;

    -- please give me the date and amount of all records in our payments log.

     SELECT amount
     FROM payments
     WHERE amount > 500;

    -- I'm looking the dollar amount for all records where the amount exceeds 500

     SELECT *
     FROM payments
     WHERE payee = 'Mega Foods';

    -- I need all invoices from Mega Foods. Please include all available columns.
    ```
1. Given this `users` table, write SQL queries using the following criteria and include the output:

   * The email and sign-up date for the user named DeAndre Data.
    ``` sql
        select email, signup from users
        where name = 'DeAndre Data';
    ```
   * The user ID for the user with email 'aleesia.algorithm@uw.edu'.
    ``` sql
        select userid from users
        where email = 'aleesia.algorithm@uw.edu';
    ```
   * All the columns for the user ID equal to 4.
    ``` sql
        select * from users
        where userid = 4;
    ```
