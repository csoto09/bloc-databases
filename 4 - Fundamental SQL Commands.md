# Exercises

Use the commands above to complete the following tasks, and submit the SQL statements. Real-world examples must be distinct from those used in the text.

1. List the commands for adding, updating, and deleting data.
   * Adding data: `INSERT INTO tableName VALUES ('String', 1234, TRUE);`
   * Updating data: `UPDATE tableName SET field='newValue' WHERE id=12345;`
   * Delete data: `DELETE FROM tableName WHERE id=12345;`

1. Explain the structure for each type of command.

1. What are some of the data types that can be used in tables? Give a real-world example of each type.

1. Decide how to create a new table to hold a list of people invited to a wedding dinner. The table needs to have first and last names, whether they sent in their RSVP, the number of guests they are bringing, and the number of meals (1 for adults and 1/2 for children).

    * Which data type would you use to store each of the following pieces of information?
      * First and last name. - ***TEXT***
      * Whether they sent in their RSVP. - ***BOOLEAN***
      * Number of guests. - ***INTEGER***
      * Number of meals. - ***INTEGER***
    * Write a command that creates the table to track the wedding dinner.
      * `CREATE TABLE wedding_guests (id smallserial, FirstName varchar(32), LastName varchar(32), RSVP boolean, NumberOfGuests integer, NumberOfMeals integer);`
    * Write a command that adds a column to track whether the guest sent a thank you card.
      * `ALTER TABLE wedding_guests ADD COLUMN ThankYou boolean SET DEFAULT FALSE;`
    * You have decided to move the data about the meals to another table, so write a command to remove the column storing the number meals from the wedding table.
      * `ALTER TABLE wedding_guests DROP COLUMN NumberOfMeals;`
    * The guests will need a place to sit at the reception, so write a command that adds a column for table number.
      * `ALTER TABLE wedding_guests ADD COLUMN TableNumber integer;`
    * The wedding is over and we do not need to keep this information, so write a command that deletes the table numbers from the database.
      * `ALTER TABLE wedding_guests DROP COLUMN TableNumber;`

1. Write a command to create a new table to hold the books in a library with the columns ISBN, title, author, genre, publishing date, number of copies, and available copies.

    ``` sql
      CREATE TABLE inventory (id smallserial, ISBN varchar(20), title text, author text, genre text, publishing_date date, total_copies integer, available_copies integer);
    ```
  
   * Find three books and add their information to the table.
      ``` sql
      INSERT INTO inventory (isbn, title, author, genre, publishing_date, total_copies, available_copies)
      VALUES('978-81-265-1336-9', 'Concepts and Applications of Finite Element Analysis', 'Robert D. Cook', 'Mathematical Modeling', '2019-01-11', 1,1),
      ('978-0-544-27299-6', 'What If?: Serious Scientific Answers to Absurd Hypothetical Questions', 'Randall Munroe', 'Self-Help', '2014-09-02', 5,5),
      ('978-0544668256','Thing Explainer: Complicated Stuff in Simple Words','Randall Munroe','Humor','2015-11-24',2,2);
      ```

   * Someone has just checked out one of the books. Change the number of available copies to 1 fewer.
     * `UPDATE inventory SET available_copies=0 WHERE id = 2;`
   * Now one of the books has been added to the banned books list. Remove it from the table.
     * `DELETE FROM inventory WHERE id = 1;`
1. Write a command to make a new table to hold spacecrafts. Information should include id, name, year launched, country of origin, a brief description of the mission, orbiting body, if it is currently operating, and its approximate miles from Earth. In addition to the table creation, provide commands that perform the following operations:

   * Add three non-Earth-orbiting satellites to the table.
   * Remove one of the satellites from the table since it has just crashed into the planet.
   * Edit another satellite because it is no longer operating and change the value to reflect that.

1. Write a command to create a new table to hold the emails in your inbox. This table should include an id, the subject line, the sender, any additional recipients, the body of the email, the timestamp, whether or not you have read the email, and the id of the email chain it's in. Also provide commands that perform the following operations:

   * Add three new emails to the inbox.
   * You deleted one of the emails, so write a command to remove the row from the inbox table.
   * You started reading an email but just heard a crash in another room. Mark the email as unread before investigating the crash, so you can come back and read it later.