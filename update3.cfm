<cfinclude template="translatit.cfm">
<cfquery name="getpass" datasource="#attributes.dsn#">
	SELECT *
	FROM login
	WHERE username='#user#'
</cfquery>
<cfif (#pass# is #getpass.password#) AND (#user# is #getpass.username#)>

<CENTER>

<cfquery datasource="#attributes.dsn#" Name="update3">
	DELETE FROM contacts
	WHERE contactid = #contactid#
</cfquery>
<cfinsert datasource="#attributes.dsn#"
		  tablename="contacts"
		  formfields= "state, district, first, last, interest, city, zip, county, phone, email, added, current, gender, age">
          <center> 
<font color="red" size="6">the Contact Information has been updated</font><br>
<cfinclude template="update1.cfm">
</center>
<br><br><br>
<cfelse>
<font face="Arial" size="4">Sorry, you must enter a correct username and password!<br>
<br>
<a href="login.cfm">Back to Login</a></font></center>
<!-- Here you are ending your statement for username and password -->
</cfif> 