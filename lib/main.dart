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
        primaryColor: Colors.red, 
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red, 
          accentColor: Colors.yellow, 
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red, 
          foregroundColor: Colors.white, 
        ),
         textTheme: TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Pokemon', // Custom font for headings
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Roboto', 
            fontSize: 18,
            color: Colors.black87,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Roboto', 
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ),
      home: ListScreen(),
    );
  }
}