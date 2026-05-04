import 'package:flutter/material.dart';
import 'package:therafy_app/ui/screens/video1_screen.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Perfil"),

        //poder hacer el banner flexible
        //stack para poner sobre una capa(layout) encima de, en este caso la imagen
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/banner3.jpg', fit: BoxFit.cover),
          ],
        ),
        toolbarHeight: 80, //tamaño barra
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cápsulas de video",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 200,
              child: Card(
                elevation: 6,
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
              
                  //imagen en la card
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/casa_terapia.png',
                          width: double.infinity,
                          //height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          "Videos de Ejemplo",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 200,
              child: Card(
                elevation: 6,
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
              
                  //imagen en la card
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/recomendaciones.jpg',
                          width: double.infinity,
                          //height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          "Recomendaciones",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
