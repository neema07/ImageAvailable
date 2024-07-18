import 'package:flutter/material.dart';
import 'package:imageviewer/image.dart';
import 'package:imageviewer/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signUp(),
    );
  }
}