# Soundgood-Database-App
This is a repository created as a part of the course iv1351-data-storage-paradigms at KTH.
It's purpose is to be an interface to a database for the fictional music school Soundgood 
and display that the student is able to implement code that handles database transactions 
correctly.

## Application
The application is written in C++ for a Linux environment that has the [jtv/libpqxx](https://github.com/jtv/libpqxx)
library installed, see the link for instructions. There is no reason in particular why C++
was chosen as the primary language to develop the application. The language was simply
chosen due to an interest from the author's part.

### Application functionality
The functionality implemented is the functionality required by the course, which is why some
functionality may appear to be missing.

## Application view
The view layer was not a priority so it was hastily developed for proof of concept purposes.

## Database
The application is built for a PostgreSQL database on `localhost port 5432`, `dbname=soundgood`,
`user=postgres`,
`password=password`, so the database should be created accordingly.

The database can then be initiated with `initiate_database.sql` and the `add_database_views.sql`
in the scripts directory. There is test data available in `populate_database_with_test_data.sql`
as well, make sure that the scripts are run while connected to the correct database.

## Google Test
Tests have been omitted at the moment due to time constraint, not ideal.

## Style guide
The intention was to follow the Google Style Guide, mostly since it had good documentation.

## TODO
- [ ] Implement integration tests independent from the "production" database.
- [ ] Set up Docker containers to run the database and the application.
