import 'package:flutter/material.dart';

class Video2Screen extends StatelessWidget {
  const Video2Screen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Como funcionario de la salud...",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.shield, color: Colors.white, size: 40),
              title: Text(
                "Actuar con responsabilidad, confidencialidad y respeto.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              tileColor: Colors.blue,
            ),
        
            ListTile(
              leading: Icon(Icons.sentiment_satisfied_alt, color: Colors.white, size: 40),
              title: Text(
                "Comunicar diagnósticos y procedimientos de forma clara y respetuosa.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              tileColor: Colors.blue,
            ),
        
            ListTile(
              leading: Icon(Icons.psychology, color: Colors.white, size: 40),
              title: Text(
                "Respetar tiempos de descanso y evitar sobrecarga laboral.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              tileColor: Colors.blue,
            ),
        
            ListTile(
              leading: Icon(Icons.rule, color: Colors.white, size: 40),
              title: Text(
                "Cumplir con normas y protocolos institucionales.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              tileColor: Colors.blue,
            ),
        
            SizedBox(height: 10),
            Divider(color: Colors.black, thickness: 2),
            SizedBox(height: 10),
        
            Text(
              "Como paciente...",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.handshake, color: Colors.white, size: 40),
              title: Text(
                "Mantener un trato respetuoso y colaborativo.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              tileColor: Colors.orange,
            ),
        
            ListTile(
              leading: Icon(Icons.timer, color: Colors.white, size: 40),
              title: Text(
                "Asistir a sesiones y/o terapias programadas.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              tileColor: Colors.orange,
            ),
        
            ListTile(
              leading: Icon(Icons.medication, color: Colors.white, size: 40),
              title: Text(
                "No automedicarse sin orientación profesional.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              tileColor: Colors.orange,
            ),
        
        
          ],
        ),
      ),
    );
  }
}
