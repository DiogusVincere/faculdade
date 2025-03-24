import 'dart:io';

void main() {
  // Solicita ao usuário a quantidade de kWh consumido e o tipo de instalação
  stdout.write("Digite a quantidade de kWh consumida: ");
  double kWh = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  stdout.write("Digite o tipo de instalação (R - Residencial, I - Industrial, C - Comercial): ");
  String tipoInstalacao = stdin.readLineSync()?.toUpperCase() ?? "";

  // Variáveis para armazenar o preço unitário por kWh
  double precoUnitario;

  // Calculando o preço com base no tipo de instalação e quantidade de kWh
  if (tipoInstalacao == "R") {  // Residencial
    if (kWh <= 500) {
      precoUnitario = 0.50;  // Até 500 kWh, preço é 0,50
    } else {
      precoUnitario = 0.70;  // Acima de 500 kWh, preço é 0,70
    }
  } else if (tipoInstalacao == "C") {  // Comercial
    if (kWh <= 100) {
      precoUnitario = 0.65;  // Até 100 kWh, preço é 0,65
    } else {
      precoUnitario = 0.60;  // Acima de 100 kWh, preço é 0,60
    }
  } else if (tipoInstalacao == "I") {  // Industrial
    if (kWh <= 5000) {
      precoUnitario = 0.55;  // Até 5000 kWh, preço é 0,55
    } else {
      precoUnitario = 0.50;  // Acima de 5000 kWh, preço é 0,50
    }
  } else {
    print("Tipo de instalação inválido.");
    return;
  }

  // Calculando o valor total a ser pago
  double valorTotal = precoUnitario * kWh;

  // Exibindo o valor total a ser pago
  print("\nTipo de instalação: $tipoInstalacao");
  print("Quantidade de kWh consumido: $kWh");
  print("Preço a ser pago: R\$ ${valorTotal.toStringAsFixed(2)}");
}
