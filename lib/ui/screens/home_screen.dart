import 'package:flutter/material.dart';
import 'package:therafy_app/ui/screens/patient2_screen.dart';
import 'package:therafy_app/ui/screens/profile_screen.dart';
import 'package:therafy_app/ui/screens/assistance.dart';
import 'package:therafy_app/ui/screens/videos_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 233, 181),
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo_white.png',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Text(
              'Inicio',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 76, 175, 80),
        toolbarHeight: 80, //tamaño de la barra
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bienvenido @usuario !",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Card(
                    elevation: 6,
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
                  
                      //poner una foto cambiante de perfil, que ponga la del usuario personal y una por defecto
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/perfil.png',
                            //width: 200,
                            //height: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Perfil",
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),

                  const SizedBox(width: 10),

                Expanded(
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AssistanceScreen(), //temporal
                          ),
                        );
                      },
                  
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/asistencia.jpg',
                            //width: 200,
                            //height: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Asistencia",
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          ),
                          SizedBox(height: 10),
                        ],
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
                Expanded(
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VideoScreen(), //temporal
                          ),
                        );
                      },
                  
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/capsulasvideo.png', //cambiar la imagen
                            //width: 200,
                            //height: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Contenidos Educativos",
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Patient2Screen(), //temporal
                          ),
                        );
                      },
                  
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/pacientes.jpg',
                            //width: 200,
                            //height: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Pacientes",
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
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
