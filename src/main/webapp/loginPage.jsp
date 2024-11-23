<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
<div class="row">
    <div class="col-4 offset-4 mt-4">
        <div class="card">
            <div class="card-header bg-dark text-white">
                <h1>Login page</h1>
            </div>
            <div class="card-body">
                <form action="/loginServlet" method="post">
                    <input type="text" placeholder="Phone number" class="form-control" name="phone">
                    <input type="password" placeholder="Password" class="form-control my-2" name="password">
                    <button class="btn btn-dark">Login</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
