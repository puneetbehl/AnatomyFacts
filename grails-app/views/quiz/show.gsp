<%@ page import="com.intelligrape.anatomyfacts.Quiz" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="navbar">
    <div class="navbar-inner">
        <a class="brand" href="#">Quiz</a>
        <ul class="nav pull-right">
            <li><g:link action="list"><i class="icon-list"></i>&nbsp;List</g:link></li>
        </ul>
    </div>
</div>
<table class="table table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th>S.NO.</th>
        <th>Question</th>
        <th>Your Answer</th>
        <th>Correct Answer</th>
        <th>Description</th>
    </tr>
    </thead>
    <g:if test="${quiz?.quizAnswers || false}">
        <g:each in="${quiz.quizAnswers}" var="q" status="index">
            <tr>
                <td>${index+1}</td>
                <td>${q?.question?.content}</td>
                <td>${q?.answer}</td>
                <g:each in="${q?.question?.options}" var="option">
                    <g:if test="${option?.isCorrect}">
                        <td>${option?.value}</td>
                    </g:if>
                </g:each>
                <td>${q?.question?.description}</td>
            </tr>
        </g:each>
    </g:if>

</table>
</body>
</html>