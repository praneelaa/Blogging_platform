<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<!-- 🔘 Dark Mode Toggle -->
<button class="toggle-theme" onclick="toggleTheme()">Toggle Theme</button>

<!-- 🔹 Navigation -->
<div style="text-align: right; margin: 10px 20px;">
    <a href="${pageContext.request.contextPath}/login" class="btn">🔐 Login</a>
    <a href="${pageContext.request.contextPath}/" class="btn">🏠 Home</a>
</div>

<!-- 🔹 Header -->
<header>
    <h2>📝 User Registration</h2>
</header>

<!-- 🔹 Registration Form -->
<div class="container">
    <form action="register" method="post" class="form-card">
        <input type="text" name="username" placeholder="👤 Username" required />
        <input type="password" name="password" placeholder="🔒 Password" required />
        <button type="submit" class="btn">✅ Register</button>
    </form>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
</div>

<!-- 🔘 Dark Mode Script -->
<script>
function toggleTheme() {
    document.body.classList.toggle('dark-mode');
}
</script>

</body>
</html>
