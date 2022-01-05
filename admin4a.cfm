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
					<cfinput type="hidden" name="level" value="#getpass.adminlevel#">
                    <cfinput type="submit" value="Back to Admin Page" name="b1">
                    </cfform>



			<!------------ insert page here ----------->
<br><br><br><br>
<cfquery datasource="#attributes.dsn#" name="getlogin">
	SELECT *
	FROM login
	WHERE userid = #userid#
</cfquery>
<center>
<cfoutput query="getlogin">
<cfform action="admin4b.cfm" method="post">
	Username<cfinput name="username" required="yes" message="You must enter a username" size="50" value="#username#"><br>
	Password<cfinput name="password" required="yes" message="You must enter a password" size="50" value="#password#"><br>
	Level<cfselect size="1" name="adminlevel" style="width: 100px" >
    			<option<cfif adminlevel eq 1>selected><cfelse>></cfif>1</option>
    	        <option<cfif adminlevel eq 2>selected><cfelse>></cfif>2</option>
          </cfselect>
	District <select size="1" name="district" style="width: 100px">
				<option <cfif district eq 1>selected><cfelse>></cfif>1</option>
    	        <option <cfif district eq 2>selected><cfelse>></cfif>2</option>
        	    <option <cfif district eq 3>selected><cfelse>></cfif>3</option>
            	<option <cfif district eq 4>selected><cfelse>></cfif>4</option>
	            <option <cfif district eq 6>selected><cfelse>></cfif>6</option>
            	<option <cfif district eq 7>selected><cfelse>></cfif>7</option>
	            <option <cfif district eq 8>selected><cfelse>></cfif>8</option>
				<option <cfif district eq 9>selected><cfelse>></cfif>9</option>
    	        <option <cfif district eq 10>selected><cfelse>></cfif>10</option>
        	    <option <cfif district eq 11>selected><cfelse>></cfif>11</option>
            	<option <cfif district eq 12>selected><cfelse>></cfif>12</option>
	            <option <cfif district eq 13>selected><cfelse>></cfif>13</option>
            	<option <cfif district eq 14>selected><cfelse>></cfif>14</option>
	            <option <cfif district eq 15>selected><cfelse>></cfif>15</option>
				<option <cfif district eq 16>selected><cfelse>></cfif>16</option>
    	        <option <cfif district eq 17>selected><cfelse>></cfif>17</option>
            </select><br>
		<input type="submit" value="Upload New Username and Password">
			<cfinput type="Hidden" name="pass" value="#getpass.password#">
			<cfinput type="Hidden" name="user" value="#getpass.username#">
		<input type="hidden" name="userid" value="#userid#">
</cfform>
</cfoutput>
<!------------ ende page insert ----------->
</center>	
<br><br><br>
<cfelse>
<font face="Arial" size="4">Sorry, you must enter a correct username and password!<br>
<br>
<a href="../login.cfm">Back to Login</a></font></center>
<!-- Here you are ending your statement for username and password -->
</cfif>    