import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../widgets/Responsive.dart';
import '../widgets/widgets.dart';

class FetchRake extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FetchRake();
  }
}

class _FetchRake extends State<FetchRake> {
  var _curr = [
    'Select..',
    'Primary Maintenance',
    'Secondary Maintenance',
    'RBPC'
  ];
  var _currency = 'Select..';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orangeAccent[50],
        body: Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("../lib/images/backgrounds.png"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            child: Center(
                child: Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.convex,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: 20,
                        lightSource: LightSource.topLeft,
                        border: NeumorphicBorder(
                          color: Colors.white,
                          width: 0.8,
                        ),
                        color: Colors.grey[200]),
                    child: (Responsive.isDesktop(context))
                        ? Container(
                            width: 500,
                            height: 500,
                            child: Cont(),
                          )
                        : Container(
                            width: 300,
                            height: 550,
                            child: Cont(),
                          )))));
  }

  Widget Cont() {
    final list = RadioModel(false, "Old Rakes", " ", "Old Rakes");
    final list2 = RadioModel(false, "Available Rakes From CMM", "",
        "Available Rakes From CMM");
    final list3 = RadioModel(false, "Available Rakes From ICMS", " ",
         "Available Rakes From ICMS");
    final list4 = RadioModel(false, "Rakes Waiting for Arrival", " ",
         "Rakes Waiting for Arrival");
    final list5 = RadioModel(false, "Scratch", " ",  "Scratch");

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomRadio(sampleData: [list, list2, list3, list4, list5]),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.all(20.0),
              child: DropdownButton<String>(
                items: _curr.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(
                      dropDownStringItem,
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  _onDropDownItemSelected1(newValue!);
                },
                value: _currency,
                style: TextStyle(
                  color: Colors.white,
                ),
              )),

          GestureDetector(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: LabelText(text: "Click here to see Standard Consist"),
          )),

          // const SizedBox(
          //   height: 10,
          // ),

          Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40),
              child: Container(
                width: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Button(
                      label: "GO",
                      color: Colors.orangeAccent,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  void _onDropDownItemSelected1(String newValue) {
    setState(() {
      this._currency = newValue;
    });
  }
}
