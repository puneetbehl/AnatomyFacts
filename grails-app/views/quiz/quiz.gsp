<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>Quiz</title>
</head>

<body>
<g:form controller="quiz" url="#">
    <g:render template="quizTemplate" model='[questions: questions]'/>
</g:form>
</body>
</html>