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
