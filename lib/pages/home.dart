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

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Background.png"), colorFilter: ColorFilter.mode(Constants().pastelYellow, BlendMode.color),
          fit: BoxFit.cover)
        ),
        child: null
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
      backgroundColor: Constants().pastelRed,

      child: PopupMenuButton(
        icon: Icon(Icons.add),
        onSelected:(value) => {
          switch (value) {
            "entry" => Navigator.pushNamed(context, "/entry"),
            // flutter got mad at me for not adding this
            Object() => throw UnimplementedError(),
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(value: "entry", child: Row(children: [Icon(Icons.bathtub,),Text("Entry Page :D")],))
        ]),
        ),
    );
  }
}