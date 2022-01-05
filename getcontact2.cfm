<cfinclude template="translatit.cfm">
<cfquery name="getpass" datasource="#attributes.dsn#">
	SELECT *
	FROM login
	WHERE username='#user#'
</cfquery>
<cfif (#pass# is #getpass.password#) AND (#user# is #getpass.username#)>

<center>
 <cfform action="getcontact1.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="Back to full list" name="b0">
                    </cfform>
</center>                    
<cfquery name="getcontact" datasource="#attributes.dsn#">
SELECT *
FROM contacts 
WHERE 0=0
	<CFIF parameterexists (gender1) IS "yes">
    <cfif parameterexists (gender) IS "yes">
	AND((gender) = '#gender#')
    </cfif>
	</cfif>
	<CFIF parameterexists (city1) IS "yes">
	AND ((City) = '#city#')
	</cfif>
	<CFIF parameterexists (zip1) IS "yes">
	AND ((Zip) LIKE '%#zip#%')
	</cfif>
	<CFIF parameterexists (interest1) IS "yes">
	AND (((interest) = '#interest#') OR ((interest)='both'))
	</cfif>
	<CFIF parameterexists (statepart1) IS "yes">
	AND ((district) = #district#)
	</cfif>
    <CFIF parameterexists (gender1) IS "yes">
    ORDER BY gender
    </CFIF>
	<CFIF parameterexists (flang1) IS "yes">
    AND ((flang) = #flang1#)
    </CFIF>
</cfquery>	
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
			<tr><td colspan="7"><hr></td></tr>
		<cfoutput query="getcontact">
		<cfset c=0>
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
				<td colspan="8"><hr color="000000"></td>
			</tr>
        <cfset c=c+1>
		</cfoutput>
		</table>
		<hr color="white">
        <cfif c eq 0>
<center>
<font size="5">Sorry, No Contacts match what you are looking for.<br>
Please go back and try a more general search.<br>
</font>
</center>
</cfif>
		</center>
		



<br><br><br>
<cfelse>
<font face="Arial" size="4">Sorry, you must enter a correct username and password!<br>
<br>
<a href="login.cfm">Back to Login</a></font></center>
<!-- Here you are ending your statement for username and password -->
</cfif>