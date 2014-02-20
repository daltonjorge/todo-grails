<% import grails.persistence.Event %>
<%=packageName%>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
  </head>
  <body>
    <ol class="breadcrumb">
      <li>
        <g:link action="index">
          <g:message code="${domainClass.propertyName}.plural.label" default="${domainClass.name}s" />
        </g:link>
      </li>
      <li class="active"><g:message code="default.edit.label" args="[${domainClass.propertyName}Instance]" /></li>
    </ol>
    <div id="show-${domainClass.propertyName}" class="scaffold-show" role="main">
      <g:if test="\${flash.message}">
      <div class="alert \${flash.type}" role="status">
        <a class="close" data-dismiss="alert" href="#">×</a>\${flash.message}
      </div>
      </g:if>

      <form class="form-horizontal">
        <%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
        allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
        props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
        props.each { p -> %>
          <div class="form-group">
            <label class="col-sm-2 control-label"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></label>
            <div class="col-sm-10">
              <%  if (p.isEnum()) { %>
              <p class="form-control-static" aria-labelledby="${p.name}-label">
                <g:fieldValue bean="\${${propertyName}}" field="${p.name}"/>
              </p>
              <%  } else if (p.oneToMany || p.manyToMany) { %>
              <g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
              <p class="form-control-static" aria-labelledby="${p.name}-label">
                <g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link>
              </p>
              </g:each>
              <%  } else if (p.manyToOne || p.oneToOne) { %>
              <p class="form-control-static" aria-labelledby="${p.name}-label">
                <g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link>
              </p>
              <%  } else if (p.type == Boolean || p.type == boolean) { %>
              <p class="form-control-static" aria-labelledby="${p.name}-label">
                <g:formatBoolean boolean="\${${propertyName}?.${p.name}}" />
              </p>
              <%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
              <p class="form-control-static" aria-labelledby="${p.name}-label">
                <g:formatDate date="\${${propertyName}?.${p.name}}" />
              </p>
              <%  } else if(!p.type.isArray()) { %>
              <p class="form-control-static" aria-labelledby="${p.name}-label">
                <g:fieldValue bean="\${${propertyName}}" field="${p.name}"/>
              </p>
              <%  } %>
            </div>
          </div>
        <%  } %>
      </form>
    </div>
    <div class="form-actions">
      <g:link class="btn btn-warning" action="edit" id="\${${domainClass.propertyName}Instance?.id}">
        <i class="icon-pencil icon-white"></i>
        <g:message code="default.button.edit.label" default="Edit" />
      </g:link>
      <g:link class="btn btn-danger" action="delete" id="\${${domainClass.propertyName}Instance?.id}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
        <i class="icon-trash icon-white"></i>
        <g:message code="default.button.delete.label" default="Delete" />
      </g:link>
      <g:link class="btn btn-success" action="create">
        <span class="glyphicon glyphicon-plus icon-white"></span>
        <g:message code="default.create.label" args="[entityName]" />
      </g:link>
    </div>
  </body>
</html>
