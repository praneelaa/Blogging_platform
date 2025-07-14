<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.blogging_platform.Model.User" %>
<html>
<head>
    <title>Create Blog</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<!-- 🔘 Dark Mode Toggle -->
<button class="toggle-theme" onclick="toggleTheme()">Toggle Theme</button>

<!-- 🔹 Header -->
<header>
    <h2>Create a New Blog</h2>
</header>

<!-- 🔹 Navigation -->
<nav>
    <a href="${pageContext.request.contextPath}/adminHome" class="btn">🏠 Home</a>
    <a href="${pageContext.request.contextPath}/logout" class="btn">🚪 Logout</a>
</nav>

<!-- 🔹 Container -->
<div class="container admin-theme">
    <form action="addBlog" method="post" class="form-card">
        <input type="text" name="title" placeholder="📝 Blog Title" required />
        
        <textarea name="content" placeholder="✍️ Write your blog here..." rows="6" required></textarea>

        <!-- Set createdBy using logged in admin's username -->
        <input type="hidden" name="createdBy" value="<%= ((User)session.getAttribute("loggedInUser")).getUsername() %>" />
        
        <button type="submit">🚀 Publish</button>
    </form>
</div>

<!-- 🔘 Dark Mode Script -->
<script>
function toggleTheme() {
    document.body.classList.toggle('dark-mode');
}
</script>

</body>
</html>
