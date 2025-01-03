import "dart:convert";

import "package:flutter/material.dart";
import "package:lighthouse_prototype/constants.dart";
import "package:lighthouse_prototype/layouts.dart";
import "package:lighthouse_prototype/pages/entry_widgets.dart";

class DataEntry extends StatelessWidget {
  const DataEntry({super.key});
  static final Map<String, String> exportData = {};
  @override
  Widget build(BuildContext context) {
    final layoutJSON = json.decode(testJson);
    final widgetList = (layoutJSON["widgets"] as List).map((widgetData) {
      final title = widgetData["title"];
      final type = widgetData["type"];
      final jsonKey = widgetData["jsonKey"];

      if (type == "spinbox") {return Spinbox(title: title,jsonKey: jsonKey,);}
      if (type == "textbox") {return BoxForText(title: title, jsonKey: jsonKey,);}
      return Text("type $type isn't a valid type you idiot");
    }).toList();
    widgetList.add(SaveJsonButton());

    exportData.clear();
    for (var widgetData in layoutJSON["widgets"]) {
      final key = widgetData["jsonKey"];
      exportData[key] = "undefined";
    }


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

class SaveJsonButton extends StatelessWidget {
  const SaveJsonButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(content: Text(json.encode(DataEntry.exportData)),);
      });
    }, child: Text("Save"));
  }
}

