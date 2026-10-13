import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/destination.dart';
import '../providers/cart_provider.dart';
import '../screens/checkout.dart';

class DestinoWidget extends StatefulWidget {
  final String nome;
  final String imagem;
  final int valord;
  final int valorp;

  const DestinoWidget({
    Key? key,
    required this.nome,
    required this.imagem,
    required this.valord,
    required this.valorp,
  }) : super(key: key);

  @override
  State<DestinoWidget> createState() => _DestinoWidgetState();
}

class _DestinoWidgetState extends State<DestinoWidget> {
  int nDiarias = 0;
  int nPessoas = 0;

  void dias() {
    setState(() => nDiarias++);
  }

  void n_pessoas() {
    setState(() => nPessoas++);
  }

  void limpar() {
    setState(() {
      nDiarias = 0;
      nPessoas = 0;
    });
    Provider.of<CartProvider>(context, listen: false).clear();
  }

  void calctotal() {
    // Usa Provider para criar carrinho / calcular total
    Provider.of<CartProvider>(context, listen: false).setValues(
      diarias: nDiarias,
      pessoas: nPessoas,
      valorDiaria: widget.valord,
      valorPessoa: widget.valorp,
    );
    // abre checkout
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CheckoutScreen(destino: widget.nome),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      height: 250,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(12)),
                    child: Image.asset(
                      widget.imagem,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.nome, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text("Valor diária: R\$ ${widget.valord}", style: const TextStyle(fontSize: 14)),
                        Text("Valor por pessoa: R\$ ${widget.valorp}", style: const TextStyle(fontSize: 14)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Column(
                              children: [
                                const Text("Diárias"),
                                Text("$nDiarias"),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: dias,
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            Column(
                              children: [
                                const Text("Acompanhantes"),
                                Text("$nPessoas"),
                                IconButton(
                                  icon: const Icon(Icons.person_add),
                                  onPressed: n_pessoas,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: calctotal,
                  icon: const Icon(Icons.calculate),
                  label: const Text("Calcular"),
                ),
                ElevatedButton.icon(
                  onPressed: limpar,
                  icon: const Icon(Icons.clear),
                  label: const Text("Limpar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
