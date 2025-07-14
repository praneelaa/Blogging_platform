<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Ask a Fun Question</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<!-- 🔘 Dark Mode Toggle -->
<button class="toggle-theme" onclick="toggleTheme()">Toggle Theme</button>

<!-- 🔹 Header -->
<header>
    <h2>❓ Ask a Fun Question</h2>
</header>

<!-- 🔹 Navigation -->
<nav>
    <a href="${pageContext.request.contextPath}/adminHome" class="btn">🏠 Home</a>
    <a href="${pageContext.request.contextPath}/logout" class="btn">🚪 Logout</a>
</nav>

<!-- 🔹 Question Form -->
<div class="container admin-theme">
    <form action="addQuestion" method="post" class="form-card">
        <textarea name="question" placeholder="What's your fun question?" rows="3" required></textarea>

        <!-- Set createdBy dynamically from session -->
        <input type="hidden" name="createdBy" value="${sessionScope.loggedInUser.username}" />

        <button type="submit" class="btn">📢 Post Question</button>
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
