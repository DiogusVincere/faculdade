import 'dart:io';

void main() {
  // Recebe os 4 valores numéricos do usuário
  stdout.write("Digite o primeiro valor: ");
  double valor1 = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  stdout.write("Digite o segundo valor: ");
  double valor2 = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  stdout.write("Digite o terceiro valor: ");
  double valor3 = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  stdout.write("Digite o quarto valor: ");
  double valor4 = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  // Exibe as opções de operação para o usuário
  stdout.write("Escolha a operação que deseja realizar (+, -, *, /): ");
  String operacao = stdin.readLineSync() ?? "";

  // Realiza a operação escolhida pelo usuário
  double resultado;

  switch (operacao) {
    case "+":
      resultado = valor1 + valor2 + valor3 + valor4;
      print("Resultado da soma: $resultado");
      break;
    case "-":
      resultado = valor1 - valor2 - valor3 - valor4;
      print("Resultado da subtração: $resultado");
      break;
    case "*":
      resultado = valor1 * valor2 * valor3 * valor4;
      print("Resultado da multiplicação: $resultado");
      break;
    case "/":
      if (valor2 == 0 || valor3 == 0 || valor4 == 0) {
        print("Erro: Não é possível dividir por zero!");
      } else {
        resultado = valor1 / valor2 / valor3 / valor4;
        print("Resultado da divisão: $resultado");
      }
      break;
    default:
      print("Operação inválida! Escolha entre (+, -, *, /).");
  }
}
