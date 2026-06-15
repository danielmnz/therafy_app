import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therafy_app/models/qa_viewmodel.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart'; //para compartir por correo

class QaScreen extends StatelessWidget {
  const QaScreen({super.key});

  //metodo enviarcorreo
  Future<void> enviarCorreo(String mensaje) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'ntd.danii@gmail.com',
      queryParameters: {'subject': 'Resultados Encuesta QA App Therafy', 'body': mensaje},
    );

    await launchUrl(emailUri);
  }

  @override
  Widget build(BuildContext context) {
    final qaViewModel = context.watch<QaViewModel>();

    return Scaffold(
      appBar: AppBar(
        //title: Text("Asistencia"),
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/banner3.jpg', fit: BoxFit.cover),
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
              "Encuesta QA",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount:
                    qaViewModel.questions.length + 1, //+1 para el boton enviar
                itemBuilder: (context, index) {
                  if (index == qaViewModel.questions.length) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          /*
                          ElevatedButton(
                            onPressed: () {
                              //if 0 faltan responder

                              //debug
                              print("RESPUESTAS ENCUESTA");

                              for (var question in qaViewModel.questions) {
                                print("${question.titulo}"); //pregunta
                                print(
                                  "Respuesta: ${question.valor}",
                                ); //respuesta
                                print("====="); //para que no esté tan junto
                              }

                              //PARA COMPARTIR LA INFO
                              String mensaje = "Encuesta QA Therafy\n\n";

                              for (var question in qaViewModel.questions) {
                                mensaje += "${question.titulo}\n";
                                mensaje +=
                                    "Respuesta: ${question.valor} estrellas\n\n";
                              }

                              SharePlus.instance.share(
                                ShareParams(text: mensaje),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(
                                    child: Text(
                                      "Se enviaron las respuestas correctamente",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },

                            child: const Text("Enviar Respuestas"),
                          ),*/

                          const SizedBox(height: 10),
                          
                          //compartir opr correo
                          ElevatedButton(
                            onPressed: () {
                              String mensaje = "Encuesta QA Therafy\n\n";

                              for (var question in qaViewModel.questions) {
                                mensaje += "${question.titulo}\n";
                                mensaje +=
                                    "Respuesta: ${question.valor} estrellas\n\n";
                              }

                              enviarCorreo(mensaje); //llamamos el método
                            },
                            child: const Text(
                              "ENVIAR POR CORREO",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  final question = qaViewModel.questions[index];

                  //función itembuilder
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.titulo,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          //slider para rating
                          Slider(
                            value: question.valor.toDouble(),
                            min: 0,
                            max: 5,
                            divisions: 5,
                            label: question.valor.toString(),
                            onChanged: (value) {
                              qaViewModel.updateAnswer(index, value.toInt());
                            },
                          ),

                          Center(
                            child: Text(
                              "Respuesta: ${question.valor} estrellas",
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            question.min,
                            style: const TextStyle(fontSize: 12),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            question.max,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
