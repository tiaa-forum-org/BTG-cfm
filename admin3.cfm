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
                    <cfinput type="submit" value="Back to Admin Page" name="b1">
                    </cfform>

			<!------------ insert page here ----------->
<br><br><br><br>
<center>
<cfform action="admin3a.cfm" method="post" name="addlogin">
	Username<cfinput name="username" required="yes" message="You must enter a username" size="50"><br>
	Password<cfinput name="password" required="yes" message="You must enter a password" size="50"><br>
	Level<cfselect size="1" name="adminlevel" style="width: 150px" >
    			<option>1</option>
    	        <option>2</option>
          </cfselect>
	District <cfselect size="1" name="district" style="width: 150px">
				<option>1</option>
        	    <option>2</option>
            	<option>3</option>
	            <option>4</option>
            	<option>5</option>
	            <option>6</option>
				<option>7</option>
    	        <option>8</option>
        	    <option>9</option>
            	<option>10</option>
	            <option>11</option>
            	<option>12</option>
	            <option>13</option>
				<option>14</option>
    	        <option>15</option>
    	        <option>16</option>
    	        <option>17</option>
            </cfselect><br>
		<cfinput type="Hidden" name="pass" value="#getpass.password#">
			<cfinput type="Hidden" name="user" value="#getpass.username#">
		<cfinput type="submit" value="Upload New Administrator" name="b3">
</cfform>
<!------------ ende page insert ----------->
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


