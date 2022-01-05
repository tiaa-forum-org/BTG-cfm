<cfinsert datasource="#attributes.dsn#"
		  tablename="login"
		  formfields= "username, password, district, adminlevel">
<center>
The new login has been uploaded<br /><br /><br />
<cfinclude template="admin3.cfm">
</center>

