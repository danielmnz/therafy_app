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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
              "chicharito14@gmail.com",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
        
            SizedBox(height: 20),
        
            // Opciones tipo perfil
            ListTile(
              leading: Icon(Icons.photo, color: Colors.white),
              title: Text(
                "Cambiar foto de perfil",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              tileColor: Colors.blue,
              onTap: () {},
            ),
        
            Divider(),
        
            ListTile(
              leading: Icon(Icons.badge, color: Colors.white),
              title: Text(
                "Cambiar nombre",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              tileColor: Colors.blue,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}