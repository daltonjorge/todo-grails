
<%@ page import="todo.Projeto" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'projeto.label', default: 'Projeto')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
  </head>
  <body>
    <ol class="breadcrumb">
      <li class="active"><g:message code="projeto.plural.label" default="Projetos" /></li>
    </ol>
    <g:if test="${flash.message}">
    <div class="alert ${flash.type}" role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
    </g:if>
    <table class="table table-striped table-condensed">
      <thead>
        <tr>
          
          <g:sortableColumn property="nome" title="${message(code: 'projeto.nome.label', default: 'Nome')}" />
          
        </tr>
      </thead>
      <tbody>
        <g:each in="${projetoInstanceList}" status="i" var="projetoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
          
          <td><g:link action="show" id="${projetoInstance.id}">${fieldValue(bean: projetoInstance, field: "nome")}</g:link></td>
          
        </tr>
        </g:each>
      </tbody>
    </table>
    <div class="pagination">
      <g:paginate total="${projetoInstanceCount}" />
    </div>
    <div class="form-actions">
      <g:link class="btn btn-success" action="create">
        <span class="glyphicon glyphicon-plus icon-white"></span>
        <g:message code="default.create.label" args="[entityName]" />
      </g:link>
    </div>
  </body>
</html>
