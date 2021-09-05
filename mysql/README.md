# **MySQL Notes**

## **Database level basic commands**

---

### Theoretical part

* Database is combination of data tables

### Connecting to a database

For Command Line:

```bash
mysql -u <username> -p 			# will prompt for a password for the specified username
								# Ctrl+L will clear the cli screen
```

### Listing all databases

```sql
show databases;
```

### Creating new databases

```sql
CREATE DATABASE <name>;			# Creates a database with the specified name
								# Database names could be either underscore_convensioned(snake_case) or CamelCased. Spaces in names are discouraged

```

### Deleting Databases

```sql
DROP DATABASE <name>;		# Delete the database with the specified name
```

### Selecting Databases

```sql
USE <database_name>;			# Selects the specified database to read/write data
SELECT database();				# will show the database which is currently being used
```

## **Table Level basic commands**

### Theoretical part

* **Minimal:** Tables hold the data
* **Wikipedia Version:** A collection of related data held in a structured format within database.
* **Columns:** Headers of a data table.
* **Rows:** The actual data in the database.

### Showing data from existing tables

```sql
SHOW TABLES;	# shows the tables in the selected database
SHOW COLUMNS FROM <table_name>; # shows columns of specified table.
DESC <table_name>; 		# DESC=describe s table. shows the columns of the specified table
```

### Creating Tables

```sql
CREATE TABLE table_name
	(
		column_name data_type,
		column_name data_type,
	);
##########EXAMPLES##############
CREATE TABLE users
	(
		user_id 	  INT,
		user_name     VARCHAR(15),
		user_password VARCHAR(32)
	);
```

### Deleting a table

```sql
DROP TABLE <table_name>;		# deletes the specified table
```

## **Data Types**

* **Numeric:**
	* **INT**
	* SMALLINT
	* TINYINT
	* MEDIUMINT
	* BIGINT
	* DECIMAL
	* NUMERIC
	* FLOAT
	* DOUBLE
	* BIT
* **String:**
	* CHAR
	* **VARCHAR:** A variable length string.(between 1-255 characters)
	* BINARY
	* VARBINARY
	* BLOB
	* BLOB
	* TINYBLOB
	* MEDIUMBLOB
	* LONGBLOB
	* TEXT
	* TINYTEXT
	* MEDIUMTEXT
	* LONGTEXT
	* ENUM
* **Date:**
	* DATE
	* DATETIME
	* TIMESTAMP
	* TIME
	* YEAR

## **Inserting Data**

### Single Insertion

```sql
INSERT INTO <table_name>(column1, column2)
VALUES ('value1', 'value2');

INSERT INTO users(username, password)
VALUES ('abrar', '12345'); 
```

### Multiple Insertion

```sql
INSERT INTO <table_name>(column1, column2)
VALUES  ('1_value1', '1_value2')
       ,('2_value1', '2_value2')
	   ,('3_value1', '3_value2');
```
