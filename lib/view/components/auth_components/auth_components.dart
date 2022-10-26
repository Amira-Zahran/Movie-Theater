import 'package:flutter/material.dart';

import '../core/style.dart';


Widget defaultField({
  required TextEditingController controller,
  required TextInputType type,
  required String text,
  required double radius
}) =>
    TextFormField(
      style: const TextStyle(color: grey, fontFamily: 'Salsa'),
      controller: controller,
      keyboardType: type,
      validator: (String? value){
        if(value!.isEmpty){
          return 'Please enter your data';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: third,
        filled: true,
        enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: third), borderRadius: BorderRadius.circular(radius)),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 1, color: primary), borderRadius: BorderRadius.circular(radius)),
        hintText: text,
        hintStyle: const TextStyle(color: grey, fontFamily: 'Salsa')
      ),
    );



Widget textBtn({
  required String text,
  required Function() onPressed,
  required double fontSize,
  required double height,
}){
  return TextButton(onPressed: onPressed, child: Text(
    text,
    style: TextStyle(
        color: primary,
        fontSize: fontSize,
        decoration: TextDecoration.underline, height: height),
  ),);
}

Widget  or(){
  return Row(
    children: const [
      Expanded(child: Divider(thickness: 1, endIndent: 7, indent: 15, color: Colors.white,)/*Container(height: 3,color: const Color(darkGreyColor)*/),
      Text('Or connect with', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
      Expanded(child: Divider(thickness: 1, endIndent: 15, indent: 7, color: Colors.white,)/*Container(height: 3,color: const Color(darkGreyColor)*/),
    ],
  );
}


Widget dontHaveAccount(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text("Don't have an account", style: TextStyle(letterSpacing: 2, color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),),
      SizedBox(width: 3,),
      Text('Sign up', style: TextStyle(letterSpacing: 2,color: primary, fontWeight: FontWeight.bold, fontSize: 11),),
    ],
  );
}

Widget googleFacebook(imgName){
  return Image.asset(imgName,width: 40, height: 25,);
}