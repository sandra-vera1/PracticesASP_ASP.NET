<!--#include file="ACN.asp"-->
<%
Const recordsPerPage = 8
Dim  rs, sql, currentPage, totalRecords, totalPages, offset

currentPage = Request.QueryString("page")
If IsNumeric(currentPage) Then
    currentPage = CInt(currentPage)
    If currentPage < 1 Then currentPage = 1
Else
    currentPage = 1
End If

' Get total records
Set rs = conn.Execute("SELECT COUNT(*) FROM ContactMessages")
totalRecords = rs(0)
rs.Close

totalPages = Int((totalRecords + recordsPerPage - 1) / recordsPerPage)
offset = (currentPage - 1) * recordsPerPage

sql = "SELECT * FROM ContactMessages ORDER BY DateMessage OFFSET " & offset & " ROWS FETCH NEXT " & recordsPerPage & " ROWS ONLY"
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
    <a class="nav-link rounded-5" href="chart.asp" role="tab">Chart</a>
  </li>
  
  <li class="nav-item" role="presentation">
    <a class="nav-link active rounded-5" href="list.asp" role="tab">Messages List</a>
  </li>
  
  <li class="nav-item" role="presentation">
    <a class="nav-link rounded-5" href="default.asp" role="tab">Contact</a>
  </li>
  
</ul>



<br>
<h2 class="text-center mt-3">Contact Messages List</h2>
    <table class="table table-bordered table-striped">
        <thead class="table-secondary">
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Date</th>
				<th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
            Do While Not rs.EOF
            %>
            <tr>
               
                <td><%= Server.HTMLEncode(rs("Name")) %></td>
                <td><%= Server.HTMLEncode(rs("Email")) %></td>
                <td><%= Server.HTMLEncode(rs("Message")) %></td>
                <td><%= rs("DateMessage") %></td>
				<td>
                    <a href="delete.asp?id=<%= rs("Id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
					<a href="edit_page.asp?id=<%= rs("Id") %>" class="btn btn-success btn-sm" >Update</a>
                </td>
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
	<div class="text-center mt-3">
		<%
		Dim i
		For i = 1 To totalPages
		  If i = currentPage Then
			Response.Write "<strong>" & i & "</strong> "
		  Else
			Response.Write "<a href='list.asp?page=" & i & "'>" & i & "</a> "
		  End If
		Next
		%>
	</div>
</body>
</html>
