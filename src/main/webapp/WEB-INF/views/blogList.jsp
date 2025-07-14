<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Blogs</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<!-- 🔘 Dark Mode Toggle -->
<button class="toggle-theme" onclick="toggleTheme()">Toggle Theme</button>

<!-- 🔹 Header with Navigation -->
<header>
    <h2>📚 Explore Blogs</h2>
    <div style="float: right;">
        <a href="${pageContext.request.contextPath}/userHome" class="btn">🏠 Home</a>
        <a href="${pageContext.request.contextPath}/logout" class="btn">🚪 Logout</a>
    </div>
</header>

<!-- 🔹 Blog Display Section -->
<div class="container user-theme">
    <c:forEach var="blog" items="${blogs}">
        <div class="blog-card">
            <h3>📝 ${blog.title}</h3>
            <p>${blog.content}</p>
            <p><strong>Posted by:</strong> ${blog.createdBy}</p>

            <!-- ✅ View/Add Comments Link -->
            <form action="comments" method="get">
                <input type="hidden" name="blogId" value="${blog.id}" />
                <button type="submit" class="btn">💬 View/Add Comments</button>
            </form>
        </div>
    </c:forEach>
</div>

<!-- 🔘 Dark Mode Script -->
<script>
function toggleTheme() {
    document.body.classList.toggle('dark-mode');
}
</script>

</body>
</html>
