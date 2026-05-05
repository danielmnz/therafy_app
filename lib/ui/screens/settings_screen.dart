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
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),

          ListTile(
            leading: Icon(Icons.dark_mode_outlined),
            title: Text("Modo Oscuro"),
            trailing: Icon(Icons.arrow_forward, size: 16),
          ),

          ListTile(
            leading: Icon(Icons.text_fields),
            title: Text("Tamaño de Texto"),
            trailing: Icon(Icons.arrow_forward, size: 16),
          ),

          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notificaciones"),
            trailing: Icon(Icons.arrow_forward, size: 16),
          ),

          Divider(color: Colors.grey, indent: 15, endIndent: 15),

          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Cuenta",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),

          ListTile(
            leading: Icon(Icons.email),
            title: Text("Cambiar Correo"),
            trailing: Icon(Icons.arrow_forward, size: 16),
          ),

          ListTile(
            leading: Icon(Icons.password),
            title: Text("Cambiar Contraseña"),
            trailing: Icon(Icons.arrow_forward, size: 16),
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Cerrar Sesión"),
            trailing: Icon(Icons.arrow_forward, size: 16),
          ),

          Divider(color: Colors.grey, indent: 15, endIndent: 15),

          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Detalles",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),

          ListTile(
            leading: Icon(Icons.warning),
            title: Text("Reclamos"),
            trailing: Icon(Icons.arrow_forward, size: 16),
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
