import 'package:flutter/material.dart';

Widget rowOrange(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text('Orange ', style: TextStyle(color: Colors.deepOrange,  fontWeight: FontWeight.bold, fontSize: 20),),
      Text('Digital Center', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,  fontSize: 20), )
    ],
  );
}

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void popTo(context, widget) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) => widget));
}