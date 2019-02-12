# JOIN Statements

1. How do you find related data held in two separate data tables?
2. Explain in your own words, the difference between an `INNER JOIN`, `LEFT OUTER JOIN`, and `RIGHT OUTER JOIN`. Give a real-world example for each.
1. Define primary key and foreign key. Give a real-world example for each.
1. Define aliasing.
1. Change this query so that you are using aliasing:

    ``` sql
    ORIGINAL QUERY

    SELECT 
    professor.name, 
    compensation.salary, 
    compensation.vacation_days

    FROM professor
    JOIN compensation ON professor.id = compensation.professor_id
    
    NEW QUERY 

    SELECT 
    p.name,
    comp.salary, 
    comp.vacation_days

    FROM professor as p
    JOIN compensation as comp ON p.id = comp.professor_id
    ```

1. Why would you use a `NATURAL JOIN`? Give a real-world example.
1. Using the Employee schema and data, write queries to find the following information: **FIXME**
   * List all employees and all shifts
     * https://www.db-fiddle.com/f/omfx8AfCTGAp4jH3QE9xUB/2 
1. Using the Adoption schema and data, write queries to retriece the following information and include the results
    * Create a list of all volunteers. If the volunteer is fostering a dog, include each dog as well.
      
        ``` sql 
        -- https://www.db-fiddle.com/f/tpodLv3A43VL4gHqohqx2o/43

        SELECT 
        CONCAT(v.first_name, ' ', v.last_name) as "Volunteer",
        d.name as "Dog Name"
        
        FROM volunteers as v
        LEFT JOIN dogs as d on v.foster_dog_id = d.id;

        | Volunteer        | Dog Name  |
        | ---------------- | --------- |
        | Rubeus Hagrid    | Munchkin  |
        | Marjorie Dursley | Marmaduke |
        | Sirius Black     |           |
        | Remus Lupin      |           |
        | Albus Dumbledore |           |

        ```

    * The cat's name, adopter's name, and adopted date for each cat adopted within the past month to be displayed as part of the "Happy Tail" social media promotion which posts recent successful adoptions.
       
        ``` SQL
        -- https://www.db-fiddle.com/f/fp8v45kD7p2qUTSLXM7vTF/2

        SELECT
        c.name as "Cat Name",
        CONCAT(a.first_name,' ', a.last_name) as "Adopter Name",
        to_char(ca.date, 'YYYY-MM-DD') as "Adoption Date"
        
        FROM cat_adoptions as ca
        JOIN cats as c on c.id=ca.cat_id
        JOIN adopters as a on a.id=ca.adopter_id
        
        where ca.date > (CURRENT_DATE - INTERVAL '30 DAYS');

        | Cat Name | Adopter Name  | Adoption Date |
        | -------- | ------------- | ------------- |
        | Mushi    | Arabella Figg | 2019-01-23    |
        | Victoire | Argus Filch   | 2019-01-28    |

        ```

    * Create a list of adopters who have not yet chosen a dog to adopt.
        ``` sql
        --https://www.db-fiddle.com/f/2ozhSkWmNrJsVUaqcWrJnn/1

        SELECT
        a.first_name,
        a.last_name,
        a.phone_number

        FROM adopters as a
        LEFT JOIN dog_adoptions as da on da.adopter_id=a.id

        WHERE da.dog_id IS NULL;

        | first_name | last_name | phone_number |
        | ---------- | --------- | ------------ |
        | Arabella   | Figg      | 843-228-5239 |
        | Hermione   | Granger   | 676-464-7837 |
        ```  

    * Lists of all cats and all dogs who have not been adopted.
        
        ``` sql
        -- https://www.db-fiddle.com/f/46iMTWwLHenVWXT3yG24Py/2

        SELECT 
        CASE 
          WHEN weight IS NULL 
            THEN 'cat'
          ELSE 'dog'
        END as "Species",
        name, 
        gender,
        age
        
        FROM dogs as d
        NATURAL FULL JOIN cats as c
        LEFT JOIN dog_adoptions as da on da.dog_id=d.id
        LEFT JOIN cat_adoptions as ca on ca.cat_id=c.id
        
        WHERE da.dog_id IS NULL
        AND ca.cat_id IS NULL
        
        ORDER BY 1, age ASC;

        | Species | name      | gender | age |
        | ------- | --------- | ------ | --- |
        | cat     | Nala      | F      | 1   |
        | cat     | Seashell  | F      | 7   |
        | dog     | Marley    | M      | 0   |
        | dog     | Munchkin  | F      | 0   |
        | dog     | Boujee    | F      | 3   |
        | dog     | Lassie    | F      | 7   |
        | dog     | Marmaduke | M      | 7   |

    * The name of the person who adpted Rosco.
        
        ```sql
        --https://www.db-fiddle.com/f/9fMtQ3AG53dWu1zMZF995C/1

        SELECT
        a.first_name,
        a.last_name,
        to_char(da.date, 'YYYY-MM-DD') as "Adoption Date",
        CAST(da.fee AS money) as "Adoption Fee"
        
        FROM adopters as a
        JOIN dog_adoptions as da on da.adopter_id = a.id
        JOIN dogs as d on d.id=da.dog_id
        
        WHERE d.name = 'Rosco';

        | first_name | last_name | Adoption Date | Adoption Fee |
        | ---------- | --------- | ------------- | ------------ |
        | Argus      | Filch     | 2017-08-27    | $80.00       |
        ```

2. Using the Library schema and data, write queries applying the following scenarios and include the results:
    * To determine if the library should buy more copies of a given book, please provide the names and position, in order, of all the patrons with a hold (request for a book with all copies checked out) on "Advanced Potion-Making".

        ``` sql
        ---https://www.db-fiddle.com/f/uG5nYAUwZuWtxmSaCmsSu5/0

        | name           | rank | title                  |
        | -------------- | ---- | ---------------------- |
        | Terry Boot     | 1    | Advanced Potion-Making |
        | Cedric Diggory | 2    | Advanced Potion-Making |

        ```

    * List of all of the library patrons. If they have one or more books checked out, list the books with the patrons.
  
        ``` sql 
        --- https://www.db-fiddle.com/f/tebgkQdRxHywQgLpiXHW4Q/2

        | id  | name             | books                                   |
        | --- | ---------------- | --------------------------------------- |
        | 1   | Hermione Granger |                                         |
        | 2   | Terry Boot       | Advanced Potion-Making                  |
        | 3   | Padma Patil      |                                         |
        | 4   | Cho Chang        |                                         |
        | 5   | Cedric Diggory   | Fantastic Beasts and Where to Find Them |

        ```