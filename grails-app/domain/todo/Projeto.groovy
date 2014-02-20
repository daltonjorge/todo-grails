package todo

class Projeto {

  String nome

  static hasMany = [tarefas: Tarefa]

    static constraints = {
      nome(blank: false)
    }

    String toString() {
      nome
    }
}
