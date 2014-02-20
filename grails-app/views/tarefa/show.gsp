
<%@ page import="todo.Tarefa" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'tarefa.label', default: 'Tarefa')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
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
    <div id="show-tarefa" class="scaffold-show" role="main">
      <g:if test="${flash.message}">
      <div class="alert ${flash.type}" role="status">
        <a class="close" data-dismiss="alert" href="#">×</a>${flash.message}
      </div>
      </g:if>

      <form class="form-horizontal">
        
          <div class="form-group">
            <label class="col-sm-2 control-label"><g:message code="tarefa.nome.label" default="Nome" /></label>
            <div class="col-sm-10">
              
              <p class="form-control-static" aria-labelledby="nome-label">
                <g:fieldValue bean="${tarefaInstance}" field="nome"/>
              </p>
              
            </div>
          </div>
        
          <div class="form-group">
            <label class="col-sm-2 control-label"><g:message code="tarefa.concluido.label" default="Concluido" /></label>
            <div class="col-sm-10">
              
              <p class="form-control-static" aria-labelledby="concluido-label">
                <g:formatBoolean boolean="${tarefaInstance?.concluido}" />
              </p>
              
            </div>
          </div>
        
          <div class="form-group">
            <label class="col-sm-2 control-label"><g:message code="tarefa.projeto.label" default="Projeto" /></label>
            <div class="col-sm-10">
              
              <p class="form-control-static" aria-labelledby="projeto-label">
                <g:link controller="projeto" action="show" id="${tarefaInstance?.projeto?.id}">${tarefaInstance?.projeto?.encodeAsHTML()}</g:link>
              </p>
              
            </div>
          </div>
        
      </form>
    </div>
    <div class="form-actions">
      <g:link class="btn btn-warning" action="edit" id="${tarefaInstance?.id}">
        <i class="icon-pencil icon-white"></i>
        <g:message code="default.button.edit.label" default="Edit" />
      </g:link>
      <g:link class="btn btn-danger" action="delete" id="${tarefaInstance?.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
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
