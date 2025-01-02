import "package:flutter/material.dart";
import "package:lighthouse_prototype/constants.dart";

class Spinbox extends StatefulWidget {
  final String title;
  const Spinbox({super.key, this.title = "Spinbox"});

  @override
  State<Spinbox> createState() => _SpinboxState();
}

class _SpinboxState extends State<Spinbox> {
  String get _title => widget.title;
  late int _counter;

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
    if (_counter > 0) {_counter--;}
  });

  }

  void increment() {setState(() {
    _counter++;
  });

  }
}


class BoxForText extends StatefulWidget {
  final String title;
  const BoxForText({super.key, this.title="Text Box"});

  @override
  State<BoxForText> createState() => _BoxForTextState();
}

class _BoxForTextState extends State<BoxForText> {
  String get _title => widget.title;

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
            decoration: InputDecoration(labelText: "Enter Text", labelStyle: comfortaaBoldSpinbox, border: OutlineInputBorder()),
          )
             
             
        ],
      )
      
      );
  }
}