<cfinclude template="translatit.cfm">
<cfquery name="getpass" datasource="#attributes.dsn#">
	SELECT *
	FROM login
	WHERE username='#user#'
</cfquery>
<cfif (#pass# is #getpass.password#) AND (#user# is #getpass.username#)>

<cfif (#getpass.adminlevel# is 2)>

		<cfquery datasource="#attributes.dsn#" name="getcontact">
			SELECT *
			FROM contacts
			ORDER BY city, zip, interest
		</cfquery>
        
 <cfelse> 
        
        <cfquery datasource="#attributes.dsn#" name="getcontact">
			SELECT *
			FROM contacts
            WHERE district = #getpass.district#
			ORDER BY city, zip, interest
		</cfquery>
</cfif>

	<cfset c=0>
    <center>
 <cfform action="getcontact1.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="Search for a Contact" name="b1">
                    </cfform>
		<table>
			<tr>
				<td align="left" valign="top">
					<font color="darkblue" size="4">State<br>District</font>
				</td>
				<td align="left" valign="top">
					<font color="darkblue" size="4">Name</font>
				</td>
				<td align="left" valign="top">
					<font color="darkblue" size="4">Address</font>
				</td>
				<td align="left" valign="top">
					<font color="darkblue" size="4">Gender<br>Age</font>
				</td>
				<td align="left" valign="top">
					<font color="darkblue" size="4">Phone<br>Email</font>
				</td>
				<td align="center" valign="top">
					<font color="darkblue" size="4">Interest<br>T/C</font>
				</td>
				<td align="center" valign="top">
					<font color="darkblue" size="4">Spanish<br>Speaking</font>
				</td>
				<td align="right" valign="top">
					<font color="darkblue" size="4">Last<br>Updated</font>
				</td>
			</tr>
			<tr><td colspan="9"><hr></td></tr>
		<cfoutput query="getcontact">
			<tr>
				<td align="left" valign="top"><font color="darkblue">#state# <br> District #numberformat(district,99)#&nbsp;&nbsp;</font></td>
				<td align="left" valign="top"><font color="darkblue">#first# #last#&nbsp;&nbsp;</font></td>
				<td align="left" valign="top"><font color="darkblue">#address#&nbsp;&nbsp;<br>#city#  #zip#&nbsp;&nbsp;</font></td>
				<td align="left" valign="top"><font color="darkblue">#gender#<br>#age#</font></td>
				<td align="left" valign="top"><font color="darkblue">#phone#<br>#email#</font></td>
				<td align="center" valign="top"><font color="darkblue">#interest#</font></td>
                <td align="center" valign="top" nowrap="nowrap"><font color="darkblue"><cfif #flang# is "yes">yes<cfelse></cfif></font></td>
				<td align="right" valign="top"><font color="darkblue">#dateformat(added, "mm/dd/yyyy")#</font></td>
			</tr>
			<tr>
				<td colspan="9"><hr color="000000"></td>
			</tr>
		</cfoutput>
		</table>
		<hr color="white">
		</center>
		



<br><br><br>
<cfelse>
<font face="Arial" size="4">Sorry, you must enter a correct username and password!<br>
<br>
<a href="login.cfm">Back to Login</a></font></center>
<!-- Here you are ending your statement for username and password -->
</cfif>