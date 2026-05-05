import 'package:flutter/material.dart';

class DetailPatientScreen extends StatelessWidget {
  const DetailPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/banner3.jpg',
              fit: BoxFit.cover,
            ),
          ],
        ),
        toolbarHeight: 80, //tamaño barra
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detalles Paciente",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
        
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Nombre completo: Nombre Paciente"
              ),
            ),

            ListTile(
              leading: Icon(Icons.cake),
              title: Text(
                "Edad: 16",
              ),
            ),

            ListTile(
              leading: Icon(Icons.numbers),
              title: Text(
                "Rut: 21.123.456-k",
              ),
            ),

            ListTile(
              leading: Icon(Icons.local_activity),
              title: Text(
                "Estado: Activo",
              ),
            ),

            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text(
                "Última sesión: 05 Abril 2026",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
