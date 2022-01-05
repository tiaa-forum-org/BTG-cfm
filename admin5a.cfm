<cfquery datasource="#attributes.dsn#" name="deletelogin">
	DELETE
	FROM login
	WHERE userid = #userid#
</cfquery>
<font color="Red">Login Deleted</font>
<cfinclude template="admin5.cfm">