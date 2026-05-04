import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Perfil"),
        
        //poder hacer el banner flexible
        //stack para poner sobre una capa(layout) encima de, en este caso la imagen
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
      body: Column(
        children: [
          SizedBox(height: 20),

          //foto perfil
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/chicharito_profile.jpeg'),
          ),
          SizedBox(height: 2),
          Text(
            "Javier Hernández",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 2),
          Text(
            "chicharito@gmail.com",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),

          SizedBox(height: 20),

          // Opciones tipo perfil
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              "Editar perfil",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            trailing: Icon(Icons.arrow_forward),
            tileColor: const Color.fromARGB(255, 165, 214, 255),
            onTap: () {},
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "Configuración",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            trailing: Icon(Icons.arrow_forward),
            tileColor: const Color.fromARGB(255, 165, 214, 255),
            onTap: () {},
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              "Cerrar sesión",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            trailing: Icon(Icons.arrow_forward),
            tileColor: const Color.fromARGB(255, 165, 214, 255),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}