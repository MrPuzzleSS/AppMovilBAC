import 'package:consumo_api_libros/presentation/home_proyecto.dart';
import 'package:consumo_api_libros/presentation/user_register_screen.dart';
import 'package:consumo_api_libros/presentation/widgets/menu_appbar.dart';
import 'package:consumo_api_libros/presentation/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

import 'admin_user_screen.dart';
import 'presentation/admin_service_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreens(),
  
  AdminUserScreen(), // Pantalla de usuarios
  AdminServiceScreen(), // Pantalla de servicios (agregada)
];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: MenuAppBar(),
    drawer: MenuDrawer(),
    body: Center(
      child: _widgetOptions.elementAt(_selectedIndex),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle),
          label: 'Usuarios',
          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Servicios',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      onTap: _onItemTapped,
    ),
    
  );
}

}


