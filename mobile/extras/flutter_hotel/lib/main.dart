import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login.dart';

void main() {
  runApp(const SmApp());
}

class SmApp extends StatelessWidget {
  const SmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        title: 'S&M Hotel',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
