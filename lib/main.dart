import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therafy_app/core/services/storage_service.dart';
import 'package:therafy_app/models/qa_viewmodel.dart';
import 'package:therafy_app/models/settings_viewmodel.dart';
import 'package:therafy_app/ui/screens/splash_screen.dart';

void main() async {
  //lab6
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsViewModel()),
        ChangeNotifierProvider(create: (_) => QaViewModel()),
      ],
      //almacena y gestiona la config de la app
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsViewModel>();

    return MaterialApp(
      title: 'Therafy App',

      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(settings.textScale)),
          child: child!,
        );
      },

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 37, 99, 235),
          primary: const Color.fromARGB(255, 37, 99, 235),
          secondary: const Color.fromARGB(255, 147, 197, 253),
        ),
        cardTheme: CardThemeData(color: Colors.white),
      ),

      debugShowCheckedModeBanner: false,

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 12, 36, 56),
          primary: const Color.fromARGB(255, 12, 36, 56),
          secondary: const Color.fromARGB(255, 28, 85, 131),
        ),
        cardTheme: CardThemeData(
          color: Colors.black,
          //falta que el color del texto se cambie tambien, porque cambia solo el fondo por ahora, investigar
        ),
      ),

      //revisar el matherial theem builder del profe y tener eso de base mejor
      themeMode: settings.themeMode,

      home: const SplashScreen(),
    );
  }
}
