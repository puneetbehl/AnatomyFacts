<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>Quiz Result</title>
</head>

<body>
<table class="table table-bordered table-striped table-hover">
    <g:render template="result" model="[quizAnswers: quiz?.quizAnswers, totalScore: totalScore]"/>
</table>
</body>
</html>