import 'dart:io';

double calcularAreaTriangulo(double base, double altura) {
  return (base * altura) / 2;
}

void main() {
  // Solicita a base do triângulo
  stdout.write("Digite a base do triângulo: ");
  double base = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  // Solicita a altura do triângulo
  stdout.write("Digite a altura do triângulo: ");
  double altura = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  // Calcula a área do triângulo
  double area = calcularAreaTriangulo(base, altura);

  // Exibe o resultado
  print("\nA área do triângulo é: $area");
}
