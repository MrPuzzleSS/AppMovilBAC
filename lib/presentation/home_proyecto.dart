import 'package:consumo_api_libros/admin_user_screen.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('\nBIENVENIDOSAAASSS A LA \n BARBERIA\n', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Image.asset('assets/img/barberia.jpg', width: 250,),
            const Text ('\n\nEstá barbería quiere cumplir con exigencias para que te veas bien y te llegues a sentir satisfecho y cómodo.', style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
        
          ],)),
    );
  }
}