<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="bootstrap_5.3/bootstrap.min.css">
    <script defer src="bootstrap_5.3/bootstrap.min.js"></script>
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
    <main class="form-signin m-auto mt-5">
        <form action="user/login" method="post">
            <h1 class="h3 mb-3 fw-normal">Fazer Login</h1>

            <div class="form-floating">
                <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                <label for="floatingInput">Email address</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                <label for="floatingPassword">Password</label>
            </div>

            <button class="btn btn-primary w-100 py-2 my-5" type="submit">Sign in</button>
        </form>
    </main>
</body>
</html>