<CFUPDATE DATASOURCE="#attributes.dsn#"
  			TABLENAME="login"
			FORMFIELDS="userid, username, password, district, adminlevel">
<font color="Red">Information Update Complete</font>


<cfinclude template='admin4.cfm'>
