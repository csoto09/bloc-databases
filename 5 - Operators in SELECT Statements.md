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

        `SELECT name, gender, age FROM dogs WHERE breed LIKE '%labrador%';`

        | name   | gender | age |
        | ------ | ------ | --- |
        | Boujee | F      | 3   |
        | Marley | M      | 0   |
   * Display the ids of all the dogs that are under 1 year old.

        `SELECT id FROM dogs WHERE age < 1;`

        | id    |
        | ----- |
        | 10002 |
        | 10004 |
   * Display the name and age of all dogs that are female and over 35lbs.

        `SELECT name, age FROM dogs WHERE gender = 'F' AND weight > 35;`

        | name   | age |
        | ------ | --- |
        | Boujee | 3   |
   * Display all of the information about all dogs that are not Shepherd mixes.

        `SELECT * FROM dogs WHERE breed NOT LIKE '%shepherd%';`

        | id    | name      | gender | age | weight | breed              | intake_date              | in_foster                |
        | ----- | --------- | ------ | --- | ------ | ------------------ | ------------------------ | ------------------------ |
        | 10001 | Boujee    | F      | 3   | 36     | labrador poodle    | 2017-06-22T00:00:00.000Z |                          |
        | 10002 | Munchkin  | F      | 0   | 8      | dachsund chihuahua | 2017-01-13T00:00:00.000Z | 2017-01-31T00:00:00.000Z |
        | 10004 | Marley    | M      | 0   | 10     | labrador           | 2017-05-04T00:00:00.000Z | 2016-06-20T00:00:00.000Z |
        | 10006 | Marmaduke | M      | 7   | 150    | great dane         | 2016-03-22T00:00:00.000Z | 2016-05-15T00:00:00.000Z |
        | 10007 | Rosco     | M      | 5   | 180    | rottweiler         | 2017-04-01T00:00:00.000Z |                          |

   * Display the id, age, weight, and breed of all dogs that are either over 60lbs or Great Danes.

        `SELECT id, age, weight, breed FROM dogs WHERE weight > 60 OR breed = 'great dane';`

        | id    | age | weight | breed      |
        | ----- | --- | ------ | ---------- |
        | 10006 | 7   | 150    | great dane |
        | 10007 | 5   | 180    | rottweiler |

2. Given this `cats` table, what records are returned from these queries?
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

3. From the `cats` table, write queries to select the following pieces of data.
    
	* Display all the information about all of the available cats.

        `SELECT * FROM cats;`

        | id  | name     | gender | age | intake_date              | adoption_date            |
        | --- | -------- | ------ | --- | ------------------------ | ------------------------ |
        | 1   | Mushi    | M      | 1   | 2016-01-09T00:00:00.000Z | 2016-03-22T00:00:00.000Z |
        | 2   | Seashell | F      | 7   | 2016-01-09T00:00:00.000Z |                          |
        | 3   | Azul     | M      | 3   | 2016-01-11T00:00:00.000Z | 2016-04-17T00:00:00.000Z |
        | 4   | Victoire | M      | 7   | 2016-01-11T00:00:00.000Z | 2016-09-01T00:00:00.000Z |
        | 5   | Nala     | F      | 1   | 2016-01-12T00:00:00.000Z |                          |

    * Display the name and sex of all cats who are 7 years old.

        `SELECT name, gender FROM cats WHERE age=7;`

        | name     | gender |
        | -------- | ------ |
        | Seashell | F      |
        | Victoire | M      |

    * Find all of the names of the cats, so you don't choose duplicate names for new cats.
       
        `SELECT name FROM cats;`

        | name     |
        | -------- |
        | Mushi    |
        | Seashell |
        | Azul     |
        | Victoire |
        | Nala     |

4. List each comparison operator and explain when you would use it. Include a real world example for each.
    * less than (<)
    * greater than (>)
    * less than or equal to (<=)
    * greater than or equal to (>=)
    * not equal to (!=,<>)
    * equal to (=)
5. From the `cats` table, what data is returned from these queries?
    * `SELECT name FROM cats WHERE gender = 'F';`
        | name     |
        | -------- |
        | Seashell |
        | Nala     |
    * `SELECT name FROM cats WHERE age <> 3;`
        | name     |
        | -------- |
        | Mushi    |
        | Seashell |
        | Victoire |
        | Nala     |
    * `SELECT id FROM cats WHERE name!= 'Mushi' AND gender ='M';`
        | id  |
        | --- |
        | 3   |
        | 4   |