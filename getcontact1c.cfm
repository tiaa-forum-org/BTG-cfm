<cfinclude template="translatit.cfm">
<center>
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
                    <cfinput type="submit" value="Back to Admin Page" name="bb">
                    </cfform>

<cfquery datasource="#attributes.dsn#" name="getcity">
	SELECT DISTINCT city
	FROM contacts
	ORDER BY city
</cfquery>
<cfquery datasource="#attributes.dsn#" name="getzip">
	SELECT DISTINCT zip
	FROM contacts
	ORDER BY zip
</cfquery><cfquery datasource="#attributes.dsn#" name="getpart">
	SELECT DISTINCT district
	FROM contacts
	ORDER BY district
</cfquery>
<br /><br />
<font color="red" size="6">
Check the Box(s) to Search By in the top row<br>
Then choose the search option from the second row<br />
<br />
the more options checked the fewer results will be found<br /><br />
</font>
<cfform action="getcontact2.cfm" method="POST">
<table>
	<tr>
		<td colspan="2">
			<cfinput type="Checkbox" name="statepart1" value="yes"><font color="red" size="5">District</font>
		</td>
		<td>
			<cfinput type="Checkbox" name="city1" value="yes"><font color="red" size="5">City</font>
		</td>
		<td>
			<cfinput type="Checkbox" name="zip1" value="yes"><font color="red" size="5">Zip Code</font>
		</td>
		<td colspan="1">
			<cfinput type="Checkbox" name="gender1" value="yes"><font color="red" size="5">Gender</font>
		</td>
		<td align="center">
			<cfinput type="Checkbox" name="flang1" value="yes"><font color="red" size="5">Spanish</font>
		</td>
		<td>
			<cfinput type="Checkbox" name="interest1" value="yes"><font color="red" size="5">Willing to Bridge</font>
		</td>
    </tr>
    <tr>
		<td colspan="2">
			<CFSELECT   
				size="1"
				name="district"
				value="district"
				query="getpart"
				display="district">
			</CFSELECT>
		</td>
		<td >
			<CFSELECT   
				size="1"
				name="city"
				value="city"
				query="getcity"
				display="city">
			</CFSELECT>
		</td>
		<td >
			<CFSELECT   
				size="1"
				name="zip"
				value="zip"
				query="getzip"
				display="zip">
			</CFSELECT>
		</td>
		<td colspan="2" >
			<cfinput type="Radio" name="gender" value="male">Male
			<cfinput type="Radio" name="gender" value="female">Female
		</td>
		<td >
			<cfinput type="Radio" name="interest" value="TF">Treatment
			<cfinput type="Radio" name="interest" value="CF">Corrections
		</td>
	</tr>
	<tr>
		<td >&nbsp;
			
		</td>

		<td colspan="5" align="center">
			<cfinput type="submit" value="Find a Contact" name="b0">
			<cfinput type="Hidden" name="pass" value="#getpass.password#">
			<cfinput type="Hidden" name="user" value="#getpass.username#">
            <br /><br /><br />
		</td>
	</tr>
	
</cfform>
	<tr>
    	<td bgcolor="red" colspan="8"></td>
    </tr>
<cfquery datasource="#attributes.dsn#" name="getcontact">
			SELECT *
			FROM contacts
			ORDER BY city, zip
		</cfquery>
        

			<tr>
			<cfoutput>
				<td align="left" valign="top">
                    <cfform action="getcontact1a.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="District" name="b1">
                    </cfform>
				</td>
				<td align="left" valign="top">
                    <cfform action="getcontact1b.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="Name" name="b2">
                    </cfform>
				</td>
				<td align="left" valign="top">
                    <cfform action="getcontact1c.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="City and Zip" name="b3">
                    </cfform>                             
				</td>
				<td align="left" valign="top">
                    <cfform action="getcontact1e.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="County" name="b4">
                    </cfform>
				</td>
				<td align="center" valign="top">
                    <cfform action="getcontact1d.cfm" method="post">
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
                    <cfform action="getcontact1g.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="Spanish" name="b6">
                    </cfform>
				</td>
				<td align="center" valign="top">
                    <cfform action="getcontact1f.cfm" method="post">
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
                    	<font size="4">click on buttons to re-sort by that column</font>
                        <br /><br />
                    <hr />
                </td>
            </tr>
	<cfoutput query="getcontact">
	<tr>
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





<br><br><br>
<cfelse>
<font face="Arial" size="4">Sorry, you must enter a correct username and password!<br>
<br>
<a href="login.cfm">Back to Login</a></font></center>
<!-- Here you are ending your statement for username and password -->
</cfif> 
</body>
</html>