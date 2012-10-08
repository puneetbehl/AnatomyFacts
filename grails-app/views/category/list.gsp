
<%@ page import="com.intelligrape.anatomyfacts.Category" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
    <div class="navbar">
        <div class="navbar-inner">
            <a class="brand" href="#">Categories</a>
            <ul class="nav pull-right">
                <li><g:link action="create"><i class="icon-plus-sign"></i>&nbsp;New</g:link></li>
            </ul>
        </div>
    </div>
    <table class="table table-bordered table-striped table-hover">
        <thead>
            <tr>
                
                <g:sortableColumn property="name" title="${message(code: 'category.name.label', default: 'Name')}"/>
                
                <g:sortableColumn property="dateCreated" title="${message(code: 'category.dateCreated.label', default: 'Date Created')}"/>
                
                <g:sortableColumn property="lastUpdated" title="${message(code: 'category.lastUpdated.label', default: 'Last Updated')}"/>
                
            </tr>
        </thead>
        <tbody>
            <g:each in="${categoryList}" status="i" var="category">
                <tr>
                    
                    <td><g:link action="show" id="${category.id}">${fieldValue(bean: category, field: "name")}</g:link></td>
                    
                    <td><g:formatDate date="${category.dateCreated}"/></td>
                    
                    <td><g:formatDate date="${category.lastUpdated}"/></td>
                    
                </tr>
            </g:each>
        </tbody>
    </table>

    <div class="pagination pagination-right">
        <g:paginate total="${categoryTotal}"/>
    </div>
</body>
</html>
