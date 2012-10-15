<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>Quiz</title>
</head>

<body>
<g:form controller="quiz" action="result">
    <g:render template="form" model='[questions: questions, categoryIds: categoryIds]'/>
</g:form>
</body>
</html>