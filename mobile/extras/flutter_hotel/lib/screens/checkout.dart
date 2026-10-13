import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CheckoutScreen extends StatefulWidget {
  final String destino;
  const CheckoutScreen({Key? key, required this.destino}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String pagamento = 'cartao'; // cartao/pix/dinheiro

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    int total = cart.total;
    int totalFinal = cart.totalWithPayment(pagamento);

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout - S&M Hotel")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(widget.destino, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Diárias: ${cart.nDiarias}"),
                Text("Acompanhantes: ${cart.nPessoas}"),
              ],
            ),
            const SizedBox(height: 12),
            Text("Total (sem desconto): R\$ $total"),
            const SizedBox(height: 10),
            const Text("Escolha forma de pagamento:"),
            ListTile(
              title: const Text("Cartão"),
              leading: Radio<String>(
                value: 'cartao',
                groupValue: pagamento,
                onChanged: (v) => setState(() => pagamento = v ?? 'cartao'),
              ),
            ),
            ListTile(
              title: const Text("PIX (10% desconto)"),
              leading: Radio<String>(
                value: 'pix',
                groupValue: pagamento,
                onChanged: (v) => setState(() => pagamento = v ?? 'pix'),
              ),
            ),
            ListTile(
              title: const Text("Dinheiro"),
              leading: Radio<String>(
                value: 'dinheiro',
                groupValue: pagamento,
                onChanged: (v) => setState(() => pagamento = v ?? 'dinheiro'),
              ),
            ),
            const SizedBox(height: 10),
            Text("Total final: R\$ $totalFinal", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // ação de confirmar (aqui você poderia salvar pedido, etc)
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Reserva Confirmada"),
                    content: Text("Destino: ${widget.destino}\nTotal pago: R\$ $totalFinal"),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
                    ],
                  ),
                );
              },
              child: const Text("Confirmar Reserva"),
            ),
          ],
        ),
      ),
    );
  }
}
