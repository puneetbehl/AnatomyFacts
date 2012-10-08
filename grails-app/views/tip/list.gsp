<%@ page import="com.intelligrape.anatomyfacts.Tip" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'tip.label', default: 'Tip')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="navbar">
    <div class="navbar-inner">
        <a class="brand" href="#">Tips</a>
        <ul class="nav pull-right">
            <li><g:link action="create"><i class="icon-plus-sign"></i>&nbsp;New</g:link></li>
        </ul>
    </div>
</div>
<table class="table table-bordered table-striped table-hover">
    <thead>
    <tr>

        <g:sortableColumn property="content" title="${message(code: 'tip.content.label', default: 'Content')}"/>

        <th><g:message code="tip.category.label" default="Category"/></th>

        <g:sortableColumn property="dateCreated" title="${message(code: 'tip.dateCreated.label', default: 'Date Created')}"/>

        <g:sortableColumn property="lastUpdated" title="${message(code: 'tip.lastUpdated.label', default: 'Last Updated')}"/>

    </tr>
    </thead>
    <tbody>
    <g:each in="${tipList}" status="i" var="tip">
        <tr>

            <td><g:link action="show" id="${tip.id}">${fieldValue(bean: tip, field: "content")}</g:link></td>

            <td>${fieldValue(bean: tip, field: "category")}</td>

            <td><g:formatDate date="${tip.dateCreated}"/></td>

            <td><g:formatDate date="${tip.lastUpdated}"/></td>

        </tr>
    </g:each>
    </tbody>
</table>

<div class="pagination pagination-right">
    <g:paginate total="${tipTotal}"/>
</div>
</body>
</html>
