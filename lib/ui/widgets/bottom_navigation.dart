import 'package:flutter/material.dart';
import 'package:therafy_app/ui/screens/calendar_screen.dart';
import 'package:therafy_app/ui/screens/home_screen.dart';


class NavigationScreenBottom extends StatefulWidget {
  const NavigationScreenBottom({super.key});

  @override
  State<NavigationScreenBottom> createState() => _NavigationScreenBottomState();
}

class _NavigationScreenBottomState extends State<NavigationScreenBottom> {
  int selectedIndex = 0;
  final List<Widget> pantallas = [
    const HomeScreen(),
    const CalendarScreen(), //pantalla calendario
    const Center (child: Text("Pagina2")),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pantallas[selectedIndex], //cambia pantalla
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black, //color cuando no se selecciona el item
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Agenda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Ajustes",
          ),
        ],
      ),
    );
  }
}