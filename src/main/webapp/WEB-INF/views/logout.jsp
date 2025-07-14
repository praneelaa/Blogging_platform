<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Logged Out</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<!-- 🔹 Message Section -->
<div class="container">
    <h2>✅ ${message}</h2>
    <p style="margin-top: 20px;">Click below to login again:</p>
    <a href="${pageContext.request.contextPath}/login" class="btn">🔐 Login</a>
</div>

<!-- 🔘 Optional: Dark Mode Toggle -->
<script>
function toggleTheme() {
    document.body.classList.toggle('dark-mode');
}
</script>

</body>
</html>
