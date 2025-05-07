<!--#include file="ACN.asp"-->
<%
' Get ID from query string
id = Request.QueryString("id")

' Validate ID
If IsNumeric(id) Then
    
    ' Prepare command with parameter
    Set cmd = Server.CreateObject("ADODB.Command")
    Set cmd.ActiveConnection = conn
    cmd.CommandText = "DELETE FROM ContactMessages WHERE Id = ?"
    cmd.CommandType = 1 ' adCmdText

    ' Add parameter (integer input)
    cmd.Parameters.Append cmd.CreateParameter(, 3, 1, , CInt(id)) ' 3 = adInteger, 1 = Input

    ' Execute
    cmd.Execute

    ' Cleanup
    Set cmd = Nothing
    conn.Close
    Set conn = Nothing

    ' Redirect
    Response.Redirect "message_list.asp"
Else
    Response.Write "Invalid ID"
End If
%>