<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
    <g:hasErrors bean="\${${propertyName}}">
        <ul class="errors" role="alert">
            <g:eachError bean="\${${propertyName}}" var="error">
                <li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <div class="navbar">
        <div class="navbar-inner">
            <a class="brand" href="#"><g:message code="default.create.label" args="[entityName]" /></a>
            <ul class="nav pull-right">
                <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
    </div>

			<g:form action="save" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
                <g:if test="\${${propertyName}?.id}">
                    <g:hiddenField name="id" value="\${${propertyName}?.id}" />
                    <g:hiddenField name="version" value="\${${propertyName}?.version}" />
                </g:if>
                <fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
                    <g:if test="\${${propertyName}?.id}">
                        <g:actionSubmit class="save" action="save" value="\${message(code: 'default.button.update.label', default: 'Update')}" />
                        <g:actionSubmit class="delete" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:if><g:else>
                        <g:submitButton name="create" class="save" value="\${message(code: 'default.button.create.label', default: 'Create')}" />
                    </g:else>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
