import 'package:flutter/material.dart';
import 'package:therafy_app/models/patient_model.dart';
import 'dart:convert';
import 'package:therafy_app/core/services/storage_service.dart';

class DetailPatientScreen extends StatefulWidget {
  final PatientModel patient;

  const DetailPatientScreen({super.key, required this.patient});

  @override
  State<DetailPatientScreen> createState() => _DetailPatientScreenState();
}

class _DetailPatientScreenState extends State<DetailPatientScreen> {
  
  //
  Future<void> savePatientStatus() async {
    final jsonString = StorageService.getString('patients');

    if (jsonString == null) return;

    final List<dynamic> jsonList = jsonDecode(jsonString);

    for (var patientJson in jsonList) {
      if (patientJson['rut'] == widget.patient.rut) {
        patientJson['status'] = widget.patient.status;
        patientJson['lastSession'] = widget.patient.lastSession;
      }
    }

    await StorageService.saveString('patients', jsonEncode(jsonList));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/banner3.jpg', fit: BoxFit.cover),
          ],
        ),
        toolbarHeight: 80,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Detalles Paciente",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: Text("Nombre completo: ${widget.patient.name}"),
            ),

            ListTile(
              leading: const Icon(Icons.cake),
              title: Text("Edad: ${widget.patient.age}"),
            ),

            ListTile(
              leading: const Icon(Icons.numbers),
              title: Text("Rut: ${widget.patient.rut}"),
            ),

            ListTile(
              leading: const Icon(Icons.local_activity),
              title: Text(
                "Estado",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            //boton activo/alta
            SegmentedButton<String>(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                  (states) {
                    if (states.contains(WidgetState.selected)) {
                      if (widget.patient.status == "Activo") {
                        return Colors.red;
                      }
                      else {
                        return Colors.blue;
                      }
                    }
                    return null;
                  }
                ),
                foregroundColor: WidgetStateProperty.all(Colors.black),
              ),

              segments: const [
                ButtonSegment(
                  value: "Activo",
                  label: Text("Activo"),
                  icon: Icon(Icons.check_circle),
                ),
                ButtonSegment(
                  value: "Alta",
                  label: Text("Alta"),
                  icon: Icon(Icons.flag),
                ),
              ],

              selected: {widget.patient.status},

              onSelectionChanged: (selection) async {
                setState(() {
                  widget.patient.status = selection.first;
                });

                await savePatientStatus();
              },
            ),

            ListTile(
              leading: const Icon(Icons.bookmark),
              title: Text("Última sesión: ${widget.patient.lastSession}"),
            ),
          ],
        ),
      ),
    );
  }
}
