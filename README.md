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
