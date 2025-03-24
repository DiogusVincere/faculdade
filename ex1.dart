import 'dart:io';

void main() {
  // Solicita o nome do usuário
  stdout.write("Digite seu nome: ");
  String nome = stdin.readLineSync() ?? "";

  // Solicita o curso do usuário
  stdout.write("Digite seu curso: ");
  String curso = stdin.readLineSync() ?? "";

  // Solicita a idade do usuário e converte para inteiro
  stdout.write("Digite sua idade: ");
  int idade = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  // Exibe as informações coletadas
  print("\nInformações do Usuário:");
  print("Nome: $nome");
  print("Curso: $curso");
  print("Idade: $idade anos");
}
