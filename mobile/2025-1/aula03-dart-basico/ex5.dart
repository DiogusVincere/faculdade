import 'dart:io';

void main() {
  // Solicita as notas dos dois alunos
  stdout.write("Digite a primeira nota do aluno: ");
  double nota1 = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  stdout.write("Digite a segunda nota do aluno: ");
  double nota2 = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  // Calcula a média
  double media = (nota1 + nota2) / 2;

  // Exibe a média
  print("\nA média do aluno é: ${media.toStringAsFixed(2)}");

  // Verifica a situação do aluno conforme a média
  if (media >= 7) {
    print("Status: Aprovado");
  } else if (media >= 4 && media < 7) {
    print("Status: Exame");
  } else {
    print("Status: Reprovado");
  }
}
