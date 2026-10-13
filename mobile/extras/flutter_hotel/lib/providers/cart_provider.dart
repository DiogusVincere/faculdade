import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  int total = 0;
  int nDiarias = 0;
  int nPessoas = 0;

  void clear() {
    total = 0;
    nDiarias = 0;
    nPessoas = 0;
    notifyListeners();
  }

  void setValues({required int diarias, required int pessoas, required int valorDiaria, required int valorPessoa}) {
    nDiarias = diarias;
    nPessoas = pessoas;
    total = (nDiarias * valorDiaria) + (nPessoas * valorPessoa);
    notifyListeners();
  }

  // calcular com possível desconto pix: usamos int (total * 90) ~/ 100 para 10% desconto
  int totalWithPayment(String metodo) {
    if (metodo.toLowerCase() == 'pix') {
      return (total * 90) ~/ 100;
    }
    return total;
  }
}
