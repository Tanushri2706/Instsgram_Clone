<%
String user = (String) session.getAttribute("user");
if(user==null){ response.sendRedirect("login.jsp"); }
%>

<!DOCTYPE html>
<html>
<head>
<title>Settings</title>
<style>
body{font-family:sans-serif;}
.box{width:400px;margin:50px auto;}
</style>
</head>
<body>

<div class="box">
<h2>Settings</h2>

<p>Username: <%= user %></p>
<a href="logout">Logout</a>

</div>

</body>
</html>