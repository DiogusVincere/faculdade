import 'dart:io';

void main() {
  // Solicita ao usuário a quantidade de litros e o tipo de combustível
  stdout.write("Digite a quantidade de litros comprados: ");
  double litros = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  stdout.write("Digite o tipo de combustível (E - Etanol, D - Diesel, G - Gasolina): ");
  String tipoCombustivel = stdin.readLineSync()?.toUpperCase() ?? "";

  // Preço por litro para cada tipo de combustível
  double precoLitro;
  double percentualDesconto;

  // Calculando o valor total e o desconto conforme o tipo de combustível e quantidade comprada
  if (tipoCombustivel == "E") {
    precoLitro = 1.70;
    if (litros >= 15) {
      percentualDesconto = 0.04; // Desconto de 4% para etanol se comprar >= 15L
    } else {
      percentualDesconto = 0.03; // Desconto de 3% para etanol se comprar < 15L
    }
  } else if (tipoCombustivel == "D") {
    precoLitro = 2.00;
    if (litros >= 15) {
      percentualDesconto = 0.05; // Desconto de 5% para diesel se comprar >= 15L
    } else {
      percentualDesconto = 0.03; // Desconto de 3% para diesel se comprar < 15L
    }
  } else if (tipoCombustivel == "G") {
    precoLitro = 4.50;
    if (litros >= 20) {
      percentualDesconto = 0.03; // Desconto de 3% para gasolina se comprar >= 20L
    } else {
      percentualDesconto = 0.0; // Sem desconto para gasolina se comprar < 20L
    }
  } else {
    print("Tipo de combustível inválido.");
    return;
  }

  // Calculando o valor total
  double valorTotal = precoLitro * litros;
  double desconto = valorTotal * percentualDesconto;
  valorTotal -= desconto;

  // Exibindo o valor a ser pago
  print("\nTipo de combustível: $tipoCombustivel");
  print("Quantidade de litros: $litros");
  print("Valor total a ser pago: R\$ ${valorTotal.toStringAsFixed(2)}");
}
