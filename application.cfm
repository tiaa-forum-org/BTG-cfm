<CFAPPLICATION NAME="contacts"
	CLIENTMANAGEMENT="Yes"
	SESSIONMANAGEMENT="Yes"
	SESSIONTIMEOUT="#CreateTimeSpan(0,0,30,0)#"
	APPLICATIONTIMEOUT="#CreateTimeSpan(0,1,0,0)#">
<CFSET attributes.dsn="btg">
<CFSET attributes.path="/">
<CFSET here = "">
<CFSET lpath= "">


 