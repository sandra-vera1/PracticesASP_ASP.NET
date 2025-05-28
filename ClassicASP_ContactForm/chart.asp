<!--#include file="ACN.asp"-->
<%
sql = "SELECT CONVERT(date, DateMessage) AS MessageDate, COUNT(*) AS MessageCount FROM ContactMessages GROUP BY CONVERT(date, DateMessage) ORDER BY MessageDate"
Set rs = conn.Execute(sql)

labels = ""
data = ""

Do Until rs.EOF
    labels = labels & """" & rs("MessageDate") & ""","
    data = data & rs("MessageCount") & ","
    rs.MoveNext
Loop

labels = Left(labels, Len(labels) - 1)
data = Left(data, Len(data) - 1)

rs.Close
conn.Close
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
    <a class="nav-link active rounded-5" href="chart.asp" role="tab">Chart</a>
  </li>
  
  <li class="nav-item" role="presentation">
    <a class="nav-link  rounded-5" href="list.asp" role="tab">Messages List</a>
  </li>
  
  <li class="nav-item" role="presentation">
    <a class="nav-link rounded-5" href="default.asp" role="tab">Contact</a>
  </li>
  
</ul>

<br>

<div style="display: flex; justify-content: center; align-items: center; height: 50vh;">
    <canvas id="myChart"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [<%= labels %>],
            datasets: [{
                label: 'Messages per Day',
                data: [<%= data %>],
                backgroundColor: 'rgba(54, 162, 235, 0.6)'
            }]
        },
        options: {
            scales: {
                y: { beginAtZero: true }
            }
        }
    });
</script>
</body>
</html>
