class Aluno {
  int? id;
  String nome;
  String disciplina;
  double nota;

  Aluno({
    this.id,
    required this.nome,
    required this.disciplina,
    required this.nota,
  });

  // Converte o objeto Aluno para um mapa (para inserção no banco)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'disciplina': disciplina,
      'nota': nota,
    };
  }

  // Converte um mapa para um objeto Aluno
  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'],
      nome: map['nome'],
      disciplina: map['disciplina'],
      nota: map['nota'],
    );
  }
}
