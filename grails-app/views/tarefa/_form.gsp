<%@ page import="todo.Tarefa" %>



<div class="form-group ${hasErrors(bean: tarefaInstance, field: 'nome', 'error')} required">
  
  <label class="col-sm-2 control-label" for="nome">
    <g:message code="tarefa.nome.label" default="Nome" />
    <span class="required-indicator">*</span>
  </label>
  <div class="col-sm-10">
    <g:textField class="form-control" name="nome" required="" value="${tarefaInstance?.nome}"/>
  </div>
  
</div>

<div class="form-group ${hasErrors(bean: tarefaInstance, field: 'concluido', 'error')} ">
  
  <div class="col-sm-offset-2 col-sm-10">
    <div class="checkbox">
      <label>
        <g:checkBox name="concluido" value="${tarefaInstance?.concluido}" />
        <g:message code="tarefa.concluido.label" default="Concluido" />
      </label>
    </div>
  </div>
  
</div>

<div class="form-group ${hasErrors(bean: tarefaInstance, field: 'projeto', 'error')} required">
  
  <label class="col-sm-2 control-label" for="projeto">
    <g:message code="tarefa.projeto.label" default="Projeto" />
    <span class="required-indicator">*</span>
  </label>
  <div class="col-sm-10">
    <g:select id="projeto" name="projeto.id" from="${todo.Projeto.list()}" optionKey="id" required="" value="${tarefaInstance?.projeto?.id}" class="form-control many-to-one"/>
  </div>
  
</div>

