
<%@ page import="com.intelligrape.anatomyfacts.Tip" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'tip.label', default: 'Tip')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
    <div class="navbar">
        <div class="navbar-inner">
            <a class="brand" href="#">Tip</a>
            <ul class="nav pull-right">
                <li><g:link action="list"><i class="icon-list"></i>&nbsp;List</g:link></li>
                <li><g:link action="create"><i class="icon-plus-sign"></i>&nbsp;New</g:link></li>
            </ul>
        </div>
    </div>
    <table class="table table-bordered">
		
            <tr>
            <g:if test="${tip?.content||false}">
				    <td><strong><g:message code="tip.content.label" default="Content" /></strong></td>
				    
			    		<td><g:fieldValue bean="${tip}" field="content"/></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${tip?.category||false}">
				    <td><strong><g:message code="tip.category.label" default="Category" /></strong></td>
				    
			    		<td><g:link controller="category" action="show" id="${tip?.category?.id}">${tip?.category?.
			    		encodeAsHTML()}</g:link></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${tip?.dateCreated||false}">
				    <td><strong><g:message code="tip.dateCreated.label" default="Date Created" /></strong></td>
				    
			    		<td><g:formatDate date="${tip?.dateCreated}" /></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${tip?.lastUpdated||false}">
				    <td><strong><g:message code="tip.lastUpdated.label" default="Last Updated" /></strong></td>
				    
			    		<td><g:formatDate date="${tip?.lastUpdated}" /></td>
			    	
		    </g:if>
            </tr>
		
    </table>
	<g:form>
        <g:hiddenField name="id" value="${tip?.id}" />
               <g:link class="btn btn-info" action="create"
                       id="${tip?.id}"><g:message code="default.button.edit.label" default="Edit" />&nbsp;<i class="icon-edit icon-white"></i></g:link>
               <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                               onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
               />
	</g:form>
</body>
</html>
