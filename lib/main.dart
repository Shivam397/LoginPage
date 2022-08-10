// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'app_screens/login_screen.dart';
import 'package:get/get.dart';
import './app_screens/splash_screen.dart'; 

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: homeScreen(),
  ));
}

// 0xFF006064
ColorScheme defaultColorScheme = const ColorScheme(
  primary: Color(0xff000000),
  secondary: Color(0xff03DAC6),
  surface: Color(0xff181818),
  background: Color(0XFFE3F2FD),
  error: Color(0xffCF6679),
  onPrimary: Color(0xff000000),
  onSecondary: Color(0xff000000),
  onSurface: Color(0xffffffff),
  onBackground: Color(0xffffffff),
  onError: Color(0xff000000),
  brightness: Brightness.dark,
);

class homeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homescreen();
  }
}

class _homescreen extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //appBar: AppBar(title: Text("Login Screen")),
      theme: ThemeData(
        colorScheme: defaultColorScheme,
        primarySwatch: Colors.blue,
      ),
      home: splashScreen(),
    );
  }
}

