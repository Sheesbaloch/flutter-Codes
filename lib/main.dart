import 'package:flutter/material.dart';
import 'package:test_flutter/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flufix',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color.fromARGB(255, 58, 58, 58),
          useMaterial3: true),
      home: Home(),
    );
  }
}
