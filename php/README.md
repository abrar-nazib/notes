# Notes On PHP

## Output buffering

This function starts output buffering.

```php
obs_start();
```

## Include and Require

The ```require_once()``` expression is identical to require except PHP will check if the file has already been included, and if so, not include (require) it again

## Mysql functions

* [```mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME): mysqli|false```](https://www.php.net/manual/en/mysqli.construct.php)\
    Returns a connection object or false if failed to connect

* [```mysqli_connect_errno ( ) : int```](https://www.php.net/manual/en/mysqli.connect-errno.php)\
    Returns an error code for the last connection attempt, if it failed. Zero means no error occurred.

* [```mysqli_error ( mysqli $mysql ) : string```](https://www.php.net/manual/en/mysqli.error.php)\
    Returns the last error message for the most recent MySQLi function call that can succeed or fail.

* [```mysqli_query ( mysqli $mysql , string $query , int $result_mode = MYSQLI_STORE_RESULT ) : mysqli_result|bool```](https://www.php.net/manual/en/mysqli.query.php)\
    Performs a query against the database.

* [```mysql_real_escape_string ( string $unescaped_string , resource $link_identifier = NULL ) : string```](https://www.php.net/manual/en/function.mysql-real-escape-string.php)\
    Escapes special characters in a string for use in an SQL statement

* [```mysqli_fetch_array ( mysqli_result $result , int $mode = MYSQLI_BOTH ) : array|null|false```](https://www.php.net/manual/en/mysqli-result.fetch-array.php)\
    Fetch a result row as an associative, a numeric array, or both

* [```mysqli_fetch_assoc ( mysqli_result $result ) : array|null|false```](https://www.php.net/manual/en/mysqli-result.fetch-assoc.php)\
    Returns an associative array. Doesn't fetch as numeric{fetch_array fetches numeric as well}

## Object Functions

* [```get_object_vars ( object $object ) : array```](https://www.php.net/manual/en/function.get-object-vars.php)\
    This function gets the properties of the given object

## Array Functions

* [```array_key_exists ( string|int $key , array $array ) : bool```](https://www.php.net/manual/en/function.array-key-exists.php)\
    Checks if the given key or index exists in the array

* [```array_shift ( array &$array ) : mixed```](php.net/manual/en/function.array-shift.php)\

    ```php
    $stack = array("orange", "banana", "apple", "raspberry");
    $fruit = array_shift($stack);
    print_r($stack);
    Array
    (
    [0] => banana
    [1] => apple
    [2] => raspberry
    )
    and 'orange' will be assigned to $fruit.
    ```

* [```array_push ( array &$array , mixed ...$values ) : int```](https://www.php.net/manual/en/function.array-push.php)\
    Push one or more elements onto the end of array

## String functions

* [```strtolower ( string $string ) : string```](https://www.php.net/manual/en/function.strtolower)\
    Makes a string all lower case.

## Session Functions

* [```session_start ( array $options = [] ) : bool```](https://www.php.net/manual/en/function.session-start.php)\
    Starts a new session or resumes the existing session.
* [```unset ( mixed $var , mixed ...$vars ) : void```](https://www.php.net/manual/en/function.unset.php)\
    Used to unset a variable. Specially used in unsetting Session variables;

## HTTP Header functions

* [```header ( string $header , bool $replace = true , int $response_code = 0 ) : void```](https://www.php.net/manual/en/function.header.php)\
    Used to send a raw http header. ```header('Location: index.php')``` is used to redirect.

## Security functions

* [```trim ( string $string , string $characters = " \n\r\t\v\0" ) : string```](https://www.php.net/manual/en/function.trim.php)\
    Removes the specified characters from a string. If the second parameter is not set then whitespaces are removed.
* [```htmlentities( string $string, int $flags = ENT_COMPAT, string|null $encoding = null, bool $double_encode = true): string```](https://www.php.net/manual/en/function.htmlentities.php)\
    Converts all applicable characters to html entities.
