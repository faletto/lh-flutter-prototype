import "package:flutter/material.dart";
import "package:lighthouse_prototype/filemgr.dart";
import "package:lighthouse_prototype/pages/home.dart";
import "package:lighthouse_prototype/pages/data_entry.dart";
import "package:lighthouse_prototype/constants.dart";
import "package:lighthouse_prototype/pages/settings.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initConfig();
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      theme: ThemeData(
        
      ),
      title: "LightHouse Prototype",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": (context) => HomePage(),
        "/entry": (context) => DataEntry(),
        "/settings": (context) => SettingsPage()
      },
    );
  }
}

