<!--#include file="ACN.asp"-->
<%
Dim rs, id, sql
id = Request.QueryString("id")

' Prepare command with parameter
    Set cmd = Server.CreateObject("ADODB.Command")
    Set cmd.ActiveConnection = conn
    cmd.CommandText = "SELECT * FROM ContactMessages WHERE Id = ?"
    cmd.CommandType = 1 ' adCmdText
 
 
 ' Add parameter (integer input)
    cmd.Parameters.Append cmd.CreateParameter(, 3, 1, , CInt(id)) ' 3 = adInteger, 1 = Input

' Execute
Set rs = cmd.Execute


If Not rs.EOF Then
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Bootstrap CSS (without integrity) -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- Bootstrap JS (without integrity) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>


    <title>Classic ASP Edit Contact Message</title>
</head>
<body class="container mt-5" style="background-color:grey">

<ul class="nav nav-pills nav-fill gap-2 p-1 small bg-dark rounded-5 shadow-sm" id="pillNav2" role="tablist"
  style="--bs-nav-link-color: var(--bs-white); --bs-nav-pills-link-active-color: var(--bs-dark); --bs-nav-pills-link-active-bg: var(--bs-white);">
  
  <li class="nav-item" role="presentation">
    <a class="nav-link rounded-5" href="" role="tab">Home</a>
  </li>
  
  <li class="nav-item" role="presentation">
    <a class="nav-link  rounded-5" href="list.asp" role="tab">Message List</a>
  </li>
  
  <li class="nav-item" role="presentation">
    <a class="nav-link active rounded-5" href="default.asp" role="tab">Contact</a>
  </li>
  
</ul>

<br>
<h2 class="mb-4">Edit Contact Message</h2>
<form method="post" action="update.asp">
    <input type="hidden" name="id" value="<%= rs("Id") %>">
	<div class="mb-3">
            <label class="form-label">Name:</label>
            <input class="form-control" type="text" name="name" value="<%= rs("Name") %>" required/>
    </div>
    <div class="mb-3">
            <label class="form-label">Email:</label>
            <input class="form-control" type="email" name="email" value="<%= rs("Email") %>" required/>
    </div>
    <div class="mb-3">
            <label class="form-label">Message:</label>
            <textarea class="form-control" name="message" rows="5" required><%= rs("Message") %></textarea>
    </div>
    <br>
	<button type="submit" class="btn btn-success">Update</button>
</form>
</body>
</html>
<%
Else
    Response.Write "Record not found."
End If

rs.Close
Set rs = Nothing
conn.Close
Set conn = Nothing
%>
