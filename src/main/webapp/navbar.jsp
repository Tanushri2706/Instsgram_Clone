<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<style>
    :root { --insta-blue: #0095f6; --bg: #fafafa; --border: #dbdbdb; }
    .nav-container { 
        background: white; border-bottom: 1px solid var(--border); 
        padding: 10px 20px; position: fixed; top: 0; width: 100%; z-index: 1000;
        display: flex; justify-content: space-around; align-items: center; box-sizing: border-box;
    }
    .logo { font-family: 'Lobster', cursive; font-size: 24px; text-decoration: none; color: #262626; }
    .nav-icons a { color: #262626; margin-left: 22px; font-size: 22px; text-decoration: none; }
    body { padding-top: 70px; margin: 0; background: var(--bg); font-family: -apple-system, sans-serif; }
</style>

<nav class="nav-container">
    <a href="home.jsp" class="logo">InstaClone</a>
    <div class="nav-icons">
        <a href="home.jsp"><i class="fa-solid fa-house"></i></a>
        <a href="explore.jsp"><i class="fa-regular fa-compass"></i></a>
        <a href="createPost.jsp"><i class="fa-regular fa-square-plus"></i></a>
        <a href="profile.jsp"><i class="fa-regular fa-circle-user"></i></a>
        <a href="logout"><i class="fa-solid fa-right-from-bracket"></i></a>
    </div>
</nav>