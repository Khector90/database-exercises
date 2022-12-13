
-- # Guide to Database Design
--
-- #### Normalization
--
-- The process of "normalizing" a relational database design. Different levels of normalization are possible, each level further seperating concerns and abstracting data over multiple tables.
--
-- #### Entity Relationship Diagram (ERD)
--
-- A way to visually describe the schema of a database and the relationships between tables.
--
-- #### One-to-One Relationship
-- - ***Definition:*** a relationship where one record on a table matches with one record on another table.
-- - ***Example:*** users and user_details
-- - ***Common strategy to implement:*** the owner table of the relationship should have a foreign key to the non-owner.
--
-- #### One-to-Many Relationship
--
-- - ***Definition:*** a relationship where one record on a table matches with several records on another table.
-- - ***Example:*** users and posts
-- - ***Common strategy to implement:*** the table on the many side should have a foreign key pointing to the single owner from the owning-side table.
--
-- #### Many-to-Many Relationship
--
-- - ***Definition:*** a relationship where one record on a table matches with several records on another table and a record on the other table matches with several records on the first table.
-- - ***Example:*** users and events
-- - ***Common strategy to implement:*** neither table should have a foreign key to the other and instead, an associative (join) table should be used to link the two together via two foreign key columns, each linking to a primary key of both tables in the many-to-many relationship.
--
-- <div style="page-break-after: always;"></div>
--
-- ## DB Design Conventions to Follow
--
-- 1. All tables except associative tables should have a single primary key called id.
--
-- 	```
-- 	users
-- 	  id
-- 	  username
-- 	  email
-- 	  password
-- 	```
--
-- 2. All table cells must contain atomic data (a single cell cannot contain multiple values).
--
-- 	```
-- 	  users
-- 	    id
-- 	    username
-- 	    phone_numbers
--
-- 	  1 | bob123| 2105554545, 2105556767, 2105553232 <--- AVOID THIS!
-- 	```
--
--
-- 3. All columns within a single row should be independent from one another (if not, another table may be needed).
--
-- 	```
-- 	  users
-- 	    id
-- 	    name
-- 	    favorite_color_1
-- 	    favorite_color_2
--
--       A better alternative...
--
-- 	  users
-- 	    id
-- 	    name
--
-- 	  colors
-- 	    id
-- 	    name
--
-- 	  color_user
-- 	    color_id
-- 	    user_id
-- 	```
--
-- 4. When duplicate values exist accross multiple rows, consider breaking out the column(s) into another table.
--
--   ```
--   users
--       id
--       username
--       email
--       password
--       home_state
--
--   1 | bob123 | bob@email.com | JKL3J2JHSURNZ931H | Texas
--   2 | kev123 | kev@email.com | JKL3J2JHSURNZ931H | Texas <--- duplicate!
--   3 | dan123 | dan@email.com | JKL3J2JHSURNZ931H | Arizona
--   4 | mat123 | mat@email.com | JKL3J2JHSURNZ931H | Washington
--   5 | rob123 | rob@email.com | JKL3J2JHSURNZ931H | Texas <--- duplicate!
--
--   Consider a states table.
--  ```
--
-- ## Helpful Links
--
-- ##### Additional Info
--
-- - ERDs Explained: [https://www.lucidchart.com/pages/er-diagrams](https://www.lucidchart.com/pages/er-diagrams)
-- - Guide to Crow's Foot notation: [https://www.vertabelo.com/blog/crow-s-foot-notation/](https://www.vertabelo.com/blog/crow-s-foot-notation/)
--
-- ##### ERD Creation Apps
--
-- - [draw.io](https://google.com)
-- - [lucidchart](https://www.lucidchart.com)
-- - [sqldbm](https://sqldbm.com)
-- - Don't forget about good 'ol pencil and paper or a whiteboard!
use codeup_test_db;

CREATE TABLE authors (
                         id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                         first_name VARCHAR(50),
                         last_name  VARCHAR(100) NOT NULL,
                         PRIMARY KEY (id));

INSERT INTO authors(first_name, last_name) VALUES
                                               ('Douglas', 'Adams'),
                                               ('Mark', 'Twain'),
                                               ('Kurt', 'Vonnegut');

CREATE TABLE quotes (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        content TEXT NOT NULL,
                        author_id INT UNSIGNED NOT NULL,
                        PRIMARY KEY (id),
                        FOREIGN KEY (author_id) REFERENCES authors (id)
);

INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
        'I love deadlines. I love the whooshing noise they make as they go by.');
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
        'Time is an illusion. Lunchtime doubly so.');
INSERT INTO quotes (author_id, content)
values ((select id from authors where first_name = 'Mark' and last_name = 'Twain'),
        'Clothes make the man. Naked people have little or no influence on society.');
INSERT INTO quotes (author_id, content)
values ((select id from authors where first_name = 'Kurt' and last_name = 'Vonnegut'),
        'The universe is a big place, perhaps the biggest.');
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'), 'Don''t Panic.');

CREATE TABLE topics (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        name VARCHAR(255),
                        PRIMARY KEY (id)
);

INSERT INTO topics(name) VALUES
                             ('Space and Time'),
                             ('Humor'),
                             ('Office Life'),
                             ('Hitchiker''s Guide to the Galaxy');

CREATE TABLE quote_topic (
                             quote_id INTEGER UNSIGNED NOT NULL,
                             topic_id INTEGER UNSIGNED NOT NULL,
                             FOREIGN KEY (quote_id) REFERENCES quotes(id),
                             FOREIGN KEY (topic_id) REFERENCES topics(id)
);

INSERT INTO quote_topic(quote_id, topic_id)
VALUES (1, 2), (1, 3), (2, 4), (3, 1),
       (3, 2), (3, 3), (3, 4), (4, 2), (5, 1);