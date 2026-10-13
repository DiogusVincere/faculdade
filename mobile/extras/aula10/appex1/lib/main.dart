import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DashboardScreen(),
  ));
}

class DashboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 5,
        centerTitle: true,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Monitor de Sensores',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(child: Cards()),
    );
  }
}

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Sombras para dar o efeito de "card"
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Bordas arredondadas
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        width: 350, // Largura do card
        height: 120, // Altura do card
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.thermostat_outlined, size: 30, color: Colors.white),
            SizedBox(height: 6),
            Text('Temperatura do solo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
            SizedBox(height: 6),
            Text('0.0°C', style: TextStyle(fontSize: 20, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
