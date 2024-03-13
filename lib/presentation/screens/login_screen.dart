
import 'dart:convert';

import 'package:consumo_api_libros/presentation/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../admin_screen.dart';
import '../user_register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = true;

  final String url = 'https://trabajo-presentacion-barberia.onrender.com/api/users/login';

  void apiLogin() async {
    final email = emailController.text;
    final password = passwordController.text;

    final body = jsonEncode({'correo': email, 'contrasena': password});

    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final rol = responseData['rol'];
      final message = responseData['message'];
      final nombre = responseData['nombre'];

      if (rol == "Administrador") {
        /* Navegar a la pantalla dashboard */
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AdminScreen(),
            ));
      } else {
        /* Navegar a la pantalla inicial del cliente */
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ServiceScreen(),
            ));
      }
    } else if (response.statusCode == 401) {
      final responseData = jsonDecode(response.body);
      final error = responseData['error'];
    }
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
       Text(
      'SION-BARBER-SHOP',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 4, 4, 4), // Color del texto
      ),
      textAlign: TextAlign.center,
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.asset(
          'assets/img/Barber.jpg',
          width: 250,
          height: 250,
        ),
      ),
    ),
  ],
),          
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                hintText: 'Ingrese su correo',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: _isVisible,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Ingrese su contraseña',
                prefixIcon: const Icon(Icons.lock_clock_outlined),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: _isVisible
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                apiLogin();
              },
              child: const Text('Iniciar sesión'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserRegisterScreen()));
                },
                child: Text('Registrarse'))
          ],
        ),
      ),
    ),
  );
}

}
