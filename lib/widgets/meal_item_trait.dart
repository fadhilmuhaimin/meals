// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 17,color: Colors.white,),
        const SizedBox(width: 2,),
        Text(text,style: TextStyle(color: Colors.white),),
      ],
    );
  }
}