import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  TextEditingController _nameController = TextEditingController();

  // Função para incrementar o contador
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Função para limpar o campo de texto e resetar o contador
  void _clearName() {
    setState(() {
      _nameController.clear();
      _counter = 0; // Reseta o contador
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],  // Fundo claro e moderno
      appBar: AppBar(
        title: Text("ContTech"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Contador
            Text(
              'Contador: $_counter',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
            SizedBox(height: 40),

            // Campo para inserir o nome
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Digite seu nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.person, color: Colors.teal),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            // Exibindo o nome digitado
            Text(
              _nameController.text.isNotEmpty ? 'Olá, ${_nameController.text}!' : 'Digite seu nome acima',
              style: TextStyle(
                fontSize: 24,
                color: Colors.teal[600],
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 40),

            // Botões de ações
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Cor do botão
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Incrementar Contador',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: _clearName,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Cor do botão
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Limpar Nome',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
