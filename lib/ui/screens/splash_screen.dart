import 'package:flutter/material.dart';
import 'dart:async'; //pubdev
import 'package:therafy_app/ui/widgets/bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplash();
  }

  Future<void> _startSplash() async {
    await Future.delayed(const Duration(seconds: 3));

    //cambio de pantalla
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const NavigationScreenBottom(),)
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo2.png',
          width: 200,
        ),
      ),
    );
  }
}