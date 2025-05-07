<!--#include file="ACN.asp"-->
<%
' Set DB connection
Dim  rs, sql

' Query data
sql = "SELECT * FROM ContactMessages ORDER BY ID DESC"
Set rs = conn.Execute(sql)
%>

<!DOCTYPE html>
<html>
<head>
    <title>Contact Messages List</title>
	<br>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">

<ul class="nav nav-pills nav-fill gap-2 p-1 small bg-dark rounded-5 shadow-sm" id="pillNav2" role="tablist"
  style="--bs-nav-link-color: var(--bs-white); --bs-nav-pills-link-active-color: var(--bs-dark); --bs-nav-pills-link-active-bg: var(--bs-white);">
  
  <li class="nav-item" role="presentation">
    <a class="nav-link rounded-5" href="" role="tab">Home</a>
  </li>
  
  <li class="nav-item" role="presentation">
    <a class="nav-link active rounded-5" href="list.asp" role="tab">Message List</a>
  </li>
  
  <li class="nav-item" role="presentation">
    <a class="nav-link rounded-5" href="default.asp" role="tab">Contact</a>
  </li>
  
</ul>



    <br>
    <h2>Contact Messages</h2>
    <table class="table table-bordered table-striped">
        <thead class="table-secondary">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <%
            Do While Not rs.EOF
            %>
            <tr>
                <td><%= rs("Id") %></td>
                <td><%= Server.HTMLEncode(rs("Name")) %></td>
                <td><%= Server.HTMLEncode(rs("Email")) %></td>
                <td><%= Server.HTMLEncode(rs("Message")) %></td>
                <td><%= rs("DateMessage") %></td>
            </tr>
            <%
                rs.MoveNext
            Loop
            rs.Close
            conn.Close
            Set rs = Nothing
            Set conn = Nothing
            %>
        </tbody>
    </table>
</body>
</html>
