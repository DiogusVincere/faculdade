import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nomeC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController senhaC = TextEditingController();
  bool loading = false;

  Future<void> register() async {
    setState(() => loading = true);
    final url = Uri.parse('http://localhost:3000/cadastro-usuario');
    final body = jsonEncode({
      "nome": nomeC.text,
      "email": emailC.text,
      "senha": senhaC.text,
    });
    final res = await http.post(url, headers: {"Content-Type": "application/json"}, body: body);
    if (res.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cadastro realizado")));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro no cadastro")));
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nomeC, decoration: const InputDecoration(labelText: "Nome")),
            TextField(controller: emailC, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: senhaC, decoration: const InputDecoration(labelText: "Senha"), obscureText: true),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: register, child: loading ? const CircularProgressIndicator() : const Text("Cadastrar")),
          ],
        ),
      ),
    );
  }
}
