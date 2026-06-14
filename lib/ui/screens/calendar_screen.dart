import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:therafy_app/core/services/storage_service.dart';
import 'package:therafy_app/models/event_model.dart';
import 'package:intl/intl.dart'; //para formato del dia
import 'dart:convert'; //para guardar info (json)
import 'package:therafy_app/models/patient_model.dart'; //para pasar ultima sesion

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  EventModel? editingEvent; //guardar eventos

  String? selectedPatient; //pacientes

  //final TextEditingController patientController = TextEditingController();
  final TextEditingController hourController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final Map<DateTime, List<EventModel>> events = <DateTime, List<EventModel>>{};

  //lista de pacientes
  List<String> patientNames = [];

  //cargar pacientes
  Future<void> loadPatients() async {
    final jsonString = StorageService.getString('patients');

    if (jsonString == null) return;

    final List<dynamic> jsonList = jsonDecode(jsonString);

    patientNames = jsonList.map((e) => e['name'].toString()).toList();

    setState(() {});
  }

  List<EventModel> getEventsForDay(DateTime day) {
    return events.entries
        .firstWhere(
          (entry) => isSameDay(entry.key, day),
          orElse: () => MapEntry(day, []),
        )
        .value; //se ve asi por el shift+alt+f
  }

  //para guardar info LOCAL
  Future<void> saveEvents() async {
    final Map<String, dynamic> jsonMap = {};

    events.forEach((date, eventList) {
      jsonMap[date.toIso8601String()] = eventList
          .map((e) => e.toJson())
          .toList();
    });

    await StorageService.saveString('calendar_events', jsonEncode(jsonMap));
  }
  //

  //cargar info guardada LOCAL
  Future<void> loadEvents() async {
    final jsonString = StorageService.getString('calendar_events');

    if (jsonString == null) return;

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    events.clear();

    jsonMap.forEach((dateString, eventList) {
      events[DateTime.parse(dateString)] = (eventList as List)
          .map((e) => EventModel.fromJson(e))
          .toList();
    });

    setState(() {});
  }
  //

  //metodo para agregar pacientes
  void metodoEditarPaciente() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            //only para usar el bottom y el teclado se ponga encima
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, //para altura del widget
            children: [
              const Text(
                "Nueva cita",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Text(
                DateFormat('dd/MM/yyyy').format(_selectedDay ?? _focusedDay),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              //desplegar pacientes de la lista
              DropdownButtonFormField<String>(
                value: selectedPatient,
                decoration: const InputDecoration(
                  labelText: "Paciente",
                  border: OutlineInputBorder(),
                ),
                items: patientNames.map((name) {
                  return DropdownMenuItem(value: name, child: Text(name));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPatient = value;
                  });
                },
              ),

              const SizedBox(height: 15),

              TextField(
                controller: hourController,
                decoration: const InputDecoration(
                  labelText: "Hora",
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: "Descripción / Motivo consulta",
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (editingEvent != null) {
                      //editingEvent!.patient = patientController.text;
                      editingEvent!.patient =
                          selectedPatient ?? editingEvent!.patient;
                      editingEvent!.hour = hourController.text;
                      editingEvent!.description = descriptionController.text;
                    } else {
                      final selectedDate = _selectedDay ?? _focusedDay;

                      events.putIfAbsent(selectedDate, () => []);

                      events[selectedDate]!.add(
                        EventModel(
                          patient: selectedPatient ?? "Sin paciente",
                          hour: hourController.text,
                          description: descriptionController.text,
                        ),
                      );

                      if (selectedPatient != null) {
                        updatePatientLastSession(
                          selectedPatient!,
                          selectedDate,
                        );
                      }
                    }
                  });

                  //guardar eventos (info) LOCAL
                  saveEvents();

                  //patientController.clear();
                  selectedPatient = null;
                  hourController.clear();
                  descriptionController.clear();

                  editingEvent = null;

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

  //metodo para ver la ultima sesion de paciente
  Future<void> updatePatientLastSession(
    String patientName,
    DateTime sessionDate,
  ) async {
    final jsonString = StorageService.getString('patients');

    if (jsonString == null) return;

    final List<dynamic> jsonList = jsonDecode(jsonString);
    final patients = jsonList.map((e) => PatientModel.fromJson(e)).toList();
    final patient = patients.firstWhere((p) => p.name == patientName);

    patient.lastSession = DateFormat('dd/MM/yyyy').format(sessionDate);

    await StorageService.saveString(
      'patients',
      jsonEncode(patients.map((p) => p.toJson()).toList()),
    );
  }

  //inicializar estado de la info guardada
  @override
  void initState() {
    super.initState();
    loadEvents();
    loadPatients(); //cargar pacientes
  }

  @override
  Widget build(BuildContext context) {
    final selectedEvents = getEventsForDay(_selectedDay ?? _focusedDay);

    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).colorScheme.secondary, //uso del themedata
      appBar: AppBar(
        title: Text(
          'Calendario',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primary, //uso del themedata
        toolbarHeight: 80, //tamaño de la barra
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2025, 1, 1), //inicio calendario
            lastDay: DateTime.utc(2030, 12, 31), //final calendario
            focusedDay: _focusedDay,

            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },

            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },

            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },

            //puntitos debajo de los dias (indicadores)
            eventLoader: (day) {
              return getEventsForDay(day);
            },
          ),

          //
          const SizedBox(height: 20),

          Text(
            "Eventos del día",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: selectedEvents.length,
              itemBuilder: (context, index) {
                final event = selectedEvents[index];

                return Dismissible(
                  key: UniqueKey(),

                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),

                  direction: DismissDirection.endToStart,

                  onDismissed: (direction) {
                    setState(() {
                      selectedEvents.removeAt(index);
                    });

                    //guardar eventos (info)
                    saveEvents();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Cita eliminada")),
                    );
                  },

                  child: ListTile(
                    leading: const Icon(Icons.event),
                    title: Text(event.patient),
                    subtitle: Text("${event.hour} - ${event.description}"),

                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        editingEvent = event;

                        //patientController.text = event.patient;
                        selectedPatient = event.patient;
                        hourController.text = event.hour;
                        descriptionController.text = event.description;

                        metodoEditarPaciente();
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          //
        ],
      ),
      floatingActionButton: SizedBox(
        width: 200,
        height: 75,
        child: FloatingActionButton.extended(
          onPressed: () {
            editingEvent = null;

            //patientController.clear();
            selectedPatient = null;
            hourController.clear();
            descriptionController.clear();

            metodoEditarPaciente();
          },
          icon: const Icon(Icons.event_available, size: 30),
          label: const Text(
            "Agregar Sesión",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 8,
        ),
      ),
    );
  }
}
