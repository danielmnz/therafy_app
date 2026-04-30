import 'package:flutter/material.dart';
import 'package:therafy_app/ui/screens/profile_screen.dart';
import 'package:therafy_app/ui/screens/assistance.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo2.png',
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
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80, //tamaño de la barra
      ),

      backgroundColor: const Color.fromARGB(255, 179, 233, 181),

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
                            builder: (context) => const ProfileScreen(), //temporal
                          ),
                        );
                      },
                  
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/capsulasvideo.png',
                            //width: 200,
                            //height: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Cápsulas de video",
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
                            builder: (context) => const ProfileScreen(), //temporal
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
