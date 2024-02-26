import 'package:flutter/material.dart';
import 'package:ush/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ush',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 224, 197, 41)),
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
            foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
            titleTextStyle: const TextStyle().copyWith(fontSize: 18),
          ),
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}
