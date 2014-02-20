      <table>
      <thead>
          <tr>
              <th>Nome</th>
              <th>Concluido</th>

          </tr>
        </thead>
        <tbody>
        <g:each in="${projetoInstance.tarefas}" status="i" var="tarefaInstance">
          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show" id="${tarefaInstance.id}">${fieldValue(bean: tarefaInstance, field: "nome")}</g:link></td>

            <td><g:formatBoolean boolean="${tarefaInstance.concluido}" /></td>

          </tr>
        </g:each>
        </tbody>
      </table>
