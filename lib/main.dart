import 'package:flutter/material.dart';
import 'screens/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pokedex: My pokemon collection',
      theme: ThemeData(
        primaryColor: Colors.red, // Pokémon red for primary color
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red, // Primary color swatch
          accentColor: Colors.yellow, // Accent color (Pikachu yellow)
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red, // AppBar background color
          foregroundColor: Colors.white, // AppBar text/icon color
        ),
         textTheme: TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Pokemon', // Custom font for headings
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Pokemon', // Custom font for body text
            fontSize: 18,
            color: Colors.black87,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Pokemon', // Custom font for smaller text
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ),
      home: ListScreen(),
    );
  }
}