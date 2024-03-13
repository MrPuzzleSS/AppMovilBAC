
import 'package:consumo_api_libros/admin_screen.dart';
import 'package:consumo_api_libros/admin_user_screen.dart';
import 'package:consumo_api_libros/presentation/screens/login_screen.dart';
import 'package:consumo_api_libros/presentation/service_register_screen.dart';
import 'package:consumo_api_libros/presentation/user_register_screen.dart';
import 'package:flutter/material.dart';



class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

@override
Widget build(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          leading: Icon(Icons.home, color: Colors.black), // Icono de Inicio
          title: Text('Inicio', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminScreen()));
          },
        ),
        ListTile(
          leading: Icon(Icons.add_circle, color: Colors.black), // Icono para Registrar Servicio
          title: Text('Registrar Servicio', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceRegisterScreen()));
          },
        ),
          ListTile(
          leading: Icon(Icons.person_2, color: Colors.black), // Icono para Registrar Servicio
          title: Text('Registrar Usuario', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegisterScreen()));
          },
        ),
        Divider(), // Línea divisoria entre los elementos existentes y "Cerrar Sesión"
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.black), // Icono para Cerrar Sesión
          title: Text('Cerrar Sesión', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          onTap: () {
            // Navegar a la página de inicio de sesión
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      ],
    ),
  );
}
}
