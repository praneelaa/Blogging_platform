<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.blogging_platform.Model.User" %>
<html>
<head>
    <title>Comment on Blog</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<!-- 🔘 Dark Mode Toggle -->
<button class="toggle-theme" onclick="toggleTheme()">Toggle Theme</button>

<!-- 🔹 Header with Navigation -->
<header>
    <h2>💬 Blog Comments</h2>
    <div style="float: right;">
        <c:choose>
            <c:when test="${sessionScope.loggedInUser.role eq 'ADMIN'}">
                <a href="${pageContext.request.contextPath}/adminHome" class="btn">🏠 Home</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/userHome" class="btn">🏠 Home</a>
            </c:otherwise>
        </c:choose>
        <a href="${pageContext.request.contextPath}/logout" class="btn">🚪 Logout</a>
    </div>
</header>

<!-- 🔹 Display Comments -->
<div class="container user-theme">
    <h3>🗨️ Previous Comments:</h3>
    <c:forEach var="comment" items="${comments}">
        <div class="comment-box">
            <p><strong>${comment.commenter}:</strong> ${comment.comment}</p>
        </div>
    </c:forEach>
</div>

<!-- 🔹 Comment Form for Users -->
<c:if test="${sessionScope.loggedInUser.role ne 'ADMIN'}">
    <div class="container user-theme">
        <form action="addComment" method="post" class="form-card">
            <input type="hidden" name="blogId" value="${param.blogId}" />
            <input type="text" name="commenter" placeholder="Your Name" required />
            <textarea name="comment" placeholder="Your Comment" rows="4" required></textarea>
            <button type="submit" class="btn">📝 Submit</button>
        </form>
    </div>
</c:if>

<!-- 🔘 Dark Mode Script -->
<script>
function toggleTheme() {
    document.body.classList.toggle('dark-mode');
}
</script>

</body>
</html>
