import 'package:flutter/material.dart';
import 'package:therafy_app/ui/screens/home_screen.dart';
import 'package:therafy_app/ui/widgets/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Therafy App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 212, 59, 59),
          primary: Colors.orange,
          secondary: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false, //quitar el debug de la esquina
      home: const NavigationScreenBottom(),
    );
  }
}