import 'package:flutter/material.dart';
import 'package:therafy_app/ui/screens/video1_screen.dart';
import 'package:therafy_app/ui/widgets/listviewwidget.dart';

class Patient2Screen extends StatelessWidget {
  const Patient2Screen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start, //que no esté al medio xd
          children: [
            Text(
              "Pacientes",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Pacientes activos",
              style: TextStyle(color: Colors.black, fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                color: Colors.red,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Video1Screen(), //temporal
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Nombre paciente 1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                ),
              ),
            ),

            Divider(),

            SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                color: Colors.red,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Video1Screen(), //temporal
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Nombre paciente 2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                ),
              ),
            ),

            Divider(),

            SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                color: Colors.red,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Video1Screen(), //temporal cambiar despues
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Nombre paciente 3",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                ),
              ),
            ),

            SizedBox(height: 10),
            Divider(color: Colors.black, thickness: 2,),
            SizedBox(height: 10),

            Text(
              "Pacientes de alta",
              style: TextStyle(color: Colors.black, fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                color: Colors.blue,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Video1Screen(), //temporal
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Nombre paciente 4",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                ),
              ),
            ),

            Divider(),

            SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                color: Colors.blue,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Video1Screen(), //temporal cambiar despues
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Nombre paciente 5",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                ),
              ),
            ),

          ],
        ), //tunearlo para ponerle más cosas además de la lista
      ),
    );
  }
}
