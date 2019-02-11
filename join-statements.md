# JOIN Statements

1. How do you find related data held in two separate data tables?
2. Explain in your own words, the difference between an `INNER JOIN`, `LEFT OUTER JOIN`, and `RIGHT OUTER JOIN`. Give a real-world example for each.
3. Define primary key and foreign key. Give a real-world example for each.
4. Define aliasing.
5. Change this query so that you are using aliasing:

    ``` sql
    SELECT 
    professor.name, 
    compensation.salary, 
    compensation.vacation_days

    FROM professor
    JOIN compensation ON professor.id = compensation.professor_id
    ```
1. Why would you use a `NATURAL JOIN`? Give a real-world example.
2. Using the Employee schema and data, write queries to find the following information:
    * Create a list of all volunteers. If the volunteer is fostering a dog, include each dog as well.
    * The cat's name, adopter's name, and adopted date for each cat adopted within the past month to be displayed as part of the "Happy Tail" social media promotion which posts recent successful adoptions.
    * Create a list of adopters who have not yet chosen a dog to adopt.
    * Lists of all cats and all dogs who have not been adopted.
    * The name of the person who adpted Rosco.
1. Using the Library schema and data, write queries applying the following scenarios and include the results:
    * To determine if the library should buy more copies of a given book, please provide the names and position, in order, of all the patrons with a hold (request for a book with all copies checked out) on "Advanced Potion-Making".
      * https://www.db-fiddle.com/f/uG5nYAUwZuWtxmSaCmsSu5/0

        ``` sql
        | name           | rank | title                  |
        | -------------- | ---- | ---------------------- |
        | Terry Boot     | 1    | Advanced Potion-Making |
        | Cedric Diggory | 2    | Advanced Potion-Making |

        ```

    * List of all of the library patrons. If they have one or more books checked out, list the books with the patrons.
      * https://www.db-fiddle.com/f/tebgkQdRxHywQgLpiXHW4Q/2

        ``` sql 
        | id  | name             | books                                   |
        | --- | ---------------- | --------------------------------------- |
        | 1   | Hermione Granger |                                         |
        | 2   | Terry Boot       | Advanced Potion-Making                  |
        | 3   | Padma Patil      |                                         |
        | 4   | Cho Chang        |                                         |
        | 5   | Cedric Diggory   | Fantastic Beasts and Where to Find Them |

        ```