<!--#include file="ACN.asp"-->
<%
' Get ID from query string
id = Request.Form("id")

' Validate ID
If IsNumeric(id) Then

Dim name, email, message
name = Request.Form("name")
email = Request.Form("email")
message = Request.Form("message")
    
    ' Prepare command with parameter
    Set cmd = Server.CreateObject("ADODB.Command")
    Set cmd.ActiveConnection = conn
    cmd.CommandText = "UPDATE ContactMessages SET Name= ?, Email=?, Message=?,  DateMessage=? WHERE Id = ?"
    cmd.CommandType = 1 ' adCmdText

    ' Add parameter (integer input)
	cmd.Parameters.Append cmd.CreateParameter(, 200, 1, 255, name)    ' Name
    cmd.Parameters.Append cmd.CreateParameter(, 200, 1, 255, email)   ' Email
	cmd.Parameters.Append cmd.CreateParameter(, 203, 1, 8000, message) ' Message
	cmd.Parameters.Append cmd.CreateParameter(, 135, 1, , Now())         ' DateMessage (type 135 = adDBTimeStamp)
    cmd.Parameters.Append cmd.CreateParameter(, 3, 1, , CInt(id)) ' 3 = adInteger, 1 = Input
	
    ' Execute
    cmd.Execute

    ' Cleanup
    Set cmd = Nothing
    conn.Close
    Set conn = Nothing

    ' Redirect
    Response.Redirect "list.asp"
Else
    Response.Write "Invalid ID"
End If
%>