<cfset urlregex="refindnocase('b[CEFHILNTPS]+:/{2}[A-Z0-9.]+.[A-Z0-9./_%-?]+b'," rawmsg,="" 1,="" true)="">

<cfif urlregex.len[1]="" neq="" 0="">
        <cfset urlstring="trim(mid(rawmsg," urlregex.pos[1],="" urlregex.len[1]))="">
        <cfset hyperlink="<a href="" &="" trim(urlstring)="" '"="" target="_blank">' & trim(urlstring) & '' />
        <cfset htmlmsg="replaceNoCase(rawmsg," urlstring,="" hyperlink,="" 'all')="">
</cfset></cfset></cfset></cfif>

<cfoutput>
<p>#htmlmsg#</p>
</cfoutput>
</cfset></cfset>
