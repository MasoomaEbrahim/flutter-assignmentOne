import 'package:assone/colors.dart';
import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
        backgroundColor: primary,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Centered Text!"),
            Container(
              color: primary,
              child: Text('first container '),),
          ],
        ),
      ),
      
    );
  }
}