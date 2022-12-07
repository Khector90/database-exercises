USE codeup_test_db;

Select name as 'albums' from albums;

select release_date as 'All albums released'from albums where release_date < 1980;

select artist as 'Albums by Micheal Jackson' from albums where artist = 'Micheal Jackson';

update albums set sales = (sales * 10);
select sales from albums where sales >= 20;


# a different way to do the 3 b
UPDATE albums
SET release_date = 1800
WHERE release_date < 1980;




# update albums from release_date where albums.release_date < 1980 set = 1800;
# the above line failed didn't think about using subtraction thank you dustin
update albums set release_date = release_date - 100 where release_date < 1980;
select release_date from albums;


update albums set artist = 'Peter Jackson' where artist = 'Micheal Jackson';
select artist from albums;



