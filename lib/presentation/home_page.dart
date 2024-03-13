import 'package:flutter/material.dart';
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
            const Text('\nBIENcccccVENIDOS A LA \n BARBERIA\n', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Image.asset('assets/img/barberia.jpg', width: 250,),
            const Text ('\n\nEstá barberíaa quiere cumplir con exigencias para que te veas bien y te llegues a sentir satisfecho y cómodo.', style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
        
          ],)),
    );
  }
}
/*
class ImageCarousel extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/foto.jpeg',
    'assets/images/logoo.jpg',
    // Agrega la ruta de tus dos imágenes aquí
  ]; 

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
      ),
      items: imageList.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
*/
