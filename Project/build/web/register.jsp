<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <style type="text/css">
            body {
                background-color: #f5f5f5;
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 500px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            h1 {
                text-align: center;
                color: #d32f2f;
                margin-bottom: 20px;
            }
            label {
                display: block;
                font-weight: bold;
                margin-top: 10px;
                color: #333;
            }
            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 3px;
                box-sizing: border-box;
            }
            button {
                width: 100%;
                padding: 10px;
                background-color: #d32f2f;
                color: #fff;
                border: none;
                border-radius: 3px;
                font-size: 16px;
                cursor: pointer;
            }
            button:hover {
                background-color: #b71c1c;
            }
            .error {
                color: red;
                text-align: center;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Register form</h1>
            <div class="error">
                <h4>${requestScope.er}</h4>
                <h4>${requestScope.err}</h4>
            </div>
            <form action="register" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <label for="repass">Re-Enter Password:</label>
                <input type="password" id="repass" name="repass" required>

                <button type="submit">Register</button>
            </form>
        </div>
    </body>
</html>
