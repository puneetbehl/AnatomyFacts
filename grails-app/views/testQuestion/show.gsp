
<%@ page import="com.intelligrape.anatomyfacts.TestQuestion" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'testQuestion.label', default: 'TestQuestion')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
    <div class="navbar">
        <div class="navbar-inner">
            <a class="brand" href="#"><g:message code="default.show.label" args="[entityName]" /></a>
            <ul class="nav pull-right">
                <li><g:link action="list"><i class="icon-list"></i>&nbsp;<g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link action="create"><i class="icon-plus-sign"></i>&nbsp;<g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
    </div>
    <table class="table table-bordered">
		
            <tr>
            <g:if test="${testQuestion?.content||false}">
				    <td><strong><g:message code="testQuestion.content.label" default="Content" /></strong></td>
				    
			    		<td><g:fieldValue bean="${testQuestion}" field="content"/></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${testQuestion?.category||false}">
				    <td><strong><g:message code="testQuestion.category.label" default="Category" /></strong></td>
				    
			    		<td><g:link controller="category" action="show" id="${testQuestion?.category?.id}">${testQuestion?.category?.
			    		encodeAsHTML()}</g:link></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${testQuestion?.tags||false}">
				    <td><strong><g:message code="testQuestion.tags.label" default="Tags" /></strong></td>
				    
			    		<td><ul class="unstyled"><g:each in="${testQuestion.tags}" var="t">
                            <li><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
			    		</g:each></ul></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${testQuestion?.answer||true}">
				    <td><strong><g:message code="testQuestion.answer.label" default="Answer" /></strong></td>
				    
			    		<td><g:formatBoolean boolean="${testQuestion?.answer}" /></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${testQuestion?.dateCreated||false}">
				    <td><strong><g:message code="testQuestion.dateCreated.label" default="Date Created" /></strong></td>
				    
			    		<td><g:formatDate date="${testQuestion?.dateCreated}" /></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${testQuestion?.description||false}">
				    <td><strong><g:message code="testQuestion.description.label" default="Description" /></strong></td>
				    
			    		<td><g:fieldValue bean="${testQuestion}" field="description"/></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${testQuestion?.lastUpdated||false}">
				    <td><strong><g:message code="testQuestion.lastUpdated.label" default="Last Updated" /></strong></td>
				    
			    		<td><g:formatDate date="${testQuestion?.lastUpdated}" /></td>
			    	
		    </g:if>
            </tr>
		
    </table>
	<g:form>
        <g:hiddenField name="id" value="${testQuestion?.id}" />
               <g:link class="btn btn-info" action="create"
                       id="${testQuestion?.id}"><g:message code="default.button.edit.label" default="Edit" />&nbsp;<i class="icon-edit icon-white"></i></g:link>
               <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                               onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
               />
	</g:form>
</body>
</html>
