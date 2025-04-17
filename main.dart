import 'package:flutter/material.dart';
import 'package:assone/colors.dart';
import 'package:assone/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'themeTry',
      theme: ThemeData(
        primarySwatch: primary,
        useMaterial3: true,
        
      ),
      color: primary,
      home: const Homepage(),
    );
  }
}
