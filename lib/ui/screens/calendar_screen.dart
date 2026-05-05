import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 233, 181),
      appBar: AppBar(
        title: Text(
          'Calendario',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 76, 175, 80),
        toolbarHeight: 80, //tamaño de la barra
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2025, 1, 1), //inicio calendario
            lastDay: DateTime.utc(2030,12,31), //final calendario
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
            }
          ),
        ],
      ),
    );
  }
}
