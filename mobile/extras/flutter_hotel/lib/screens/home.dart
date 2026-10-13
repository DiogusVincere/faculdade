import 'package:flutter/material.dart';
import '../widgets/destino_widget.dart';
import '../models/destination.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final List<Destination> destinos = [
    Destination(name: "Angra dos Reis", imagePath: "assets/images/angra.jpg", valorDiaria: 384, valorPessoa: 70),
    Destination(name: "Jericoacoara", imagePath: "assets/images/jericoacoara.jpg", valorDiaria: 571, valorPessoa: 75),
    Destination(name: "Arraial do Cabo", imagePath: "assets/images/arraial.jpg", valorDiaria: 534, valorPessoa: 65),
    Destination(name: "Florianópolis", imagePath: "assets/images/florianopolis.jpg", valorDiaria: 348, valorPessoa: 85),
    Destination(name: "Madri", imagePath: "assets/images/madri.jpg", valorDiaria: 401, valorPessoa: 85),
    Destination(name: "Paris", imagePath: "assets/images/paris.jpg", valorDiaria: 546, valorPessoa: 95),
    Destination(name: "Orlando", imagePath: "assets/images/orlando.jpg", valorDiaria: 616, valorPessoa: 105),
    Destination(name: "Las Vegas", imagePath: "assets/images/lasvegas.jpg", valorDiaria: 504, valorPessoa: 110),
    Destination(name: "Roma", imagePath: "assets/images/roma.jpg", valorDiaria: 478, valorPessoa: 85),
    Destination(name: "Chile", imagePath: "assets/images/chile.jpg", valorDiaria: 446, valorPessoa: 95),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S&M Hotel"),
      ),
      body: ListView.builder(
        itemCount: destinos.length,
        itemBuilder: (ctx, i) {
          final d = destinos[i];
          return DestinoWidget(
            nome: d.name,
            imagem: d.imagePath,
            valord: d.valorDiaria,
            valorp: d.valorPessoa,
          );
        },
      ),
    );
  }
}
