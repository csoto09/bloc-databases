# Exercises

Use the commands above to complete the following tasks, and submit the SQL statements. Real-world examples must be distinct from those used in the text.

1. List the commands for adding, updating, and deleting data.
   * Adding data:
    ``` sql
      INSERT INTO tableName VALUES ('String', 1234, TRUE);
    ```
   * Updating data:
    ``` sql
      UPDATE tableName SET field='newValue' WHERE id=12345;
    ```
   * Delete data:
    ``` sql
      DELETE FROM tableName WHERE id=12345;
    ```

1. Explain the structure for each type of command.
   * add data: 
     * command: INSERT
     * location: INTO `tableName` 
     * content to add: VALUES (*content to insert*)
   * updating data:
     * command: UPDATE 'tableName'
     * content to change: **field_name**='*newValue*'
     * clause: WHERE id = 12345
   * deleting data:
     * command: DELETE
     * location: FROM tableName
     * clause: WHERE id = 12345
1. What are some of the data types that can be used in tables? Give a real-world example of each type.
   * Integers: street addresses
   * UUID: VIN numbers in cars
   * floating-point: currency and prices
   * text: bio in your linkedin profile.
1. Decide how to create a new table to hold a list of people invited to a wedding dinner. The table needs to have first and last names, whether they sent in their RSVP, the number of guests they are bringing, and the number of meals (1 for adults and 1/2 for children).

    * Which data type would you use to store each of the following pieces of information?
      * First and last name. - ***TEXT***
      * Whether they sent in their RSVP. - ***BOOLEAN***
      * Number of guests. - ***INTEGER***
      * Number of meals. - ***DECIMAL***
    * Write a command that creates the table to track the wedding dinner.
      ``` sql
        CREATE TABLE wedding_guests (
          id smallserial,
          FirstName varchar(32),
          LastName varchar(32),
          RSVP boolean,
          NumberOfGuests integer,
          NumberOfMeals integer
          );
      ```
    * Write a command that adds a column to track whether the guest sent a thank you card.
      ``` sql
        ALTER TABLE wedding_guests ADD COLUMN ThankYou boolean SET DEFAULT FALSE;
      ```
    * You have decided to move the data about the meals to another table, so write a command to remove the column storing the number meals from the wedding table.
      ```sql
        ALTER TABLE wedding_guests DROP COLUMN NumberOfMeals;
      ```
    * The guests will need a place to sit at the reception, so write a command that adds a column for table number.
      ```sql
        ALTER TABLE wedding_guests ADD COLUMN TableNumber integer;
      ```
    * The wedding is over and we do not need to keep this information, so write a command that deletes the table numbers from the database.
      ``` sql
        ALTER TABLE wedding_guests DROP COLUMN TableNumber;
      ```

1. Write a command to create a new table to hold the books in a library with the columns ISBN, title, author, genre, publishing date, number of copies, and available copies.
    ``` sql
      CREATE TABLE inventory (
        id smallserial,
        ISBN varchar(20),
        title text,
        author text,
        genre text,
        publishing_date date,
        total_copies integer,
        available_copies integer
      );
    ```
   * Find three books and add their information to the table.
      ``` sql
      INSERT INTO inventory (isbn, title, author, genre, publishing_date, total_copies, available_copies)
      VALUES('978-81-265-1336-9', 'Concepts and Applications of Finite Element Analysis', 'Robert D. Cook', 'Mathematical Modeling', '2019-01-11', 1,1),
      ('978-0-544-27299-6', 'What If?: Serious Scientific Answers to Absurd Hypothetical Questions', 'Randall Munroe', 'Self-Help', '2014-09-02', 5,5),
      ('978-0544668256','Thing Explainer: Complicated Stuff in Simple Words','Randall Munroe','Humor','2015-11-24',2,2);
      ```
   * Someone has just checked out one of the books. Change the number of available copies to 1 fewer.
    ``` sql
      UPDATE inventory SET available_copies=0 WHERE id = 2;
    ```
   * Now one of the books has been added to the banned books list. Remove it from the table.
    ``` sql
      DELETE FROM inventory WHERE id = 1;
    ```
1. Write a command to make a new table to hold spacecrafts. Information should include id, name, year launched, country of origin, a brief description of the mission, orbiting body, if it is currently operating, and its approximate miles from Earth. In addition to the table creation, provide commands that perform the following operations:
    ``` sql
      CREATE TABLE active_spacecraft (
        id varchar(24),
        name text,
        Launch_Year integer,
        Country text,
        Mission_Summary text,
        Orbiting_Body text,
        Operational boolean,
        Dist_Earth integer
      );
    ```
   * Add three non-Earth-orbiting satellites to the table.
    ``` sql
      INSERT INTO active_spacecraft (id,name, launch_year, country, mission_summary, orbiting_body, operational, dist_earth)
      VALUES('1998-073A','Mars Climate Orbiter',1998, 'USA', 'The Mars Climate Orbiter was a 338-kilogram (745 lb) robotic space probe launched by NASA on December 11, 1998 to study the Martian climate, Martian atmosphere, and surface changes and to act as the communications relay in the Mars Surveyor 98 program for Mars Polar Lander. However, on September 23, 1999, communication with the spacecraft was lost as the spacecraft went into orbital insertion, due to ground-based computer software which produced output in non-SI units of pound-force seconds (lbf·s) instead of the SI units of newton-seconds (N·s) specified in the contract between NASA and Lockheed. The spacecraft encountered Mars on a trajectory that brought it too close to the planet, and it was either destroyed in the atmosphere or re-entered heliocentric space after leaving the atmosphere.','Mars',TRUE,34000000),
      ('2007-034A','Phoenix',2007,'USA','Phoenix was a robotic spacecraft on a space exploration mission on Mars under the Mars Scout Program. The Phoenix lander landed on Mars on May 25, 2008. Mission scientists used instruments aboard the lander to assess the local habitability and to research the history of water there. The total mission cost was about US $386 million, which includes cost of the launch.','Mars',TRUE,34000000),
      ('2016-017A','ExoMars Trace Gas Orbiter', 2016,'ESA/Russia','The ExoMars Trace Gas Orbiter (TGO or ExoMars Orbiter) is a collaborative project between the European Space Agency (ESA) and Roscosmos that sent an atmospheric research orbiter and the Schiaparelli demonstration lander to Mars in 2016 as part of the European-led ExoMars programme.','Mars',TRUE,34000000);
    ```
   * Remove one of the satellites from the table since it has just crashed into the planet.
    ```sql
      DELETE FROM active_spacecraft WHERE id='1998-073A';
    ```
   * Edit another satellite because it is no longer operating and change the value to reflect that.
    ``` sql
      UPDATE active_spacecraft SET Operational=FALSE WHERE id='2007-034A';
    ```

1. Write a command to create a new table to hold the emails in your inbox. This table should include an id, the subject line, the sender, any additional recipients, the body of the email, the timestamp, whether or not you have read the email, and the id of the email chain it's in. Also provide commands that perform the following operations:
    ``` sql
      CREATE TABLE inbox (
        id smallserial,
        subject text,
        sender text,
        cc text,
        contents text,
        sent_at timestamp,
        unread boolean,
        threadid integer);
    ```
   * Add three new emails to the inbox.
    ``` sql
      INSERT INTO inbox (subject, sender, cc, contents, sent_at, unread, threadid)
      VALUES ('FWD: FWD: RE: FWD: Happy New Year~!', 'aleesia.algorithm@uw.edu','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum neque magna, id convallis lectus tincidunt bibendum. Donec ac lobortis.','2019-01-08 22:23:46',TRUE, NULL),
      ('Lorem Ipsum to go!', 'bboolean@nasa.gov','datad@comcast.net, chris.collection@outlook.com','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum neque magna, id convallis lectus tincidunt bibendum. Donec ac lobortis.','2019-01-10 07:08:09',FALSE, 22),
      ('Stop replying to the reply all!','datad@comcast.net','bboolean@nasa.gov','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum neque magna, id convallis lectus tincidunt bibendum. Donec ac lobortis.','2019-01-10 09:09:23',FALSE,22);

    ```
   * You deleted one of the emails, so write a command to remove the row from the inbox table.
    ``` SQL
      DELETE FROM inbox WHERE id = 1;
    ```
   * You started reading an email but just heard a crash in another room. Mark the email as unread before investigating the crash, so you can come back and read it later.
    ```sql
      UPDATE inbox SET unread=TRUE WHERE id = 3;
    ```