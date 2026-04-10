<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <title>Login • InstaClone</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #fafafa;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .login-card {
            background: white;
            border: 1px solid #dbdbdb;
            width: 350px;
            padding: 40px 30px;
            text-align: center;
            box-sizing: border-box;
            border-radius: 1px;
        }
        .logo {
            font-family: 'Lobster', cursive;
            font-size: 45px;
            margin-bottom: 30px;
            color: #262626;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 8px;
            border: 1px solid #dbdbdb;
            background: #fafafa;
            border-radius: 3px;
            font-size: 12px;
            box-sizing: border-box;
        }
        input:focus {
            border: 1px solid #a8a8a8;
            outline: none;
        }
        .btn-login {
            width: 100%;
            background-color: #0095f6;
            color: white;
            border: none;
            padding: 7px;
            border-radius: 4px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            margin-top: 8px;
        }
        .btn-login:hover { background-color: #1877f2; }
        .divider {
            margin: 20px 0;
            display: flex;
            align-items: center;
            color: #8e8e8e;
            font-size: 13px;
            font-weight: 600;
        }
        .divider::before, .divider::after {
            content: "";
            flex: 1;
            height: 1px;
            background: #dbdbdb;
            margin: 0 10px;
        }
        .error-msg { color: #ed4956; font-size: 14px; margin-bottom: 10px; }
        .signup-box {
            background: white;
            border: 1px solid #dbdbdb;
            width: 350px;
            padding: 20px;
            margin-top: 10px;
            text-align: center;
            box-sizing: border-box;
            font-size: 14px;
        }
        .signup-box a { color: #0095f6; text-decoration: none; font-weight: 600; }
    </style>
</head>
<body>

    <div class="login-card">
        <div class="logo">InstaClone</div>
        
        <% if(request.getParameter("error") != null) { %>
            <div class="error-msg">Invalid username or password.</div>
        <% } %>

        <form action="<%= path %>/login" method="post">
            <input type="text" name="username" placeholder="Phone number, username, or email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" class="btn-login">Log In</button>
        </form>

        <div class="divider">OR</div>
        <p style="color: #385185; font-size: 14px; font-weight: 600; cursor: pointer;">
            Log in with Facebook
        </p>
    </div>

    <div class="signup-box">
        Don't have an account? <a href="signup.jsp">Sign up</a>
    </div>

</body>
</html>