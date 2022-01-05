<cfinclude template="translatit.cfm">
<cfquery name="getpass" datasource="#attributes.dsn#">
	SELECT *
	FROM login
	WHERE username='#user#'
</cfquery>
<cfif (#pass# is #getpass.password#) AND (#user# is #getpass.username#)>


<center>
<cfform action="loginpost.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="Back to Admin Page" name="b0">
                    </cfform>
<cfif (#getpass.adminlevel# is 2)>
<cfquery datasource="#attributes.dsn#" name="getcontact">
	SELECT *
	FROM contacts
	ORDER BY county
</cfquery>
<cfelse>
<cfquery datasource="#attributes.dsn#" name="getcontact">
	SELECT *
	FROM contacts
	WHERE district like #getpass.district#
	ORDER BY county
</cfquery>	
</cfif>
	
		<table>
			<tr>
			<cfoutput>
				<td>&nbsp;</td>
				<td align="left" valign="top">
                    <cfform action="delete1a.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="District" name="b1">
                    </cfform>
				</td>
				<td align="left" valign="top">
                    <cfform action="delete1b.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="Name" name="b2">
                    </cfform>
				</td>
				<td align="left" valign="top">
                    <cfform action="delete1c.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="City and Zip" name="b3">
                    </cfform>
				</td>
				<td align="left" valign="top">
                    <cfform action="delete1e.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="County" name="b4">
                    </cfform>
				</td>
				<td align="center" valign="top">
                    <cfform action="delete1d.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="Gender/Age" name="b5">
                    </cfform>
				</td>
				<td align="right" valign="top">
					<font color="darkblue" size="4">Phone<br>Email</font>
				</td>
				<td align="center" valign="top">
                    <cfform action="delete1g.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="Spanish" name="b6">
                    </cfform>
				</td>
				<td align="center" valign="top">
                    <cfform action="delete1f.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="T/C" name="b7">
                    </cfform>
				</td>
				<td align="right" valign="top">
					<font color="darkblue" size="4">Last<br>Updated</font>
				</td>
            </cfoutput>
			</tr>
			<tr>
            	<td colspan="10" align="center">
                	<hr>
                    	<font size="2">click on buttons to resort by that column</font>
                    <hr />
                </td>
            </tr>
	<cfoutput query="getcontact">
	<tr>
		<td>
			<cfform method="post" action="delete2.cfm">
				<cfinput type="submit" value="Delete" name="edit">
				<cfinput type="Hidden" name="pass" value="#getpass.password#">
				<cfinput type="Hidden" name="user" value="#getpass.username#">
				<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
				<cfinput type="hidden" name="contactid" value="#contactid#" size=3>
			</cfform>
		</td>
        <td align="left" valign="top"><font color="darkblue">#state# <br> District #numberformat(district,99)#&nbsp;&nbsp; <br />#statepart#</font></td>
		<td align="left" valign="top"><font color="darkblue">#first# #last#&nbsp;&nbsp;</font></td>
		<td align="left" valign="top"><font color="darkblue">#address#&nbsp;&nbsp;<br>#city#  #zip#&nbsp;&nbsp;</font></td>
        <td align="left" valign="top"><font color="darkblue">#metro#<br>#county#</font></td>
		<td align="left" valign="top"><font color="darkblue" size="4">#gender#<br>#age#</font></td>
		<td align="left" valign="top"><font color="darkblue">#phone#<br>#email#</font></td>
        <td align="center" valign="top" nowrap="nowrap"><font color="darkblue"><cfif #flang# is "yes">yes<cfelse></cfif></font></td>
		<td align="center" valign="top"><font color="darkblue">#interest#</font></td>
		<td align="right" valign="top"><font color="darkblue">#dateformat(added,"mm/dd/yyyy")#</font></td>
	</tr>
	</tr>
	<tr>
    	<td colspan="10">
        	<hr color="mediumblue">
        </td>
    </tr>
	</cfoutput>
</table>
</center>	



<br><br><br>
<cfelse>
<font face="Arial" size="4">Sorry, you must enter a correct username and password!<br>
<br>
<a href="login.cfm">Back to Login</a></font></center>
<!-- Here you are ending your statement for username and password -->
</cfif> 