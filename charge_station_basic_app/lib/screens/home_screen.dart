// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'machine_list_screen.dart'; // Makine listesi ekranı

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.green,
        ),
        scaffoldBackgroundColor: Colors.lightBlue[50],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color.fromARGB(240, 42, 139, 39),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green), // Buton rengi
          ),
        ),
      ),
      home: const Scaffold(
        body: MachineListScreen(), // Makine listesi ekranı
      ),
    );
  }
}
