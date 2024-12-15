import 'package:flutter/material.dart';

class MainPasien extends StatelessWidget{
  const MainPasien({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Text("tot")
          ].toList()
        )
      ),
    );
  }
}