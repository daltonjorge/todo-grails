package todo

class Tarefa {
  String nome
  Boolean concluido = false
  Projeto projeto

  static belongsTo = [projeto: Projeto]
  static constraints = {
    nome(blank:false)
  }

  String toString() {
    nome
  }
}
