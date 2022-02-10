# SQL injection

## Links

[Hacktricks cheat sheet](https://book.hacktricks.xyz/pentesting-web/sql-injection)

## Detection

- '
- "
- `# comment`
- `/*comment*/`
- `-- comment` The space after two dash is important


## Sqlite commands

These type of sql systems are called flat file sql

- `sqlite3 databaseName.db` in bash to access the database and open in sqlite client
- `.help` shows the necessary help to get started
- `.tables` shows the tables available
- `PRAGMA table_info(table_name);` shows the information or schematic about the specified table
- 