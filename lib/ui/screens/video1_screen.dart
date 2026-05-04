import 'package:flutter/material.dart';

class Video1Screen extends StatelessWidget {
  const Video1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuración"),
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        children: [
          ListTile(leading: Icon(Icons.person), title: Text("Lista1")),
          ListTile(leading: Icon(Icons.person), title: Text("Lista2")), //agregar switch quizá
        ],
      ),
    );
  }
}
