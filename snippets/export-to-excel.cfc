<CFQUERY NAME="ExportData" DATASOURCE="test">
SELECT field1, field2, field3
FROM tablename
WHERE conditions
</CFQUERY>
     <CFSET tempfile = "C:tempexptemp.csv">

<!--- The "spaces" in the text below are TAB characters. Do not change them
to spaces otherwise the Excel export will not work --->

<CFSET output = "">
<CFSET output = output & "field1     field2     field3">

<CFFILE ACTION="WRITE"
     FILE="#tempfile#"
     OUTPUT="#output#">

<CFLOOP QUERY="GetList">
     <CFSET output = "">
     <CFSET output = output & "#field1#     #field2#     #field3#>
     <CFFILE ACTION="APPEND"
          FILE="#tempfile#"
          OUTPUT="#output#">
</CFLOOP>

     <CFCONTENT TYPE="application/excel" FILE="#tempfile#">
