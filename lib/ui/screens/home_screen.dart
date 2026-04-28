import 'package:flutter/material.dart';
import 'package:therafy_app/ui/screens/profile_screen.dart';
import 'package:therafy_app/ui/screens/assistance.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inicio',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        toolbarHeight: 80, //tamaño de la barra
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hola @usuario !",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 30),
            /*
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    child: SizedBox(
                      width: 420,
                      height: 150,
                      child: const Center(
                        child: Text("Lista de actividades")
                      ),
                    ),
                  ),
                ),
              ],
            ),*/

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },

                    child: const SizedBox(
                      width: 200,
                      height: 150,
                      child: Center(
                        child: Text("Perfil")
                      ),
                    ),
                  ),
                ),

                  const SizedBox(width: 10),

                Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AssistanceScreen(),
                        ),
                      );
                    },

                    child: const SizedBox(
                      width: 200,
                      height: 150,
                      child: Center(
                        child: Text("Asistencia")
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(), //temporal
                        ),
                      );
                    },

                    child: const SizedBox(
                      width: 200,
                      height: 150,
                      child: Center(
                        child: Text("Cápsulas de video")
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(), //temporal
                        ),
                      );
                    },

                    //buscar como poner la imagen encima con el texto
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/pacientes.jpg',
                          width: 200,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8),
                        Text("Pacientes"),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}
