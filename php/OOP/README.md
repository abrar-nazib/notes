# Object Oriented PHP

## Class

Definition syntax:

```php
class ClassName{  //naming convention for classes: CamelCase
    //class definitions
    var $property; //class properties
}
$declared_classes = get_declared_classes(); //returns all declared classes in an array
```

## Class Methods

Class methods are simply functions defined inside a class\
Syntax:

```php
class ClassName{

function method_name($parameter){
    //method definition
}

}
$declared_methods = get_class_methods('ClassName'); //returns all methods of the parameter class inside an array
```

## Class Properties

```php
class ClassName{
    var $property = "property value"; //the var keyword is used for class variables
    function ClassFunction(){
        echo $this->property; //syntax for accessing class properties inside class definition 
    }
}
$object = new ClassName();
$object->property; //accessing object property not $object->$property
```

## Class Instantiation

Creating objects from a class\
Syntax:

```php
class ClassName{
    //class definition
    private static function instantiation_inside_functions(){
        $object = new self;
    }
}
$object = new ClassName();
$object->method(); // calls a method defined inside the class definition
```

## Class Inheritance

Syntax:

```php
class BaseClass{
    //class definition
}
class SubClass extends BaseClass{
    //extra features
}
```

## Access Control

**Public**:\
Property or method accessible anywhere in the program\

```php
class ClassName{
    public $property = "property value"; //substituted with var
}
```

**Private**:\
Property or method accessible only inside the class definition\

```php
class ClassName{
    private $property = "property value"; //substituted with var
}
```

**Protected**:\
Property or method accessible only inside the class definition and sub-classes\

```php
class ClassName{
    protected $property = "property value"; //substituted with var
}
```

## Static Modifiers

Normal properties can not be accessed without creating an object of that class. But static propeprties and methods can be accessed\
Static properties and methods can be accessed using the class name. No object needs to be created./
*Static methods can only work with static properties*

```php
class ClassName{
    static $property = "property value";
    
    static function static_method(){  //
        echo ClassName::$property;
        echo self::$property; //self could be used inside class definition
    }

}
//----------------------Accessing static methods in subclasses------------------------------
class InstanceName extends ClassName{
    static function access(){
        parent::static_method();
    }
}

//----------------------Accessing class methods and properties in global context-----------------------
echo ClassName::$property; //syntax to access statice properties
                           //Need to use the $ sign while accessing static properties
ClassName::static_method();
```

## Class Constructors and Destructors

Constructor is a method which is called whenever an object is created from any class\
Destructor is a method which is called whenever an object is destroyed\

```php
class MyClass{
    function __construct(){
        //constructor definition
    }
    function __destruct(){
        //destructor definition
    }
}
```

## Mysql Functions

```php
//--------------- Making a connection to the database -------------------
$connection = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME); 
//--------------- Error handling ----------------------------------------
$connection->connect_errno; // returns false if there is no error or integer of the error
$connection->connect_error; //returns connection error message in a string
$connection->error; //returns any type of error message in a string
//--------------- Query escaping ----------------------------------------
$connection->real_escape_string($string); //escapes strings having special characters
mysqli::real_escape_string($string) : string //could be done in static way as well
//--------------- Query -------------------------------------------------
$result = $connection->query($sql_query); //returns the result
mysqli::query ( string $query , int $result_mode = MYSQLI_STORE_RESULT ) : mysqli_result|bool  // the second parameter is not necessary
```
