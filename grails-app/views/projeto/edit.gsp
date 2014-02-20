<%@ page import="todo.Projeto" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'projeto.label', default: 'Projeto')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
  </head>
  <body>
    <ol class="breadcrumb">
      <li>
        <g:link action="index">
          <g:message code="projeto.plural.label" default="Projetos" />
        </g:link>
      </li>
      <li class="active"><g:message code="default.edit.label" args="[projetoInstance]" /></li>
    </ol>
    <div id="edit-projeto" class="scaffold-edit" role="main">
      <g:if test="${flash.message}">
      <div class="alert ${flash.type}" role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${projetoInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${projetoInstance}" var="error">
        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
      </g:hasErrors>
      <g:form class="form-horizontal" url="[resource:projetoInstanceInstance, action:'update']" method="PUT" >
        <fieldset>
          <g:hiddenField name="id" value="${projetoInstance?.id}" />
          <g:hiddenField name="version" value="${projetoInstance?.version}" />
          <g:render template="form"/>
          <div class="form-actions">
            <g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
            <g:link class="btn" action="show" id="${projetoInstance.id}"><g:message code="Cancel" args="[entityName]" /></g:link>
          </div>
        </fieldset>
      </g:form>
    </div>
  </body>
</html>
