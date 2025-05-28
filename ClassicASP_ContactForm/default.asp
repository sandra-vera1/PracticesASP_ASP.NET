<%@ Language="VBScript" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Bootstrap CSS (without integrity) -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- Bootstrap JS (without integrity) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>


    <title>Classic ASP Contact Form</title>
</head>
<body class="container mt-5" style="background-color:grey">

<ul class="nav nav-pills nav-fill gap-2 p-1 small bg-dark rounded-5 shadow-sm" id="pillNav2" role="tablist"
  style="--bs-nav-link-color: var(--bs-white); --bs-nav-pills-link-active-color: var(--bs-dark); --bs-nav-pills-link-active-bg: var(--bs-white);">
  
  <li class="nav-item" role="presentation">
    <a class="nav-link rounded-5" href="chart.asp" role="tab">Chart</a>
  </li>
  
  <li class="nav-item" role="presentation">
    <a class="nav-link  rounded-5" href="list.asp" role="tab">Message List</a>
  </li>
  
  <li class="nav-item" role="presentation">
    <a class="nav-link active rounded-5" href="default.asp" role="tab">Contact</a>
  </li>
  
</ul>


<br>
<h2 class="mb-4">Contact Form</h2>
   <form method="post" action="submit.asp">
        <div class="mb-3">
            <label class="form-label">Name:</label>
            <input class="form-control" type="text" name="name" required/>
        </div>
        <div class="mb-3">
            <label class="form-label">Email:</label>
            <input class="form-control" type="email" name="email" required/>
        </div>
        <div class="mb-3">
            <label class="form-label">Message:</label>
            <textarea class="form-control" name="message" rows="5" required></textarea>
        </div>
        <button type="submit" class="btn btn-success">Submit</button>
    </form>
</body>
</html>
