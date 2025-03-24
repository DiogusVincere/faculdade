import 'dart:io';

double calcularSalarioLiquido(double salarioBruto) {
  double descontoImpostos = salarioBruto * 0.10;  // 10% de imposto
  double bonificacao = salarioBruto * 0.20;      // 20% de bonificação

  double salarioLiquido = salarioBruto - descontoImpostos + bonificacao;
  return salarioLiquido;
}

void main() {
  // Solicita o salário bruto do usuário
  stdout.write("Digite seu salário bruto: ");
  double salarioBruto = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  // Calcula o salário líquido
  double salarioLiquido = calcularSalarioLiquido(salarioBruto);

  // Exibe o resultado
  print("\nO seu salário líquido é: R\$ ${salarioLiquido.toStringAsFixed(2)}");
}
