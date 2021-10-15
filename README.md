# Bookmark Manager

The website should have the following specification:

* Show a list of bookmarks ✓
* Add new bookmarks ✓
* Delete bookmarks ✓
* Update bookmarks ✓
* Comment on bookmarks ✓
* Tag bookmarks into categories
* Filter bookmarks by tag
* Users are restricted to manage only their own bookmarks

Domain Model
-----

![Bookmark Manager Domain Model](/model.png?raw=true "Bookmark Manager Domain Model")

User Stories
-----

```
As a user,
So that I can keep track of my favourite websites,
I want to see a list of bookmarks.
```

```
As a user,
So that I can store my favourite websites,
I want to be able to add a new bookmark.
```

```
As a user
So I can remove my bookmark from Bookmark Manager
I want to delete a bookmark
```

```
As a user
So I can change a bookmark in Bookmark Manager
I want to update a bookmark
```

```
As a user
So that the bookmarks I save are useful
I want to only save a valid URL
```

```
As a user
So that I can make interesting notes
I want to add a Comment to a Bookmark
```

## DB Set up instructions

* Start PostgreSQL using command:
```
psql
```
* Create a database using the psql command:
```
CREATE DATABASE bookmark_manager;
```
* Connect to the database using the pqsl command
```
\c bookmark_manager;
```
* Run the query we have saved in the file 01_create_bookmarks_table.sql

## Sample SQL Injection Code
"Google' ); DROP TABLE bookmarks; --' )"
