import 'package:flutter/material.dart';

import 'style.dart';


void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void popTo(context, widget) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateAndFinish(context, widget){
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => widget), (route) => false);
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


Widget btnBack(onPressed, size, text){
  return ElevatedButton(onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        backgroundColor: secondary,
        fixedSize: size,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
        side: const BorderSide(width: 2, color: primary)
        )),
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


Widget customText(text,double? size){
  return Text(text, style: TextStyle(color: Colors.white, fontSize: size, fontWeight: FontWeight.bold),);
}

appBar(text){
  return AppBar(
    backgroundColor: secondary,
    elevation: 0.0,
    title: Text(text),
    leading: const BackButton(color: Colors.white,),
    centerTitle: true,);
}

playIcon(){
  return Center(
    child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: lightDark),
      child: const Icon(Icons.play_arrow_rounded, color: Colors.white,),
    ),
  );
}

btnAlign(context, onPressed, text){
  Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: MediaQuery.of(context).size.width,
          child: MaterialButton(
            height: 60,
            color: primary,
            onPressed: onPressed,
            child: Center(child: customText(text, 16)),
          ),
        )),
  );
}

circle(color){
  return Container(width: 5, height: 5, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),);
}
