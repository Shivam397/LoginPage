import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:get/get.dart';
import 'dart:async';
import './login_screen.dart';

class splashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _splashScreen();
  }
}

class _splashScreen extends State<splashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1700,
        height: 900,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("../lib/images/bg.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            new Container(
              width: 90,
              height: 90,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black87,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.2,
                    spreadRadius: 0.1,
                  )
                ],
              ),
              child: new Image.asset(
                '../lib/images/satyamev.png',
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            new Container(
              width: 90,
              height: 120,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //color: Colors.black87,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.2,
                    spreadRadius: 0.1,
                  )
                ],
              ),
              child: new Image.asset(
                '../lib/images/logo.png',
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            Container(
              width: 300,
              height: 100,

              child:Container(
                width: 290,
                height: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(50)),
                child: Text("ROlling Asset Management System for Indian Railways", textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                
              ),

              
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Container(
              width: 200,
              height: 150,
            
              child: new Image.asset(
                '../lib/images/CrisPreview.png',
                height: 70.0,
                fit: BoxFit.cover,
              ),
            )

          ],
        ),
      ),
    );
  }
}
