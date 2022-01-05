<cfinclude template="translatit.cfm">
<cfquery name="getpass" datasource="#attributes.dsn#">
	SELECT *
	FROM login
	WHERE username='#user#'
</cfquery>
<cfif (#pass# is #getpass.password#) AND (#user# is #getpass.username#)>

<br /><br />
<CENTER>
<cfform action="loginpost.cfm" method="post">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="Back to Admin Page" name="b1">
                    </cfform>
<font color="darkblue" size="4">Update Contact Information</font><br><br /><br />
<cfquery datasource="#attributes.dsn#" name="getcontact">
	SELECT *
	FROM contacts
	WHERE contactid = #contactid#
</cfquery>
<cfquery datasource="#attributes.dsn#" name="getpart">
	SELECT *
	FROM statepart
</cfquery>
<cfquery datasource="#attributes.dsn#" name="getdistrict">
	SELECT DISTINCT district
	FROM contacts
	ORDER BY district
</cfquery>
<cfoutput query="getcontact">
<cfform action="update3.cfm" method="post" name="update1">
<table>
	<tr>
    	<td width="122" align="right" valign="bottom">
        	First Name:
        </td>
        <td width="169" align="left" valign="bottom">
        	<CFINPUT name="first"
		 			 message="Please enter the first name"
		 			 required="yes"
                     value="#first#"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
       	<td width="83" align="right" valign="bottom" nowrap>
        	Last Name:
        </td>
        <td width="160" align="left" valign="bottom">
        	<CFINPUT name="last"
		 			 message="Please enter the last name"
		 			 required="yes"
                     value="#last#"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    	<td width="71" align="right" valign="bottom" nowrap>
        	Gender:
        </td>
        <td width="167" align="right" valign="bottom">
        	<cfselect size="1" 
            		name="gender" 
                    style="WIDTH: 75px; HEIGHT: 26px; background-color: white; color: darkblue;">
		 				<option <cfif #gender# is "male"> selected<cfelse></cfif>>Male</option>
						<option <cfif #gender# is "female"> selected<cfelse></cfif>>Female</option>
        	</cfselect>
        	Age:<CFINPUT name="age"
		 			 message="Please enter contact age"
		 			 required="yes"
                     value="#age#"
		 			 style="WIDTH: 30px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    </tr>
    <tr>
    	<td align="right" nowrap>
        	Email Address:
        </td>
        <td colspan="5" align="left">
        	<CFINPUT name="email"
		 			 message="Please enter the email address"
		 			 required="yes"
                     value="#email#"
		 			 style="WIDTH: 645px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    </tr>
    <!-----------
    <tr>
    	<td align="right" nowrap>
        	Street Address:
        </td>
        <td colspan="5" align="left">
        	<CFINPUT name="address"
		 			 message="Please enter the complete street address"
		 			 required="yes"
                     value="#address#"
		 			 style="WIDTH: 645px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    </tr>
	-------------->
    <tr>
    	<td align="right" nowrap>
        	City:
        </td>
        <td align="left">
        	<CFINPUT name="city"
		 			 message="Please enter the city name"
		 			 required="yes"
                     value="#city#"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    	<td align="right" nowrap>
        	State:
        </td> 
    	<td align="left">
        	<CFINPUT name="state"
		 			 message="Please enter the city name"
		 			 required="yes"
                     value="#state#"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
		</td>
    	<td align="right" nowrap>
        	Zip Code:
        </td>
        <td align="left">
        	<CFINPUT name="zip"
		 			 message="Please enter your the code"
		 			 required="yes"
                     value="#zip#"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    </tr>
    <tr><!---------------
    	<td align="right" nowrap>
        	Metro Area:
        </td>
        <td align="left">
        	
        	<CFINPUT name="metro"
		 			 message="Please enter the name of the closest large city - this will also be used to more closely match release location"
		 			 required="no"
                     value="#metro#"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>	 
        </td>
			------------->
    	<td align="right" nowrap>
        	Phone:
        </td>
        <td align="left">
        	<CFINPUT name="phone"
		 			 message="Please enter the phone number"
		 			 required="yes"
                     value="#phone#"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;px"
		 			 size=56>
        </td>	
    	<td align="right" nowrap>&nbsp;
        	
        </td>
        <td align="left">&nbsp;
        	
        </td><td align="right" nowrap>
        	County:
        </td>
        <td align="left">
        	<CFINPUT name="county"
		 			 message="Please enter the name of the county they live in - this will be used to more closely match release location"
		 			 required="yes"
                     value="#county#"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    </tr>
    <tr>
    	
    	<td align="right" colspan="3">
        	What District (number) do they do service in (one only please):
        </td>
        <td align="left">
        	<!-------------
        	<CFSELECT   
				size="1"
				name="district" 
				value="district"
   				query="getdistrict"
				display="district"
                selected="#getcontact.district#" 
				style="WIDTH: 100px; HEIGHT: 26px; background-color: white; color: darkblue;">
            </CFSELECT>
			-------------->
            <CFINPUT name="district"
		 			 message="Please enter the number of the District"
		 			 required="yes"
                     value="#District#"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
		<td align="right">
        	
		<!------------What part of the state do they live in?---------->
        </td>
        <td align="left">
            <!-----------
            <CFSELECT   
				size="1"
				name="statepart" 
				value="part"
   				query="getpart"
				display="part"
                selected="#statepart#"
				style="WIDTH: 150px; HEIGHT: 26px; background-color: white; color: darkblue;">
            </CFSELECT>
        </td>
			------------->
    	
    </tr>
    <tr>
    	<td align="right" "nowrap">
        	Willing to Bridge:
        </td>
        <td align="left" colspan="2">
        	<cfselect size="1" 
            		name="interest"
                    style="WIDTH: 175px; HEIGHT: 26px; background-color: white; color: darkblue;">
                    	<option <cfif #interest# is "Both"> selected><cfelse>></cfif>Both</option>
						<option <cfif #interest# is "CF">selected><cfelse>></cfif>CF</option>
                        <option <cfif #interest# is "TF">selected><cfelse>></cfif>TF</option>
        	</cfselect>
        </td>
        <td>&nbsp;
        	
        </td>
        <td>&nbsp;
        	
        </td>
        <td>&nbsp;
        	
        </td>
    </tr>
			<tr>
				<td align="center" colspan="7">
					<cfinput type="hidden" value="#contactid#" name="contactid">
					<cfinput type="Hidden" name="pass" value="#getpass.password#">
					<cfinput type="Hidden" name="user" value="#getpass.username#">
					<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
            		<cfinput type="hidden" name="added" value="#dateformat(Now(),"short")#">
            		<cfinput type="hidden" name="current" value="yes">
					<cfinput type="Submit" value="Update Contact Information" name="b2">
				</td>
			
			</tr>
		</table>
</cfform>
</cfoutput>	

</center>
<br><br><br>
<cfelse>
<font face="Arial" size="4">Sorry, you must enter a correct username and password!<br>
<br>
<a href="login.cfm">Back to Login</a></font></center>
<!-- Here you are ending your statement for username and password -->
</cfif> 