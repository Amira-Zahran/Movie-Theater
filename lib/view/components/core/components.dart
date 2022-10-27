import 'package:flutter/material.dart';


void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void popTo(context, widget) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) => widget));
}