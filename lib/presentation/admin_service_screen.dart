import 'dart:convert';

import 'package:consumo_api_libros/presentation/service_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminServiceScreen extends StatefulWidget {
  const AdminServiceScreen({super.key});

  @override
  State<AdminServiceScreen> createState() => _AdminServiceScreenState();
}

class _AdminServiceScreenState extends State<AdminServiceScreen> {
  List<dynamic> services = [];
  List<dynamic> _filtroServices = [];
  String editedEstado = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUsers();
    _filtroServices = List.from(services);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> editService(Map<String, dynamic> serviceData) async {
    Map<String, dynamic> editedData = {...serviceData};
    editedEstado = serviceData['estado'];

    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Servicio'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'serviceName'),
                  onChanged: (value) {
                    editedData['serviceName'] = value;
                  },
                  controller:
                      TextEditingController(text: serviceData['description']),
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'description'),
                  onChanged: (value) {
                    editedData['description'] = value;
                  },
                  controller:
                      TextEditingController(text: serviceData['description']),
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'price'),
                  onChanged: (value) {
                    editedData['price'] = int.parse(value);
                  },
                  controller: TextEditingController(
                      text: serviceData['price'].toString()),
                ),
                DropdownButton<String>(
                  value: editedEstado.isNotEmpty
                      ? editedEstado
                      : serviceData['estado'],
                  items: <String>['Activo', 'Inactivo']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      editedEstado = newValue!;
                    });
                  },
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                final response = await http.put(
                  Uri.parse(
                      'https://trabajo-presentacion-barberia.onrender.com/${serviceData['_id']}'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, dynamic>{
                    'serviceName': editedData['serviceName'],
                    'description': editedData['description'],
                    'price': editedData['price'],
                    'estado': editedEstado,
                  }),
                );

                if (response.statusCode == 200) {
                  fetchUsers();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                } else {
                  // Manejar errores de actualización
                  throw Exception('Error al actualizar el servicio');
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse(
        'https://trabajo-presentacion-barberia.onrender.com/api/services'));
    if (response.statusCode == 200) {
      final List<dynamic> fetchedServices = json.decode(response.body);
      setState(() {
        services = fetchedServices;
        _filtroServices = List.from(services);
      });
    } else {
      throw Exception('Error al cargar la lista de servicios');
    }
  }

  Future<void> deleteUser(String servicesId) async {
    final response = await http.delete(
      Uri.parse(
          'https://trabajo-presentacion-barberia.onrender.com/api/services/$servicesId'),
    );
    if (response.statusCode == 204) {
      fetchUsers();
    } else {
      throw Exception('Error al eliminar el servicio');
    }
  }

  void _onSearchTextChanged(String searchText) {
    setState(() {
      _filtroServices = services.where((service) {
        final serviceName = service['serviceName'].toLowerCase();
        return serviceName.contains(searchText.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSearchField(),
        Expanded(
          child: ListView.builder(
            itemCount: _filtroServices.length,
            itemBuilder: (context, index) {
              final service = _filtroServices[index];
              return _buildServiceListItem(service);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (text) {
          _onSearchTextChanged(text); // Llamar a la función de búsqueda
        },
        decoration: const InputDecoration(
          hintText: 'Buscar',
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildServiceListItem(Map<String, dynamic> service) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            service['serviceName'],
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${service['description']}',
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            'Precio: ${service['price']}',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
