<%@ include file="navbar.jsp" %>
<%
    String user = (String) session.getAttribute("user");
    if(user==null){ response.sendRedirect("login.jsp"); }
%>
<!DOCTYPE html>
<html>
<head><title>Profile</title></head>
<body>
    <div style="max-width: 600px; margin: 20px auto; padding: 20px;">
        <div style="display: flex; align-items: center; margin-bottom: 40px;">
            <img src="https://ui-avatars.com/api/?name=<%= user %>&size=150&background=random" style="width: 150px; border-radius: 50%; border: 1px solid #dbdbdb;">
            <div style="margin-left: 50px;">
                <h2 style="font-weight: 300; font-size: 28px;"><%= user %></h2>
                <button style="border: 1px solid #dbdbdb; background: white; padding: 5px 10px; border-radius: 4px; font-weight: 600;">Edit Profile</button>
            </div>
        </div>
        <hr style="border: 0; border-top: 1px solid #dbdbdb;">
        <div style="text-align: center; color: #8e8e8e; padding-top: 20px;">
            <i class="fa-solid fa-table-cells" style="margin-right: 5px;"></i> POSTS
        </div>
        <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px; margin-top: 20px;">
             <img src="https://picsum.photos/200/200?random=1" style="width: 100%;">
             <img src="https://picsum.photos/200/200?random=2" style="width: 100%;">
             <img src="https://picsum.photos/200/200?random=3" style="width: 100%;">
        </div>
    </div>
</body>
</html>