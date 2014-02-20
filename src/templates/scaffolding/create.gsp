<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
  </head>
  <body>
    <ol class="breadcrumb">
      <li>
        <g:link action="index">
          <g:message code="${domainClass.propertyName}.plural.label" default="${domainClass.name}s" />
        </g:link>
      </li>
      <li class="active"><g:message code="default.new.label" args="['${domainClass.name}']" /></li>
    </ol>
    <div id="create-${domainClass.propertyName}" class="scaffold-create" role="main">
      <g:if test="\${flash.message}">
      <div class="alert \${flash.type}" role="status"><a class="close" data-dismiss="alert" href="#">×</a>\${flash.message}</div>
      </g:if>
      <g:hasErrors bean="\${${propertyName}}">
      <ul class="errors" role="alert">
        <g:eachError bean="\${${propertyName}}" var="error">
        <li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
        </g:eachError>
      </ul>
      </g:hasErrors>
      <g:form class="form-horizontal" action="save" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
        <fieldset>
          <g:render template="form"/>
          <div class="form-actions">
            <g:submitButton name="create" class="btn btn-primary" value="\${message(code: 'default.button.create.label', default: 'Create')}" />
            <g:link class="btn" action="index"><g:message code="Cancel" args="[entityName]" /></g:link>
          </div>
        </fieldset>
      </g:form>
    </div>
  </body>
</html>
