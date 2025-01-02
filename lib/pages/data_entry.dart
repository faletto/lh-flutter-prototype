import "dart:convert";

import "package:flutter/material.dart";
import "package:lighthouse_prototype/constants.dart";
import "package:lighthouse_prototype/layouts.dart";
import "package:lighthouse_prototype/pages/entry_widgets.dart";
class DataEntry extends StatelessWidget {
  const DataEntry({super.key});

  @override
  Widget build(BuildContext context) {
    final parsedData = json.decode(testJson);
    final widgetList = (parsedData["widgets"] as List).map((widgetData) {
      final title = widgetData["title"];
      final type = widgetData["type"];

      if (type == "spinbox") {return Spinbox(title: title);}
      if (type == "textbox") {return BoxForText(title: title);}
      return Text("type $type isn't a valid type you idiot");
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants().pastelRed,
        title: const Text("Data Entry", style: TextStyle(
           fontFamily: "Comfortaa",
           fontWeight: FontWeight.w900,
           color: Colors.white
        ),),
        centerTitle: true,
        leading: IconButton(onPressed: () {Navigator.pushNamed(context, "/home");}, icon: Icon(Icons.home)),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            spacing: 10,
            children: widgetList,
          ),
        ),
      )
    );
  }
}