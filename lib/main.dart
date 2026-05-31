import 'package:flutter/material.dart';
import 'package:therafy_app/ui/screens/home_screen.dart';
import 'package:therafy_app/ui/screens/splash_screen.dart';
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
        useMaterial3: true, //diseño más reciente flutter
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 37, 99, 235),
          primary: const Color.fromARGB(255, 37, 99, 235),
          secondary: const Color.fromARGB(255, 147, 197, 253),
        ),
      ),
      debugShowCheckedModeBanner: false, //quitar el debug de la esquina
      //home: const NavigationScreenBottom(),
      home: const SplashScreen(),
    );
  }
}
