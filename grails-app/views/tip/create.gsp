<%@ page import="com.intelligrape.anatomyfacts.Tip" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tip.label', default: 'Tip')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
    <g:hasErrors bean="${tip}">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <ul class="unstyled">
                <g:eachError bean="${tip}" var="error">
                    <li><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>
    <div class="navbar">
        <div class="navbar-inner">
            <a class="brand" href="#">Tip</a>
            <ul class="nav pull-right">
                <li><g:link class="list" action="list"><i class="icon-list"></i>&nbsp;List</g:link></li>
            </ul>
        </div>
    </div>

	<g:form class="form-horizontal" action="save" >
        <g:if test="${tip?.id}">
              <g:hiddenField name="id" value="${tip?.id}" />
              <g:hiddenField name="version" value="${tip?.version}" />
        </g:if>
	    <g:render template="form"/>
		<div class="control-group">
                <g:if test="${tip?.id}">
                    <g:actionSubmit class="btn btn-info" action="save" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate=""
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </g:if><g:else>
                    <g:submitButton name="create" class="btn btn-info" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </g:else>
	    </div>
	</g:form>
</body>
</html>
