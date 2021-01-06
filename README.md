# Soundgood-Database-App
This is a repository created as a part of the course iv1351-data-storage-paradigms at KTH.
It's purpose is to be an interface to a database for the fictional music school Soundgood 
and display that the student is able to implement code that handles database transactions 
correctly.

## Evaluation of iv1351-data-storage-paradigms
The scripts created in the project tasks can be found in the directory `scripts`.
- `scripts/initiate_database.sql` corresponds to  task 2.
- `scripts/add_database_views.sql` corresponds to task 3.
- `scripts/populate_database_with_test_data.sql` is the script used to insert test data.
- The other tasks are handled in the project report.

## Application
The application is written in C++ for a Linux environment that has the 
[jtv/libpqxx](https://github.com/jtv/libpqxx)
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
`password=example`, so the database should be created accordingly or be set up by following either
of the below instructions.

### Setting up the database and application with docker
1. Install, enable and start `docker` in the appropriate way for your Linux distribution.
2. Run `docker pull postgres` unless already done.
3. Start the docker container by running the following command, be sure to replace 'path_to_scripts'
   with the actual path to the scripts in the repository.
   `docker run --name testpostgres -e POSTGRES_PASSWORD=example 
   --mount src=path_to_scripts,target=/host_files,type=bind -d postgres`.
4. Determine which IP address is assigned to the docker container by running the command
   `docker inspect testpostgres | grep '"IPAddress": '`.
5. In the config string in main.cpp replace the localhost IP address in the line 
   `"hostaddr=127.0.0.1 "` with the actual IP address assigned.
6. Connect to the database by running `docker exec -it testpostgres /bin/bash`
   and then run `psql -U postgres`.
7. Initiate the database with the command `CREATE DATABASE soundgood;
   \c soundgood \i host_files/initiate_database.sql
   \i host_files/add_database_views.sql
   \i host_files/populate_database_with_test_data.sql`. To skip the import of testdata
   simply omit the last part `\i host_files/populate_database_with_test_data.sql`.
8. Build and run the project.

### Setting up the database and application without docker
1. Install `postgres` in the appropriate way for your Linux distribution including
   enabling and starting the service.
2. Make sure that the user `postgres` has the correct password, in this case it can be
   appropriate to run `sudo -u postgres psql` and then 
   `ALTER USER postgres WITH PASSWORD 'example';`.
3. Connect to the database by running the command `psql -U postgres`.
4. Perform step 7 in the above instruction, but be sure to replace the paths to the scripts
   since they will not be correct anymore.
5. Build and run the project.

## Google Test
Tests have been omitted at the moment due to time constraint, not ideal.

## Style guide
The intention was to follow the Google Style Guide, mostly since it had good documentation.

## TODO
- [ ] Implement integration tests independent from the "production" database.
- [ ] Set up Docker container to run the application from.
