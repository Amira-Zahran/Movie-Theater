import 'package:flutter/material.dart';

import 'style.dart';


void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void popTo(context, widget) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) => widget));
}


Widget btn(onPressed, size, text){
  return ElevatedButton(onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        fixedSize: size,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12))),
    child: Text(text, style: const TextStyle(
      color: Colors.white,
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
    ),),
  );
}

Widget logo(context){
  return Image.asset('assets/img/logo.png', width: MediaQuery.of(context).size.width*.4, height: 90,);
}