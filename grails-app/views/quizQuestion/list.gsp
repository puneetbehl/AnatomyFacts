
<%@ page import="com.intelligrape.anatomyfacts.QuizQuestion" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'quizQuestion.label', default: 'QuizQuestion')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
    <div class="navbar">
        <div class="navbar-inner">
            <a class="brand" href="#"><g:message code="default.list.label" args="[entityName]"/></a>
            <ul class="nav pull-right">
                <li><g:link action="create"><i class="icon-plus-sign"></i>&nbsp;<g:message code="default.new.label" args="[entityName]"/></g:link></li>
            </ul>
        </div>
    </div>
    <table class="table table-bordered table-striped table-hover">
        <thead>
            <tr>
                
                <g:sortableColumn property="content" title="${message(code: 'quizQuestion.content.label', default: 'Content')}"/>
                
                <th><g:message code="quizQuestion.category.label" default="Category"/></th>
                
                <g:sortableColumn property="dateCreated" title="${message(code: 'quizQuestion.dateCreated.label', default: 'Date Created')}"/>
                
                <g:sortableColumn property="description" title="${message(code: 'quizQuestion.description.label', default: 'Description')}"/>
                
                <g:sortableColumn property="lastUpdated" title="${message(code: 'quizQuestion.lastUpdated.label', default: 'Last Updated')}"/>
                
            </tr>
        </thead>
        <tbody>
            <g:each in="${quizQuestionList}" status="i" var="quizQuestion">
                <tr>
                    
                    <td><g:link action="show" id="${quizQuestion.id}">${fieldValue(bean: quizQuestion, field: "content")}</g:link></td>
                    
                    <td>${fieldValue(bean: quizQuestion, field: "category")}</td>
                    
                    <td><g:formatDate date="${quizQuestion.dateCreated}"/></td>
                    
                    <td>${fieldValue(bean: quizQuestion, field: "description")}</td>
                    
                    <td><g:formatDate date="${quizQuestion.lastUpdated}"/></td>
                    
                </tr>
            </g:each>
        </tbody>
    </table>

    <div class="pagination pagination-right">
        <g:paginate total="${quizQuestionTotal}"/>
    </div>
</body>
</html>
