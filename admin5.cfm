<cfinclude template="translatit.cfm">
<cfquery name="getpass" datasource="#attributes.dsn#">
	SELECT *
	FROM login
	WHERE username='#user#'
</cfquery>
<cfif (#pass# is #getpass.password#) AND (#user# is #getpass.username#)>
<cfif (#getpass.adminlevel# is 2)>
<center>
<cfform action="loginpost.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="level" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="Back to Admin Page" name="b1">
                    </cfform>



<cfquery datasource="#attributes.dsn#" name="getlogin">
	SELECT *
	From login
	ORDER BY district
</cfquery>
<table>
	<tr>
		<td colspan="3" align="center">
			<h2>Delete Login </h2>
		</td>
<cfoutput query="getlogin">		
	</tr>
	<tr>
<td>
<cfform action="admin5a.cfm" method="POST">
<cfinput type="submit" value="Delete " name="b2" style="width: 100; height: 24; background-color: white;"  size=35>
			<cfinput type="Hidden" name="pass" value="#getpass.password#">
			<cfinput type="Hidden" name="user" value="#getpass.username#">
<cfinput type="hidden" value="#userid#" name="userid" >
</cfform>
	</td>
		<td valign="top" align="left"><font size="5">#district#</font></td>
		<td valign="top" align="left"><font size="5">#username#</font></td>
	</tr>
</cfoutput>	
</table>
</center>	
<br><br><br>
<cfelse>
You are not authorized to access this function<br />
<cfform action="loginpost.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="level" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="Back to Admin Page" name="b1">
                    </cfform>
</cfif>
<cfelse>
<font face="Arial" size="4">Sorry, you must enter a correct username and password!<br>
<br>
<a href="login.cfm">Back to Login</a></font></center>
<!-- Here you are ending your statement for username and password -->
</cfif>    