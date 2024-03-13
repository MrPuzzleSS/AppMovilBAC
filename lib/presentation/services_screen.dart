import 'package:consumo_api_libros/presentation/widgets/menu_appbar.dart';
import 'package:consumo_api_libros/presentation/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: MenuDrawer(),
    appBar: MenuAppBar(),
    );
    
  }
}
