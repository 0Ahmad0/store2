import 'package:flutter/material.dart';

const primaryColor = Color(0xffe3e3e6);
const textColor = Colors.green;

//Functions

Size getScreenSize(context) {
  return MediaQuery.of(context).size;
}

void goTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (ctx) => widget));
}

//List
List allProducts = [];
