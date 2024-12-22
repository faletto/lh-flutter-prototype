import "package:flutter/material.dart";
import "package:lighthouse_prototype/pages/home.dart";
import "package:lighthouse_prototype/constants.dart";

void main() {
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Constants().pastelRed)
      ),
      title: "LightHouse Prototype",
      home: HomePage()
    );
  }
}

