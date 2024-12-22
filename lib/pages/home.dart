import 'package:flutter/material.dart';
import 'package:lighthouse_prototype/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants().pastelRed,
      appBar: AppBar(
        backgroundColor: Constants().pastelRed,
        title: const Text("LightHouse", style: TextStyle(
           fontFamily: "Comfortaa",
           fontWeight: FontWeight.w900,
           color: Colors.white
        ),),
        centerTitle: true,

      ),
      
    );
  }
}