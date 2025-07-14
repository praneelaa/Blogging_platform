<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>All Fun Questions</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<!-- 🔘 Dark Mode Toggle -->
<button class="toggle-theme" onclick="toggleTheme()">Toggle Theme</button>

<!-- 🔹 Header -->
<header>
    <h2>📋 All Fun Questions</h2>
</header>

<!-- 🔹 Navigation -->
<nav>
    <a href="${pageContext.request.contextPath}/adminHome" class="btn">🏠 Home</a>
    <a href="${pageContext.request.contextPath}/logout" class="btn">🚪 Logout</a>
</nav>

<!-- 🔹 Questions Display -->
<div class="container admin-theme">
    <c:choose>
        <c:when test="${not empty questions}">
            <ul style="padding-left: 20px;">
                <c:forEach var="q" items="${questions}">
                    <li style="margin-bottom: 10px;">
                        <strong>Q:</strong> ${q.question} <br/>
                        <small>🧑 Posted by: <i>${q.createdBy}</i></small>
                    </li>
                </c:forEach>
            </ul>
        </c:when>
        <c:otherwise>
            <p>No questions have been posted yet.</p>
        </c:otherwise>
    </c:choose>
</div>

<!-- 🔘 Dark Mode Script -->
<script>
function toggleTheme() {
    document.body.classList.toggle('dark-mode');
}
</script>

</body>
</html>
