<cfquery name="getpass" datasource="#attributes.dsn#">
	SELECT *
	FROM login
	WHERE username='#user#'
</cfquery>
<cfif (#pass# is #getpass.password#) AND (#user# is #getpass.username#)>
<center>
<cfoutput>
<table border="0" width="100%" bordercolor="blue" align="center">
	<tr>
    	<td align="left" width="200" valign="top" align="center">
			<table cellpadding="0" cellspacing="0" border="0" bordercolor="red" align="center">
			    <tr>
			    	<td>
						<cfform method="post" action="add1.cfm" name="button_20">
							<cfinput type="Hidden" name="pass" value="#getpass.password#">
							<cfinput type="Hidden" name="user" value="#getpass.username#">
							<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
            				<cfinput type="hidden" name="district" value="<cfoutput>#getpass.district#</cfoutput>">
		    	        	<cfinput type="submit" value="Add a Contact" name="b20" style="width:200px; height: 24px; background-color: whitesmoke;" size=35 />
			          	</cfform>
					</td>
			    	<td>
						<cfform method="post" action="update1.cfm"name="button_15">
							<cfinput type="Hidden" name="pass" value="#getpass.password#">
							<cfinput type="Hidden" name="user" value="#getpass.username#">
							<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
            				<cfinput type="hidden" name="district" value="<cfoutput>#getpass.district#</cfoutput>">
				        	<cfinput type="submit" value="Update Contact Info" name="b15" style="width:200px; height: 24px; background-color: whitesmoke;" size=35>
						</cfform>
			        </td>
			    	<td>
						<cfform method="post" action="delete1.cfm" name="button_20">
							<cfinput type="Hidden" name="pass" value="#getpass.password#">
							<cfinput type="Hidden" name="user" value="#getpass.username#">
							<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
            				<cfinput type="hidden" name="district" value="<cfoutput>#getpass.district#</cfoutput>">
		    	        	<cfinput type="submit" value="Delete a Contact" name="b20" style="width:200px; height: 24px; background-color: whitesmoke;" size=35 />
			          	</cfform>
					</td>
				</tr>
                
				<cfif (#getpass.adminlevel# is 2)>
			    <tr>
			    	<td>
						<cfform method="post" action="admin3.cfm"name="button_15">
							<cfinput type="Hidden" name="pass" value="#getpass.password#">
							<cfinput type="Hidden" name="user" value="#getpass.username#">
							<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
            				<cfinput type="hidden" name="district" value="<cfoutput>#getpass.district#</cfoutput>">
				        	<cfinput type="submit" value="Add District Admin" name="b15" style="width:200px; height: 24px; background-color: lightgray;" size=35>
						</cfform>
			        </td>
			    	<td>
						<cfform method="post" action="admin4.cfm"name="button_16">
							<cfinput type="Hidden" name="pass" value="#getpass.password#">
							<cfinput type="Hidden" name="user" value="#getpass.username#">
							<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
            				<cfinput type="hidden" name="district" value="<cfoutput>#getpass.district#</cfoutput>">
				        	<cfinput type="submit" value="Update District Admin" name="b16" style="width:200px; height: 24px; background-color: lightgray;" size=35>
						</cfform>
			        </td>
			    	<td>
						<cfform method="post" action="admin5.cfm"name="button_15">
							<cfinput type="Hidden" name="pass" value="#getpass.password#">
							<cfinput type="Hidden" name="user" value="#getpass.username#">
							<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
            				<cfinput type="hidden" name="district" value="<cfoutput>#getpass.district#</cfoutput>">
				        	<cfinput type="submit" value="Delete District Admin" name="b15" style="width:200px; height: 24px; background-color: lightgray;" size=35>
						</cfform>
			        </td>
				</tr>
                </cfif>
			</table>
</cfoutput>
</center>
		</td>
    </tr>
    <tr>
		<td align="center" valign="top">
        <br /><br /><br />
        <cfinclude template="findcontact.cfm">
        </td>
    </tr>
</table>
        


<cfelse>
<font face="Arial" size="4">Sorry, you must enter a correct username and password!<br>
<br>
<a href="index.cfm">Back to Login</a></font></center>
<!-- Here you are ending your statement for username and password -->
</cfif>
<!------------ ende page insert ----------->
