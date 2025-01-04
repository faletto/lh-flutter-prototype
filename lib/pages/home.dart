import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lighthouse_prototype/constants.dart';
import 'package:lighthouse_prototype/filemgr.dart';

class HomePage extends StatelessWidget {
  const  HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    loadConfig();

   
    
    
  

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
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {
          Navigator.pushNamed(context, "/settings");
        } )],
      ),

      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Background.png"), colorFilter: ColorFilter.mode(Constants().pastelYellow, BlendMode.color),
          fit: BoxFit.cover)
        ),
        child: IconButton(icon: Icon(Icons.javascript_outlined), onPressed: (() {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              content: Text(jsonEncode(configData).toString())
              );
          });
        }), )
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
      backgroundColor: Constants().pastelRed,
  
      child: PopupMenuButton(
        icon: Icon(Icons.add),
        onSelected:(value) {
          activeConfig = value;
          Navigator.pushNamed(context, "/entry");
        },
        itemBuilder: (BuildContext context) {
          final enabledLayouts = configData["enabledLayouts"]!.split(",");
          return enabledLayouts.map((jsonKey) {
            return PopupMenuItem(value: jsonKey,child:Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: Icon(Icons.data_object, color: Colors.black,),
                ),
                Text(jsonKey),
              ],
            ));
          }).toList();
        },
        ),
    ));
  }
}

// (context) => [
//           PopupMenuItem(value: "entry", child: Row(children: [Icon(Icons.bathtub,),Text("Entry Page :D")],))
//         ])