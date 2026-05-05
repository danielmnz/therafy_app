import 'package:flutter/material.dart';

class Video1Screen extends StatelessWidget {
  const Video1Screen({super.key});

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
                "Videos de ejemplo",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              Text(
                "Calentamiento antes del ejercicio",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Card(
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 8),

              Text(
                "Ejercicios de motricidad fina",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Card(
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 8),

              Text(
                "Ejercicios de equilibrio",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Card(
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 8),

              Text(
                "Estimulación del lenguaje",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Card(
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
