<%
String user = (String) session.getAttribute("user");
if(user==null){ response.sendRedirect("login.jsp"); }

String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<title>Create Post</title>
<style>
body{background:#f0f2f5;font-family:sans-serif;}
.box{width:400px;margin:80px auto;background:#fff;padding:20px;border-radius:10px;box-shadow:0 0 10px #ccc;}
textarea,input,button{width:100%;padding:10px;margin:10px 0;}
button{background:#3897f0;color:#fff;border:none;}
</style>
</head>
<body>

<div class="box">
<h2>Create Post</h2>

<form action="<%= path %>/post" method="post">
<textarea name="content" placeholder="Write something"></textarea>
<input name="image" placeholder="Image URL (optional)">
<button>Post</button>
</form>

</div>

</body>
</html>