<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to InstaClone</title>
    <style>
        body { margin: 0; font-family: sans-serif; height: 100vh; display: flex; align-items: center; justify-content: center; background: #fafafa; }
        .hero-container { display: flex; align-items: center; max-width: 900px; }
        .hero-img { width: 450px; display: none; }
        @media (min-width: 800px) { .hero-img { display: block; } }
        .login-box { background: white; border: 1px solid #dbdbdb; padding: 40px; width: 350px; text-align: center; border-radius: 8px; }
        .logo-font { font-family: 'Lobster', cursive; font-size: 50px; margin-bottom: 30px; }
        .btn-start { background: #0095f6; color: white; padding: 12px; border-radius: 8px; text-decoration: none; display: block; font-weight: bold; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="hero-container">
        <img src="https://images.unsplash.com/photo-1611162617213-7d7a39e9b1d7?auto=format&fit=crop&w=450&q=80" class="hero-img" alt="Mobile UI">
        <div class="login-box">
            <div class="logo-font">InstaClone</div>
            <p style="color: #8e8e8e; font-weight: bold;">Sign up to see photos and videos from your friends.</p>
            <a href="signup.jsp" class="btn-start">Get Started</a>
            <p style="margin-top: 20px;">Have an account? <a href="login.jsp" style="color: #0095f6; text-decoration: none;">Log in</a></p>
        </div>
    </div>
</body>
</html>