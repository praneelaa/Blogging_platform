<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.blogging_platform.Model.User" %>
<html>
<head>
    <title>User Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<!-- 🔘 Dark Mode Toggle -->
<button class="toggle-theme" onclick="toggleTheme()">Toggle Theme</button>

<!-- 🔹 Header -->
<header>
    <h2>👋 Welcome, <%= ((User)session.getAttribute("loggedInUser")).getUsername() %></h2>
</header>

<!-- 🔹 Navigation Panel -->
<nav>
    <a href="${pageContext.request.contextPath}/userHome" class="btn">🏠 Home</a>
    <a href="${pageContext.request.contextPath}/questions" class="btn">📝 Answer Fun Questions</a>
    <a href="${pageContext.request.contextPath}/questionForm" class="btn">❓ Ask Doubt</a>
    <a href="${pageContext.request.contextPath}/blogs" class="btn">📚 View Blogs</a>
    <a href="${pageContext.request.contextPath}/logout" class="btn">🚪 Logout</a>
</nav>

<!-- 🔹 Content -->
<div class="container user-theme">
    <p>Welcome to the user dashboard! Choose an option above to continue.</p>
</div>

<!-- 🔘 Dark Mode Script -->
<script>
function toggleTheme() {
    document.body.classList.toggle('dark-mode');
}
</script>

</body>
</html>
