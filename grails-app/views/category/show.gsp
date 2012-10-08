
<%@ page import="com.intelligrape.anatomyfacts.Category" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
    <div class="navbar">
        <div class="navbar-inner">
            <a class="brand" href="#">Category</a>
            <ul class="nav pull-right">
                <li><g:link action="list"><i class="icon-list"></i>&nbsp;List</g:link></li>
                <li><g:link action="create"><i class="icon-plus-sign"></i>&nbsp;New</g:link></li>
            </ul>
        </div>
    </div>
    <table class="table table-bordered">
		
            <tr>
            <g:if test="${category?.name||false}">
				    <td><strong><g:message code="category.name.label" default="Name" /></strong></td>
				    
			    		<td><g:fieldValue bean="${category}" field="name"/></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${category?.dateCreated||false}">
				    <td><strong><g:message code="category.dateCreated.label" default="Date Created" /></strong></td>
				    
			    		<td><g:formatDate date="${category?.dateCreated}" /></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${category?.lastUpdated||false}">
				    <td><strong><g:message code="category.lastUpdated.label" default="Last Updated" /></strong></td>
				    
			    		<td><g:formatDate date="${category?.lastUpdated}" /></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${category?.questions||false}">
				    <td><strong><g:message code="category.questions.label" default="Questions" /></strong></td>
				    
			    		<td><ul class="unstyled"><g:each in="${category.questions}" var="q">
                            <li><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
			    		</g:each></ul></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${category?.tips||false}">
				    <td><strong><g:message code="category.tips.label" default="Tips" /></strong></td>
				    
			    		<td><ul class="unstyled"><g:each in="${category.tips}" var="t">
                            <li><g:link controller="tip" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
			    		</g:each></ul></td>
			    	
		    </g:if>
            </tr>
		
    </table>
	<g:form>
        <g:hiddenField name="id" value="${category?.id}" />
               <g:link class="btn btn-info" action="create"
                       id="${category?.id}"><g:message code="default.button.edit.label" default="Edit" />&nbsp;<i class="icon-edit icon-white"></i></g:link>
               <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                               onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
               />
	</g:form>
</body>
</html>
