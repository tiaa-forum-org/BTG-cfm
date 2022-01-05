<cfinclude template="translatit.cfm">
<center>
<font face="Arial" size="3"><b>Login</b></font>
<br><br>
<!-- Here we're simply submitting a form with the required username and password -->
<cfform action="loginpost.cfm" method="POST">
<table border="1">
	<tr>
		<td><font face="Arial" size="2">Username:</font> </td>
		<td><cfinput type="Text" name="user" size="20" required="yes" message="Please enter a username"><br></td>
	</tr>
	<tr>
		<td><font face="Arial" size="2">Password:</font></td>
		<td> <cfinput type="password" name="pass" size="20" required="yes" message="Please enter a password"><br></td>
	</tr>
	<tr>
		<td>
		</td>
		<td><input type="Submit" value="submit"></td>
	</tr>
</table>
</cfform>
</center>
</BODY>
</HTML>
