<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>Quiz</title>
</head>

<body>
<g:form controller="quiz" url="#">
    <table class="table table-bordered table-striped table-hover">
            <g:render template="quizTemplate" model='[questions: questions]'/>
    </table>
</g:form>
</body>
</html>