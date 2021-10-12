```
As a user,
So that I can see the sites I want to go back to,
I'd like to see a list of sites I have bookmarked.
```
```
As a user,
So that I can remember a site I want to go back to,
I'd like to add it to a list
```


![Installation](user_story_1.drawio.svg)


## Setting up the database
- psql postgres
- CREATE DATABASE bookmark_manager;
- \c bookmark_manager;
- inside db/migrations, enter the query
- \q to exit postgresql
- CREATE DATABASE "bookmark_manager_test";
- CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
- run psql for both databases


The website will have the following specification:

Show a list of bookmarks
Add new bookmarks
Delete bookmarks
Update bookmarks
Comment on bookmarks
Tag bookmarks into categories
Filter bookmarks by tag
Users are restricted to manage only their own bookmarks

