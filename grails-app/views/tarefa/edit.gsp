<%@ page import="todo.Tarefa" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'tarefa.label', default: 'Tarefa')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
  </head>
  <body>
    <ol class="breadcrumb">
      <li>
        <g:link action="index">
          <g:message code="tarefa.plural.label" default="Tarefas" />
        </g:link>
      </li>
      <li class="active"><g:message code="default.edit.label" args="[tarefaInstance]" /></li>
    </ol>
    <div id="edit-tarefa" class="scaffold-edit" role="main">
      <g:if test="${flash.message}">
      <div class="alert ${flash.type}" role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${tarefaInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${tarefaInstance}" var="error">
        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
      </g:hasErrors>
      <g:form class="form-horizontal" url="[resource:tarefaInstanceInstance, action:'update']" method="PUT" >
        <fieldset>
          <g:hiddenField name="id" value="${tarefaInstance?.id}" />
          <g:hiddenField name="version" value="${tarefaInstance?.version}" />
          <g:render template="form"/>
          <div class="form-actions">
            <g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
            <g:link class="btn" action="show" id="${tarefaInstance.id}"><g:message code="Cancel" args="[entityName]" /></g:link>
          </div>
        </fieldset>
      </g:form>
    </div>
  </body>
</html>
