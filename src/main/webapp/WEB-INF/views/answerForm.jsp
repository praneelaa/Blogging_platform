<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.blogging_platform.Model.User" %>
<html>
<head>
    <title>Answer Questions</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<!-- 🔘 Dark Mode Toggle -->
<button class="toggle-theme" onclick="toggleTheme()">Toggle Theme</button>

<!-- 🔹 Header -->
<header>
    <h2>Hello, <%= ((User)session.getAttribute("loggedInUser")).getUsername() %>! Answer the Fun Questions</h2>
</header>

<!-- 🔹 Navigation -->
<nav>
    <a href="${pageContext.request.contextPath}/userHome" class="btn">🏠 Home</a>
    <a href="${pageContext.request.contextPath}/logout" class="btn">🚪 Logout</a>
</nav>

<!-- 🔹 Question Answering Section -->
<div class="container user-theme">
    <c:forEach var="question" items="${questions}">
        <div class="question-box">
            <p><strong>Q:</strong> ${question.question}</p>

            <form action="submitAnswer" method="post" class="form-card">
                <input type="hidden" name="questionId" value="${question.id}" />
                <input type="hidden" name="answeredBy" value="<%= ((User)session.getAttribute("loggedInUser")).getUsername() %>" />
                <input type="text" name="answer" placeholder="✍️ Your answer" required />
                <button type="submit">✅ Submit Answer</button>
            </form>

            <!-- ✅ Show existing answers -->
            <c:if test="${not empty answersMap[question.id]}">
                <div class="answers">
                    <p><strong>Answers:</strong></p>
                    <ul>
                        <c:forEach var="ans" items="${answersMap[question.id]}">
                            <li><strong>${ans.answeredBy}:</strong> ${ans.answer}</li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
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
