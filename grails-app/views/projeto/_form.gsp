<%@ page import="todo.Projeto" %>



<div class="form-group ${hasErrors(bean: projetoInstance, field: 'nome', 'error')} required">

  <label class="col-sm-2 control-label" for="nome">
    <g:message code="projeto.nome.label" default="Nome" />
    <span class="required-indicator">*</span>
  </label>
  <div class="col-sm-10">
    <g:textField class="form-control" name="nome" required="" value="${projetoInstance?.nome}"/>
  </div>

</div>

<div class="form-group ${hasErrors(bean: projetoInstance, field: 'tarefas', 'error')} ">

  <label class="col-sm-2 control-label" for="tarefas">
    <g:message code="projeto.tarefas.label" default="Tarefas" />

  </label>
  <div class="col-sm-10">

<ul class="one-to-many">
<g:each in="${projetoInstance?.tarefas?}" var="t">
    <li><g:link controller="tarefa" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>

  </div>

</div>

