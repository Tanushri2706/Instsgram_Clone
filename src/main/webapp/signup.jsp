<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up • InstaClone</title>
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
            padding: 40px 0;
        }
        .signup-card {
            background: white;
            border: 1px solid #dbdbdb;
            width: 350px;
            padding: 30px 40px;
            text-align: center;
            box-sizing: border-box;
        }
        .logo {
            font-family: 'Lobster', cursive;
            font-size: 45px;
            margin-bottom: 10px;
            color: #262626;
        }
        .subtitle {
            color: #8e8e8e;
            font-weight: 600;
            font-size: 17px;
            line-height: 20px;
            margin-bottom: 20px;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 6px;
            border: 1px solid #dbdbdb;
            background: #fafafa;
            border-radius: 3px;
            font-size: 12px;
            box-sizing: border-box;
        }
        .btn-signup {
            width: 100%;
            background-color: #0095f6;
            color: white;
            border: none;
            padding: 7px;
            border-radius: 4px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            margin-top: 10px;
        }
        .terms {
            color: #8e8e8e;
            font-size: 12px;
            margin-top: 15px;
        }
        .login-box {
            background: white;
            border: 1px solid #dbdbdb;
            width: 350px;
            padding: 20px;
            margin-top: 10px;
            text-align: center;
            box-sizing: border-box;
            font-size: 14px;
        }
        .login-box a { color: #0095f6; text-decoration: none; font-weight: 600; }
    </style>
</head>
<body>

    <div class="signup-card">
        <div class="logo">InstaClone</div>
        <div class="subtitle">Sign up to see photos and videos from your friends.</div>
        
        <form action="<%= path %>/signup" method="post">
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="text" name="username" placeholder="Username" required>
            <input type="number" name="age" placeholder="Age" required>
            <input type="text" name="phone" placeholder="Phone Number" required>
            <input type="password" name="password" placeholder="Password" required>
            
            <button type="submit" class="btn-signup">Sign Up</button>
        </form>

        <p class="terms">
            By signing up, you agree to our Terms, Data Policy and Cookies Policy.
        </p>
    </div>

    <div class="login-box">
        Have an account? <a href="login.jsp">Log in</a>
    </div>

</body>
</html>