import 'dart:io';

void main() {
  // Solicita a idade da primeira pessoa
  stdout.write("Digite a idade da primeira pessoa: ");
  int idade1 = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  // Solicita a idade da segunda pessoa
  stdout.write("Digite a idade da segunda pessoa: ");
  int idade2 = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  // Compara as idades e imprime qual pessoa é mais velha
  if (idade1 > idade2) {
    print("\nA primeira pessoa é a mais velha.");
  } else if (idade2 > idade1) {
    print("\nA segunda pessoa é a mais velha.");
  } else {
    print("\nAs duas pessoas têm a mesma idade.");
  }
}
