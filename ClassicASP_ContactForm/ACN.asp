<%
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")
conn.ConnectionString = "Provider=SQLOLEDB;Data Source=SMVG\SQLEXPRESS;Initial Catalog=Customers;User ID=asp_user;Password=123456789;"
conn.open
%>