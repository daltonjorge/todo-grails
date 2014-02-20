package todo

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProjetoController {

  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

  def index(Integer max) {
    params.max = Math.min(max ?: 10, 100)
    respond Projeto.list(params), model:[projetoInstanceCount: Projeto.count()]
  }

  def show(Projeto projetoInstance) {
    respond projetoInstance
  }

  def create() {
    respond new Projeto(params)
  }

  @Transactional
  def save(Projeto projetoInstance) {
    if (projetoInstance == null) {
      notFound()
      return
    }

    if (projetoInstance.hasErrors()) {
      respond projetoInstance.errors, view:'create'
      return
    }

    projetoInstance.save flush:true

    request.withFormat {
      form {
        flash.type = 'alert-success'
        flash.message = message(code: 'default.created.message',
          args: [message(code: 'projetoInstance.label', default: 'Projeto'),
          projetoInstance.id])
        redirect projetoInstance
      }
      '*' { respond projetoInstance, [status: CREATED] }
    }
  }

  def edit(Projeto projetoInstance) {
    respond projetoInstance
  }

  @Transactional
  def update(Projeto projetoInstance) {
    if (projetoInstance == null) {
      notFound()
        return
    }

    if (projetoInstance.hasErrors()) {
      respond projetoInstance.errors, view:'edit'
        return
    }

    projetoInstance.save flush:true

    request.withFormat {
      form {
        flash.type = 'alert-success'
        flash.message = message(code: 'default.updated.message',
          args: [message(code: 'Projeto.label', default: 'Projeto'),
          projetoInstance.id])
        redirect projetoInstance
      }
      '*'{ respond projetoInstance, [status: OK] }
    }
  }

  @Transactional
  def delete(Projeto projetoInstance) {

    if (projetoInstance == null) {
      notFound()
        return
    }

    projetoInstance.delete flush:true

    request.withFormat {
      form {
        flash.type = 'alert-success'
        flash.message = message(code: 'default.deleted.message',
          args: [message(code: 'Projeto.label', default: 'Projeto'),
          projetoInstance.id])
        redirect action:"index", method:"GET"
      }
      '*'{ render status: NO_CONTENT }
    }
  }

  protected void notFound() {
    request.withFormat {
      form {
        flash.type = 'alert-danger'
        flash.message = message(code: 'default.not.found.message',
          args: [message(code: 'projetoInstance.label', default: 'Projeto'),
          params.id])
        redirect action: "index", method: "GET"
      }
      '*'{ render status: NOT_FOUND }
    }
  }
}
