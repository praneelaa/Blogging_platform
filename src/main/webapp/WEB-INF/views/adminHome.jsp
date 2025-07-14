<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.blogging_platform.Model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<!-- 🔘 Dark Mode Toggle -->
<button class="toggle-theme" onclick="toggleTheme()">Toggle Theme</button>

<!-- 🔹 Header -->
<header>
    <h2>
        Welcome,
        <%= (session.getAttribute("loggedInUser") != null) 
                ? ((User) session.getAttribute("loggedInUser")).getUsername() 
                : "Admin" %>
    </h2>
</header>

<!-- 🔹 Navigation -->
<nav>
    <a href="${pageContext.request.contextPath}/blogForm" class="btn">➕ Add New Blog</a>
    <a href="${pageContext.request.contextPath}/questionForm" class="btn">❓ Ask a Fun Question</a>
    <a href="${pageContext.request.contextPath}/blogs" class="btn">📚 View All Blogs</a>
    <a href="${pageContext.request.contextPath}/adminHome" class="btn">🏠 Home</a>
    <a href="${pageContext.request.contextPath}/logout" class="btn">🚪 Logout</a>
</nav>

<!-- 🔹 Container -->
<div class="container admin-theme">
    <p>This is your admin control panel. Use the options above to manage content.</p>
</div>

<!-- 🔘 Dark Mode Script -->
<script>
function toggleTheme() {
    document.body.classList.toggle('dark-mode');
}
</script>

</body>
</html>
