
<%@ page import="com.intelligrape.anatomyfacts.TestQuestion" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'testQuestion.label', default: 'TestQuestion')}"/>
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
                
                <g:sortableColumn property="content" title="${message(code: 'testQuestion.content.label', default: 'Content')}"/>
                
                <th><g:message code="testQuestion.category.label" default="Category"/></th>
                
                <g:sortableColumn property="answer" title="${message(code: 'testQuestion.answer.label', default: 'Answer')}"/>
                
                <g:sortableColumn property="dateCreated" title="${message(code: 'testQuestion.dateCreated.label', default: 'Date Created')}"/>
                
                <g:sortableColumn property="description" title="${message(code: 'testQuestion.description.label', default: 'Description')}"/>
                
                <g:sortableColumn property="lastUpdated" title="${message(code: 'testQuestion.lastUpdated.label', default: 'Last Updated')}"/>
                
            </tr>
        </thead>
        <tbody>
            <g:each in="${testQuestionList}" status="i" var="testQuestion">
                <tr>
                    
                    <td><g:link action="show" id="${testQuestion.id}">${fieldValue(bean: testQuestion, field: "content")}</g:link></td>
                    
                    <td>${fieldValue(bean: testQuestion, field: "category")}</td>
                    
                    <td><g:formatBoolean boolean="${testQuestion.answer}"/></td>
                    
                    <td><g:formatDate date="${testQuestion.dateCreated}"/></td>
                    
                    <td>${fieldValue(bean: testQuestion, field: "description")}</td>
                    
                    <td><g:formatDate date="${testQuestion.lastUpdated}"/></td>
                    
                </tr>
            </g:each>
        </tbody>
    </table>

    <div class="pagination pagination-right">
        <g:paginate total="${testQuestionTotal}"/>
    </div>
</body>
</html>
