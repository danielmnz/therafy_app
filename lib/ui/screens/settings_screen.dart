import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therafy_app/models/settings_viewmodel.dart';
import 'package:therafy_app/ui/screens/qa_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsViewModel>();

    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).colorScheme.secondary, //uso del themedata
      appBar: AppBar(
        title: Text(
          'Configuración',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primary, //uso del themedata
        toolbarHeight: 80, //tamaño de la barra
      ),

      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Preferencias",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),

          SwitchListTile(
            secondary: const Icon(Icons.dark_mode_outlined),
            title: const Text("Modo oscuro", style: TextStyle(fontSize: 16)),
            value: settings.darkMode,
            onChanged: (value) {
              context.read<SettingsViewModel>().toggleDarkMode(value);
            },
          ),

          ListTile(
            leading: Icon(Icons.text_fields),
            title: Text("Tamaño de Texto", style: TextStyle(fontSize: 16)),
            trailing: DropdownButton(
              value: settings.textScale,
              //isExpanded: true,
              items: [
                DropdownMenuItem(value: 0.8, child: Text("Pequeño")),

                DropdownMenuItem(value: 1.0, child: Text("Mediano")),

                DropdownMenuItem(value: 1.5, child: Text("Grande")),

                DropdownMenuItem(value: 2.0, child: Text("Muy Grande")),
              ],
              onChanged: (value) {
                if (value != null) {
                  settings.setTextScale(value);
                }
              },
            ),
          ),

          SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text("Notificaciones"),
            value: settings.notifications,
            onChanged: (value) {
              context.read<SettingsViewModel>().toggleNotifications(value);
            },
          ),

          Divider(color: Colors.grey, indent: 15, endIndent: 15),

          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Cuenta",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),

          ListTile(
            leading: Icon(Icons.email),
            title: Text("Cambiar Correo", style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.arrow_forward),
          ),

          ListTile(
            leading: Icon(Icons.password),
            title: Text("Cambiar Contraseña", style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.arrow_forward),
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Cerrar Sesión", style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.arrow_forward),
          ),

          Divider(color: Colors.grey, indent: 15, endIndent: 15),

          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Detalles",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),

          ListTile(
            leading: Icon(Icons.report),
            title: Text("Reclamos", style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.arrow_forward),
          ),

          ListTile(
            leading: const Icon(Icons.star),
            title: const Text(
              "Encuesta de Calidad",
              style: TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QaScreen()),
              );
            },
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
