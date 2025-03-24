import 'dart:io';

double converterParaEuro(double valorEmReais) {
  return valorEmReais / 7.00;  // Conversão para Euro
}

double converterParaDolar(double valorEmReais) {
  return valorEmReais / 6.56;  // Conversão para Dólar
}

double converterParaFrancoSuico(double valorEmReais) {
  return valorEmReais / 4.35;  // Conversão para Franco Suíço
}

void main() {
  // Solicita o valor em reais
  stdout.write("Digite o valor em reais (R$): ");
  double valorEmReais = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  // Solicita a escolha da moeda
  print("\nEscolha a moeda para conversão:");
  print("1. Euro (EUR)");
  print("2. Dólar (USD)");
  print("3. Franco Suíço (CHF)");
  stdout.write("Digite o número da opção desejada: ");
  int escolha = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  // Realiza a conversão de acordo com a escolha do usuário
  double valorConvertido;
  String moeda;

  switch (escolha) {
    case 1:
      valorConvertido = converterParaEuro(valorEmReais);
      moeda = "Euro (EUR)";
      break;
    case 2:
      valorConvertido = converterParaDolar(valorEmReais);
      moeda = "Dólar (USD)";
      break;
    case 3:
      valorConvertido = converterParaFrancoSuico(valorEmReais);
      moeda = "Franco Suíço (CHF)";
      break;
    default:
      print("Opção inválida!");
      return;
  }

  // Exibe o valor convertido
  print("\nO valor de R\$ $valorEmReais é equivalente a $valorConvertido ${moeda}.");
}
