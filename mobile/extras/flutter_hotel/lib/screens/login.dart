import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'signup.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController senhaC = TextEditingController();
  bool loading = false;

  Future<void> login() async {
    setState(() => loading = true);
    final url = Uri.parse('http://localhost:3000/usuario');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final List users = jsonDecode(res.body);
      final found = users.where((u) => u['email'] == emailC.text && u['senha'] == senhaC.text);
      if (found.isNotEmpty) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Usuário/senha inválidos")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro ao acessar API")));
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login S&M Hotel")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: emailC, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: senhaC, decoration: const InputDecoration(labelText: "Senha"), obscureText: true),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: login, child: loading ? const CircularProgressIndicator() : const Text("Login")),
            TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen())), child: const Text("Criar conta"))
          ],
        ),
      ),
    );
  }
}
