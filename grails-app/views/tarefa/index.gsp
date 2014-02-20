
<%@ page import="todo.Tarefa" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'tarefa.label', default: 'Tarefa')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
  </head>
  <body>
    <ol class="breadcrumb">
      <li class="active"><g:message code="tarefa.plural.label" default="Tarefas" /></li>
    </ol>
    <g:if test="${flash.message}">
    <div class="alert ${flash.type}" role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
    </g:if>
    <table class="table table-striped table-condensed">
      <thead>
        <tr>
          
          <g:sortableColumn property="nome" title="${message(code: 'tarefa.nome.label', default: 'Nome')}" />
          
          <g:sortableColumn property="concluido" title="${message(code: 'tarefa.concluido.label', default: 'Concluido')}" />
          
          <th><g:message code="tarefa.projeto.label" default="Projeto" /></th>
          
        </tr>
      </thead>
      <tbody>
        <g:each in="${tarefaInstanceList}" status="i" var="tarefaInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
          
          <td><g:link action="show" id="${tarefaInstance.id}">${fieldValue(bean: tarefaInstance, field: "nome")}</g:link></td>
          
          <td><g:formatBoolean boolean="${tarefaInstance.concluido}" /></td>
          
          <td>${fieldValue(bean: tarefaInstance, field: "projeto")}</td>
          
        </tr>
        </g:each>
      </tbody>
    </table>
    <div class="pagination">
      <g:paginate total="${tarefaInstanceCount}" />
    </div>
    <div class="form-actions">
      <g:link class="btn btn-success" action="create">
        <span class="glyphicon glyphicon-plus icon-white"></span>
        <g:message code="default.create.label" args="[entityName]" />
      </g:link>
    </div>
  </body>
</html>
