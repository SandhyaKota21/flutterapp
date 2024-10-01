import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/product_screen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final url = Uri.parse("https://dummyjson.com/auth/login");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "username": _usernameController.text,
          "password": _passwordController.text,
          "expiresInMins": 30
        }),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductScreen();
        }));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) ==>  ProductScreen()));
      } else {
        print("Invaid username and password");
      }
    } catch (e) {
      print("Failed to connect$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: _login, child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
