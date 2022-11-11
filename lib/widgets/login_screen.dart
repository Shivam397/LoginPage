
import 'dart:ui';
import 'dart:math';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_string/random_string.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  //generateRandom r = new generateRandom();

  launchMailto() async {
    final mailtoLink = Mailto(
      to: ['cmmadmin@gmail.com'],
      cc: ['cc1@example.com', 'cc2@example.com'],
      subject: 'Welcome to Query section',
      body: 'Write Your Query Here!',
    );
    // Convert the Mailto instance into a string.
    // Use either Dart's string interpolation
    // or the toString() method.
    await launch('$mailtoLink');
  }

  var captcha = "";

  generate() {
    captcha = randomString(6);
  }

  @override
  Widget build(BuildContext context) {
    var captcha = randomString(6);
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("../lib/images/bg.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            // SizedBox(
            //   height: 15,
            // ),

            // SizedBox(
            //   height: 30,
            // ),
            Container(
              height: 550,
              width: 325,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Icon(
                          FontAwesomeIcons.userGroup,
                          size: 30,
                          color: Colors.orangeAccent[700],
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.orangeAccent[700],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextFormField(
                      validator: (value) => EmailValidator.validate(value!)
                          ? null
                          : "Please enter a valid email",
                      maxLines: 1,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Email Address",
                        prefixIcon: Icon(FontAwesomeIcons.envelope,
                            size: 17, color: Colors.grey),
                        fillColor: Colors.brown[100],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: new BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      maxLines: 1,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(FontAwesomeIcons.eyeSlash,
                            size: 17, color: Colors.grey),
                        fillColor: Colors.brown[100],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: new BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password ?",
                          style: TextStyle(color: Colors.orangeAccent[700]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: 250,
                    //alignment: Alignment.centerLeft,
                    //color: Colors.grey[100],
                    decoration: BoxDecoration(
                      //color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          captcha,
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 20,
                            //backgroundColor: Colors.grey[300],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              generate();
                            });
                          },
                          icon: new Icon(
                            Icons.refresh,
                          ),
                          color: Colors.deepOrange,
                        )
                      ],
                    ),
                  ),

                  Container(
                    width: 250,
                    child: new Flexible(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Enter Captcha',
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF8A2387),
                                Color(0xFFE94057),
                                Color(0xFFF27121),
                              ])),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "For any queries, contact us",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: launchMailto,
                          icon: Icon(
                            Icons.email,
                            size: 30,
                            color: Colors.orangeAccent[700],
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
