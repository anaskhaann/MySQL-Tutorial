## Create a Basic Crud Using Python

- Connect to Sqlite3 with Prebuild DB
- Create A register and Search Function
- Create Connection and Cursor Object for performing queries
- Use concept of class for Connecting to database when menu is shown

### Types of Sql Commands
- DDL Commands
- DML Commands
- DCL Commands
- TCL Commands

#### Data Definition Language (DDL Commands)

1. CREATE
This command is used to Create a Table/ Database Object
Example
```
CREATE TABLE table_name(
    name VARCHAR, id INT etc.
)
```
Or
```
CREATE DATABASE IF NOT EXISTS db_name
```

2. DROP
This command is used to Drop existing Table/ Database i.e to Delete a Table/ Database
Example
```
DROP TABLE table_name
```
Or
```
DROP DATABASE db_name
```


3. ALTER
This command is used to modify existing objects


4. TRUNCATE
This command is used to Empty a Table i.e Remove all the rows from the Table
Example
```
TRUNCATE TABLE table_name
```


#### Data Manipulation Language (DML Commands)

1. SELECT
This command is used to Select/Retrieve data from a Database.

2. INSERT
This command is used to Insert new rows into a Table.

3. UPDATE
This command is used to Update existing rows in a Table.

4. DELETE
This command is used to Delete existing rows from a Table.

#### Data Control Language (DCL Commands)

1. GRANT
This command is used to provide access or privileges on the Database objects to the Users.

2. REVOKE
This command is used to take back the access or privileges on the Database objects from the Users.


#### Transaction Control Language (TCL Commands)    

1. COMMIT
This command is used to save the transaction or changes.

2. ROLLBACK
This command is used to undo the changes made in the transaction.


#### For Reference Visit
- [Sql Commands](https://www.sqltutorial.org/sql-cheat-sheet/)
- [W3 Schools](https://www.w3schools.com/sql/default.asp)
- [Sqlite3](https://www.sqlite.org/index.html)
