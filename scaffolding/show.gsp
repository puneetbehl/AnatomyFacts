<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
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
		<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
			allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
			props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
			Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
			props.each { p -> %>
            <tr>
            <g:if test="\${${propertyName}?.${p.name}||${p.type == boolean || p.type == Boolean}}">
				    <td><strong><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></strong></td>
				    <%  if (p.isEnum()) { %>
			    		<td><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></td>
			    	<%  } else if (p.oneToMany || p.manyToMany) { %>
			    		<td><ul class="unstyled"><g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
                            <li><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></li>
			    		</g:each></ul></td>
			    	<%  } else if (p.manyToOne || p.oneToOne) { %>
			    		<td><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.
			    		encodeAsHTML()}</g:link></td>
			    	<%  } else if (p.type == Boolean || p.type == boolean) { %>
			    		<td><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></td>
			    	<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
			    		<td><g:formatDate date="\${${propertyName}?.${p.name}}" /></td>
			    	<%  } else if(!p.type.isArray()) { %>
			    		<td><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></td>
			    	<%  } %>
		    </g:if>
            </tr>
		<%  } %>
    </table>
	<g:form>
        <g:hiddenField name="id" value="\${${propertyName}?.id}" />
               <g:link class="btn btn-info" action="create"
                       id="\${${propertyName}?.id}"><g:message code="default.button.edit.label" default="Edit" />&nbsp;<i class="icon-edit icon-white"></i></g:link>
               <g:actionSubmit class="btn btn-danger" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}"
                               onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
               />
	</g:form>
</body>
</html>
