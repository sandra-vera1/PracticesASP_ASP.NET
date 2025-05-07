<!--#include file="ACN.asp"-->
<%
Dim name, email, message
name = Request.Form("name")
email = Request.Form("email")
message = Request.Form("message")

getSub =  Request.Form("Submit")


'Dim conn, cmd
Dim cmd
'Set conn = Server.CreateObject("ADODB.Connection")
Set cmd = Server.CreateObject("ADODB.Command")

' Replace with your actual connection string
'conn.Open "Provider=SQLOLEDB;Data Source=SMVG\SQLEXPRESS;Initial Catalog=Customers;User ID=asp_user;Password=123456789;"
'conn.Open "Provider=SQLOLEDB;Data Source=SMVG\SQLEXPRESS;Initial Catalog=Customers;Integrated Security=SSPI;"

Set cmd.ActiveConnection = conn
cmd.CommandText = "INSERT INTO ContactMessages (Name, Email, Message) VALUES (?, ?, ?)"
cmd.CommandType = 1 ' adCmdText

' Clear and create parameters explicitly
cmd.Parameters.Append cmd.CreateParameter(, 200, 1, 255, name)   ' adVarChar
cmd.Parameters.Append cmd.CreateParameter(, 200, 1, 255, email)  ' adVarChar
cmd.Parameters.Append cmd.CreateParameter(, 203, 1, 8000, message) ' adLongVarWChar

cmd.Execute

conn.Close
Set cmd = Nothing
Set conn = Nothing

Response.Redirect "list.asp"
%>

