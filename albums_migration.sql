USE codeup_test_db;
DROP TABLE IF EXISTS album;
create table albums(
    id int unsigned auto_increment not null,
    artist VARCHAR(50),
    name varchar(50),
    release_date INT,
    sales FLOAT,
    genre VARCHAR(50),
    PRIMARY KEY (ID)
);
DESCRIBE ALBUMS;
SELECT * FROM albums;
