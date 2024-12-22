import 'package:flutter/material.dart';
import 'package:lighthouse_prototype/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LightHouse", style: TextStyle(
           
        ),),
        backgroundColor: Constants().pastelRed,
        centerTitle: true,

      ),
    );
  }
}