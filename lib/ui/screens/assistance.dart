import 'package:flutter/material.dart';

class AssistanceScreen extends StatelessWidget {
   const AssistanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Asistencia"),
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
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Asistencia",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),
            Text(
              "Marcar hora de llegada",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),

            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:  EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Center(
                    child: Text(
                      "Se guardó la asistencia con éxito",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),
                  )),
                );
              },
              child: Center(
                child: Text(
                  "Marcar Asistencia",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Center(
              child: Text(
                "Martes 05 Mayo 2026 - 8:25 hrs",
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 10),
            Divider(color: Colors.black, thickness: 2),
            SizedBox(height: 10),

            Text(
              "Historial de Asistencias",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              height: 100,
              child: Card(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Lunes | 04 Mayo | 2026 | 8:19 hrs",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),

                      Text(
                        "Martes | 05 Mayo | 2026 | 8:25 hrs",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );;
  }
}