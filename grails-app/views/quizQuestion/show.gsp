
<%@ page import="com.intelligrape.anatomyfacts.QuizQuestion" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'quizQuestion.label', default: 'QuizQuestion')}" />
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
            <g:if test="${quizQuestion?.content||false}">
				    <td><strong><g:message code="quizQuestion.content.label" default="Content" /></strong></td>
				    
			    		<td><g:fieldValue bean="${quizQuestion}" field="content"/></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${quizQuestion?.category||false}">
				    <td><strong><g:message code="quizQuestion.category.label" default="Category" /></strong></td>
				    
			    		<td><g:link controller="category" action="show" id="${quizQuestion?.category?.id}">${quizQuestion?.category?.
			    		encodeAsHTML()}</g:link></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${quizQuestion?.options||false}">
				    <td><strong><g:message code="quizQuestion.options.label" default="Options" /></strong></td>
				    
			    		<td><ul class="unstyled"><g:each in="${quizQuestion.options}" var="o">
                            <li><g:link controller="option" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
			    		</g:each></ul></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${quizQuestion?.dateCreated||false}">
				    <td><strong><g:message code="quizQuestion.dateCreated.label" default="Date Created" /></strong></td>
				    
			    		<td><g:formatDate date="${quizQuestion?.dateCreated}" /></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${quizQuestion?.description||false}">
				    <td><strong><g:message code="quizQuestion.description.label" default="Description" /></strong></td>
				    
			    		<td><g:fieldValue bean="${quizQuestion}" field="description"/></td>
			    	
		    </g:if>
            </tr>
		
            <tr>
            <g:if test="${quizQuestion?.lastUpdated||false}">
				    <td><strong><g:message code="quizQuestion.lastUpdated.label" default="Last Updated" /></strong></td>
				    
			    		<td><g:formatDate date="${quizQuestion?.lastUpdated}" /></td>
			    	
		    </g:if>
            </tr>
		
    </table>
	<g:form>
        <g:hiddenField name="id" value="${quizQuestion?.id}" />
               <g:link class="btn btn-info" action="create"
                       id="${quizQuestion?.id}"><g:message code="default.button.edit.label" default="Edit" />&nbsp;<i class="icon-edit icon-white"></i></g:link>
               <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                               onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
               />
	</g:form>
</body>
</html>
