# Operators in `SELECT` Statements

Answer the following questions and submit the responses.

1. Write out a generic `SELECT` statement.
    ``` SQL
        SELECT
        column1,
        column2,
        column3

        FROM table_name

        WHERE column1='foo' -- WHERE clause is optional
    ```
1. Create a fun way to remember the order of operations in a `SELECT` statement, such as a mnemonic.

1. Given this `dogs` table, write queries to select the following pieces of data:
   * Display the name, gender, and age of all dogs that are part Labrador.
   * Display the ids of all the dogs that are under 1 year old.
   * Display the name and age of all dogs that are female and over 35lbs.
   * Display all of the information about all dogs that are not Shepherd mixes.
   * Display the id, age, weight, and breed of all dogs that are either over 60lbs or Great Danes.

1. Given this `cats` table, what records are returned from these queries?
    * `SELECT name, adoption_date FROM cats;`
        | name     | adoption_date            |
        | -------- | ------------------------ |
        | Mushi    | 2016-03-22T00:00:00.000Z |
        | Seashell |                          |
        | Azul     | 2016-04-17T00:00:00.000Z |
        | Victoire | 2016-09-01T00:00:00.000Z |
        | Nala     |                          |

    * `SELECT name, age FROM cats;`
        | name     | age |
        | -------- | --- |
        | Mushi    | 1   |
        | Seashell | 7   |
        | Azul     | 3   |
        | Victoire | 7   |
        | Nala     | 1   |

1. From the `cats` table, write queries to select the following pieces of data.
    * Display all the information about all of the available cats.
    * Display the name and sex of all cats who are 7 years old.
    * Find all of the names of the cats, so you don't choose duplicate names for new cats.

1. List each comparison operator and explain when you would use it. Include a real world example for each.

1. From the `cats` table, what data is returned from these queries?
    * `SELECT name FROM cats WHERE gender = 'F';`
    * `SELECT name FROM cats WHERE age <> 3;`
    * `SELECT id FROM cats WHERE name!= 'Mushi' AND gender ='M';`