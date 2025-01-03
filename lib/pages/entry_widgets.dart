import "package:flutter/material.dart";
import "package:lighthouse_prototype/constants.dart";
import "package:lighthouse_prototype/pages/data_entry.dart";


class Spinbox extends StatefulWidget {
  final String title;
  final String jsonKey;
  const Spinbox({super.key, this.title = "Spinbox", this.jsonKey = "unnamed"});

  @override
  State<Spinbox> createState() => _SpinboxState();
}

class _SpinboxState extends State<Spinbox> {
  String get _title => widget.title;
  String get _key => widget.jsonKey;
  late int _counter;
  String _value = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 400,
      decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Text(_title, style: comfortaaBoldSpinbox),
           Center(
             child: Row(mainAxisAlignment:MainAxisAlignment.center,
             children: [
              IconButton(onPressed:() {decrement();}, icon: Icon(Icons.keyboard_arrow_down,)),
              Text("$_counter", style: comfortaaBoldSpinbox,),
              IconButton(onPressed:() {increment();}, icon: Icon(Icons.keyboard_arrow_up,)),
             ],),
           )
        ],
      )
      
      );
  }

  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  void decrement() {setState(() {
    if (_counter > 0) {_counter--; updateState();}
  });

  }

  void increment() {setState(() {
    _counter++;
    updateState();
  });
  }

  void updateState() {
    _value = _counter.toString();
    DataEntry.exportData[_key] = _value;
  }
}


class BoxForText extends StatefulWidget {
  final String title;
  final String jsonKey;
  const BoxForText({super.key, this.title="Text Box", this.jsonKey = "unnamed"});

  @override
  State<BoxForText> createState() => _BoxForTextState();
}

class _BoxForTextState extends State<BoxForText> {
  String get _title => widget.title;
  String get _key => widget.jsonKey;
  final TextEditingController _controller = TextEditingController();


  // Apparently all this TextEditingController BS can just be done by passing a lambda to the onChanged
  // parameter of a TextField, but this method lets us set an initial value sooooooo
  // idk
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {setState(() {
       DataEntry.exportData[_key] = _controller.text;

    });});
  }

  // idk what this one does but gpt demands it
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 400,
      decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Text(_title, style: comfortaaBoldSpinbox),
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: "Enter Text", labelStyle: comfortaaBoldSpinbox, border: OutlineInputBorder()),
          )
             
             
        ],
      )
      
      );
  }
}