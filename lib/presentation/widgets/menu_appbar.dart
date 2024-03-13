import 'package:flutter/material.dart';


class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MenuAppBar({super.key});

@override
Widget build(BuildContext context) {
  return AppBar(
    title: Text(
      'SION-BARBER-SHOP',
      style: TextStyle(
        fontFamily: 'Pacifico', // Fuente personalizada
        fontSize: 24.0, // Tamaño de fuente
        color: Colors.white, // Color de fuente
        letterSpacing: 2.0, // Espaciado entre letras
      ),
    ),
    backgroundColor: Color.fromARGB(255, 3, 59, 191), // Color de fondo
  
    
  );
}
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(0, kToolbarHeight);
}
