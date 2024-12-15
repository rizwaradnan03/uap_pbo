import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget{
  final String title;
  final VoidCallback onTap;

  const MenuCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
      ),
    );
  }
}