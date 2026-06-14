import 'package:flutter/material.dart';
import 'package:therafy_app/models/patient_model.dart';
import 'package:therafy_app/ui/screens/detail_patient_screen.dart';
import 'dart:convert';
import 'package:therafy_app/core/services/storage_service.dart';

class Patient2Screen extends StatefulWidget {
  const Patient2Screen({super.key});

  @override
  State<Patient2Screen> createState() => _Patient2ScreenState();
}

class _Patient2ScreenState extends State<Patient2Screen> {
  //lista de pacientes
  final List<PatientModel> patients = [];

  //guardar pacientes
  Future<void> savePatients() async {
    final List<Map<String, dynamic>> jsonList = patients
        .map((patient) => patient.toJson())
        .toList();

    await StorageService.saveString('patients', jsonEncode(jsonList));
  }

  //cargar pacientes
  Future<void> loadPatients() async {
    final jsonString = StorageService.getString('patients');

    if (jsonString == null) return;

    final List<dynamic> jsonList = jsonDecode(jsonString);

    patients.clear();

    patients.addAll(jsonList.map((e) => PatientModel.fromJson(e)).toList());

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadPatients();
  }

  //controladores
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController rutController = TextEditingController();

  //estado del paciente
  String selectedStatus = "Activo";

  void agregarPaciente() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Nuevo Paciente",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Nombre Completo",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: "Edad",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: rutController,
                decoration: const InputDecoration(
                  labelText: "RUT",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                value: selectedStatus,
                decoration: const InputDecoration(
                  labelText: "Estado",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: "Activo", child: Text("Activo")),
                  DropdownMenuItem(value: "Alta", child: Text("Alta")),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedStatus = value!;
                  });
                },
              ),

              ElevatedButton(
                onPressed: () {
                  if (nameController.text.isEmpty) return;

                  setState(() {
                    patients.add(
                      PatientModel(
                        name: nameController.text,
                        age: int.parse(
                          ageController.text,
                        ), //nuestro age es un int, y acá transforammos el controller (string) en int
                        rut: rutController.text,
                        status: selectedStatus,
                        lastSession: "Sin sesiones",
                      ),
                    );
                  });

                  //guardar paciente
                  savePatients();

                  nameController.clear();
                  ageController.clear();
                  rutController.clear();

                  //estado
                  selectedStatus = "Activo";

                  Navigator.pop(context);
                },
                child: const Text("Guardar"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    rutController.dispose();
    super.dispose();
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

      floatingActionButton: SizedBox(
        width: 215,
        height: 75,
        child: FloatingActionButton.extended(
          onPressed: agregarPaciente,
          icon: const Icon(Icons.add_reaction, size: 30),
          label: Text(
            "Agregar Paciente",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 8,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pacientes",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            const Text(
              "Pacientes registrados",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: patients.isEmpty
                  ? const Center(
                      child: Text(
                        "No hay pacientes registrados",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: patients.length,
                      itemBuilder: (context, index) {
                        final patient = patients[index];

                        return Card(
                          color: patient.status == "Activo"
                              ? Colors.red
                              : Colors.blue,
                          child: ListTile(
                            title: Text(
                              patient.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            subtitle: Text(
                              "Edad: ${patient.age}",
                              style: const TextStyle(color: Colors.white70),
                            ),

                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),

                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      DetailPatientScreen(patient: patient),
                                ),
                              );

                              await loadPatients();

                              setState(() {});
                            },
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
