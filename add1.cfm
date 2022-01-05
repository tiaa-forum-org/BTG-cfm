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
                    <cfinput type="submit" value="Back to Admin Page" name="b1">
                    </cfform>





<cfquery datasource="#attributes.dsn#" name="getpart">
	SELECT *
	FROM statepart
</cfquery>
<font color="darkblue" size="4">Add a Contact</font><br><br /><br />
<cfform action="add2.cfm" method="post" name="add1">
<table>
	<tr>
    	<td align="right">
        	First Name:
        </td>
        <td align="left">
        	<CFINPUT name="first"
		 			 message="Please enter the first name"
		 			 required="yes"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
       	<td align="right" nowrap>
        	Last Name:
        </td>
        <td align="left">
        	<CFINPUT name="last"
		 			 message="Please enter the last name"
		 			 required="yes"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    	<td align="right" nowrap>
        	Gender:
        </td>
        <td align="right" valign="top">
        	<cfselect size="1" 
            		name="gender" 
                    style="WIDTH: 75px; HEIGHT: 26px; background-color: white; color: darkblue;">
		 				<option>Male</option>
						<option>Female</option>
        	</cfselect>
        	Age:<CFINPUT name="age"
		 			 message="Please enter contact age"
		 			 required="yes"
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
		 			 style="WIDTH: 645px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    </tr>
		<!---------
    <tr>
    	<td align="right" nowrap>
        	Street Address:
        </td>
        <td colspan="5" align="left">
        	<CFINPUT name="address"
		 			 message="Please enter the complete street address"
		 			 required="no"
		 			 style="WIDTH: 645px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    </tr>
		--------->
    <tr>
    	<td align="right" nowrap>
        	City:
        </td>
        <td align="left">
        	<CFINPUT name="city"
		 			 message="Please enter the city name"
		 			 required="yes"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    	<td align="right" nowrap>
        	State:
        </td> 
    	<td align="left">
			<CFINPUT name="state"
		 			 message="Please enter the state name"
		 			 required="yes"
                     value="MO" 
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
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    </tr>
    <tr>
    <!-------------------
    	<td align="right" colspan="3">
        	What part of the state do they live in?
        </td>
        <td align="left">
            <CFSELECT   
				size="1"
				name="statepart" 
				value="part"
   				query="getpart"
				display="part"
				style="WIDTH: 150px; HEIGHT: 26px; background-color: white; color: darkblue;">
            </CFSELECT>
        </td> 
    	<td align="right" nowrap>
        	Metro Area:
        </td>
        <td align="left">
        	<CFINPUT name="metro"
		 			 message="Please enter the name of the closest large city - this will also be used to more closely match release location"
		 			 required="no"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
        ----------------->
    </tr>
    <tr>
    	<td align="right" nowrap>
        	County:
        </td>
        <td align="left">
        	<CFINPUT name="county"
		 			 message="Please enter the name of the county they live in - this will be used to more closely match release location"
		 			 required="yes"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    	<td align="right" nowrap>&nbsp;
        	
        </td>
        <td align="left">&nbsp;
        	
        </td>
    	<td align="right" nowrap>
        	Phone:
        </td>
        <td align="left">
        	<CFINPUT name="phone"
		 			 message="Please enter the phone number"
		 			 required="yes"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;px"
		 			 size=56>
        </td>
    </tr>
    <tr>
    	<td align="right" "nowrap">
        	Willing to Bridge:
        </td>
        <td align="left" colspan="2">
        	<cfselect size="1" 
            		name="interest" 
                    style="WIDTH: 175px; HEIGHT: 26px; background-color: white; color: darkblue;">
		 				<option>Both</option>
						<option>CF</option>
                        <option>TF</option>
        	</cfselect>
        </td>
    	<td align="right" colspan="2">
        	What District (number) do they <br>do service in (one only please):
        </td>
        <td align="left">
        	<CFINPUT name="district"
		 			 message="Please enter the number of the District"
		 			 required="yes"
		 			 style="WIDTH: 150px; HEIGHT: 22px; background-color: white; color: darkblue;"
		 			 size=56>
        </td>
    </tr>
	<tr>
    	<td align="right">
        	Spanish Speaking
        </td>
        <td>
        	<cfinput type="checkbox" name="flang">	
		<td align="center" colspan="4">
			<cfinput type="Hidden" name="pass" value="#getpass.password#">
			<cfinput type="Hidden" name="user" value="#getpass.username#">
			<cfinput type="hidden" name="adminlevel" value="#getpass.adminlevel#">
            <cfinput type="hidden" name="added" value="#dateformat(Now(),"short")#">
            <cfinput type="hidden" name="current" value="yes">
			<cfinput type="Submit" value="Add Contact" name="b2">
		</td>
	</tr>
</table>
</cfform>
</center>	
<br><br><br>
<cfelse>
<font face="Arial" size="4">Sorry, you must enter a correct username and password!<br>
<br>
<a href="../login.cfm">Back to Login</a></font></center>
<!-- Here you are ending your statement for username and password -->
</cfif>    