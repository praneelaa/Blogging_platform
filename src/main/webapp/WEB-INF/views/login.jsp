<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 10px 20px;
        }
    </style>
</head>
<body>

<!-- 🔘 Top Bar with Toggle on left, buttons on right -->
<div class="top-bar">
    <button class="toggle-theme" onclick="toggleTheme()">Toggle Theme</button>

    <div>
        <a href="${pageContext.request.contextPath}/" class="btn">🏠 Home</a>
        <a href="${pageContext.request.contextPath}/register" class="btn">📝 Register</a>
    </div>
</div>

<!-- 🔹 Header -->
<header>
    <h2>🔐 Login</h2>
</header>

<!-- 🔹 Login Form -->
<div class="container">
    <form action="login" method="post" class="form-card">
        <input type="text" name="username" placeholder="👤 Username" required />
        <input type="password" name="password" placeholder="🔒 Password" required />
        <button type="submit" class="btn">➡️ Login</button>
    </form>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <p style="text-align: center; margin-top: 10px;">
        🙋‍♀️ New here? <a href="${pageContext.request.contextPath}/register">Register</a>
    </p>
</div>

<!-- 🔘 Dark Mode Script -->
<script>
function toggleTheme() {
    document.body.classList.toggle('dark-mode');
}
</script>

</body>
</html>
