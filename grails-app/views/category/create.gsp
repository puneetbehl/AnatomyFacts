<%@ page import="com.intelligrape.anatomyfacts.Category" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<g:hasErrors bean="${category}">
    <div class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <ul class="unstyled">
            <g:eachError bean="${category}" var="error">
                <li><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </div>
</g:hasErrors>
<div class="navbar">
    <div class="navbar-inner">
        <a class="brand" href="#">Category</a>
        <ul class="nav pull-right">
            <li><g:link class="list" action="list"><i class="icon-list"></i>&nbsp;List</g:link></li>
        </ul>
    </div>
</div>

<g:form class="form-horizontal" action="save">
    <g:if test="${category?.id}">
        <g:hiddenField name="id" value="${category?.id}"/>
        <g:hiddenField name="version" value="${category?.version}"/>
    </g:if>
    <g:render template="form"/>
    <div class="control-group">
        <g:if test="${category?.id}">
            <g:actionSubmit class="btn btn-info" action="save" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate=""
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </g:if><g:else>
            <g:submitButton name="create" class="btn btn-info" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </g:else>
    </div>
</g:form>

<div class="modal hide fade in" id="addQuestionModal" tabindex="-1" role="dialog" aria-labelledby="addQuestionModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

        <h3 id="addQuestionModalLabel">Question</h3>
    </div>

    <div class="modal-body">
        <g:link class="btn btn-large btn-block btn-primary" controller="quizQuestion" action="create"
                params='{"fromContext":"category", "category.id":"${category?.id}"}'>Quiz Question</g:link>
        <g:link class="btn btn-large btn-block btn-primary" controller="testQuestion" action="create" params="{fromContext:'category'}">Test Question</g:link>
    </div>

    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    </div>
</div>

<div class="modal hide fade in" id="addTipModal" tabindex="-1" role="dialog" aria-labelledby="addTipModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

        <h3 id="addTipModalLabel">Enter Tip Content</h3>
    </div>

    <g:form class="form-horizontal tip_form" controller="tip" action="save">
        <div class="modal-body">
            <g:hiddenField name="fromContext" value="category"/>
            <g:hiddenField name="category.id" value="${category?.id}"/>
            <g:textArea cols="15" rows="7" name="content" maxlength="200" required="" style="width: 90%"/>
        </div>

        <div class="modal-footer">
            <g:submitButton name="create" class="btn btn-info" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
    </g:form>
</div>
</body>
</html>
