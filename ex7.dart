import 'dart:io';

void main() {
  // Solicita o valor médio dos três modelos de carro
  stdout.write("Digite o valor médio do primeiro modelo de carro: ");
  double valor1 = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  stdout.write("Digite o valor médio do segundo modelo de carro: ");
  double valor2 = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  stdout.write("Digite o valor médio do terceiro modelo de carro: ");
  double valor3 = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  // Identifica o carro mais caro e o mais barato
  double maisCaro = valor1;
  double maisBarato = valor1;

  if (valor2 > maisCaro) maisCaro = valor2;
  if (valor3 > maisCaro) maisCaro = valor3;

  if (valor2 < maisBarato) maisBarato = valor2;
  if (valor3 < maisBarato) maisBarato = valor3;

  // Exibe os resultados
  print("\nO modelo mais caro custa: R\$ ${maisCaro.toStringAsFixed(2)}");
  print("O modelo mais barato custa: R\$ ${maisBarato.toStringAsFixed(2)}");
}
