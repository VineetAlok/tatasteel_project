import 'package:flutter/material.dart';
import 'package:tatasteel_project/generator.dart';
import 'package:tatasteel_project/homepage.dart';
import 'package:tatasteel_project/login.dart';
import 'package:tatasteel_project/register.dart';
import 'package:tatasteel_project/generator.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'generator': (context) => generator(),
      'register': (context) => MyRegister(),
      'homepage': (context) => homepage(),
      'login': (context) => MyLogin(),
    },
  ));
}
