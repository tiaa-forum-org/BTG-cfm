<cfquery name="getpass" datasource="#attributes.dsn#">
	SELECT *
	FROM login
	WHERE username='#user#'
</cfquery>
<cfif (#pass# is #getpass.password#) AND (#user# is #getpass.username#)>

<cfinsert datasource="#attributes.dsn#"
		  tablename="contacts"
		  formfields= "state, district, first, last, interest, city, zip, county, phone, email, added, current, gender, age, flang">
<cfinclude template="add1.cfm">

<cfelse>
<font face="Arial" size="4">Sorry, you must enter a correct username and password!<br>
<br>
<a href="login.cfm">Back to Login</a></font></center>
<!-- Here you are ending your statement for username and password -->
</cfif>