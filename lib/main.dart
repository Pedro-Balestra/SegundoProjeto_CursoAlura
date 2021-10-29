import 'package:flutter/material.dart';
import 'package:projeto2/srceens/dashboard.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green.shade900,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green.shade900,
          secondary: Colors.blueAccent[700],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueAccent[700],
          ),
        ),
      ),
      home: const Dashboard(),
    );
  }
}
