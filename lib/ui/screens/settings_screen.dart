import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 233, 181),
      appBar: AppBar(
        title: Text(
          'Configuración',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 76, 175, 80),
        toolbarHeight: 80, //tamaño de la barra
      ),

      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Preferencias",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.dark_mode_outlined),
            title: Text(
              "Modo Oscuro",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: Icon(Icons.arrow_forward),
          ),

          ListTile(
            leading: Icon(Icons.text_fields),
            title: Text(
              "Tamaño de Texto",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: Icon(Icons.arrow_forward),
          ),

          ListTile(
            leading: Icon(Icons.notifications),
            title: Text(
              "Notificaciones",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: Icon(Icons.arrow_forward),
          ),

          Divider(color: Colors.grey, indent: 15, endIndent: 15),

          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Cuenta",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.email),
            title: Text(
              "Cambiar Correo",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: Icon(Icons.arrow_forward),
          ),

          ListTile(
            leading: Icon(Icons.password),
            title: Text(
              "Cambiar Contraseña",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: Icon(Icons.arrow_forward),
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              "Cerrar Sesión",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: Icon(Icons.arrow_forward),
          ),

          Divider(color: Colors.grey, indent: 15, endIndent: 15),

          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Detalles",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.report),
            title: Text(
              "Reclamos",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: Icon(Icons.arrow_forward),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                "Versión 0.0.1",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
