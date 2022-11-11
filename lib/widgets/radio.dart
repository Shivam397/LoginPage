import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRadio extends StatefulWidget {
  List<RadioModel> sampleData;

  CustomRadio({required this.sampleData});

  @override
  State<CustomRadio> createState() => CustomRadioState();
}

class CustomRadioState extends State<CustomRadio> {
  var fl = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.sampleData.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            if (fl) {
              for (var element in widget.sampleData) element.isSelected = false;
            }

            setState(() {
              widget.sampleData[index].isSelected = true;
              widget.sampleData[index].selectedValue =
                  widget.sampleData[index].value;
              print(widget.sampleData[index].selectedValue);
              fl = true;
            });
          },
          child: RadioItem(index),

          //)
        );
      },
    );
  }

  Widget RadioItem(int index) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 15,
            height: 15,
            decoration: ShapeDecoration(
              shape: const CircleBorder(
                side: BorderSide(color: Colors.grey, width: 2.0),
              ),
              color: widget.sampleData[index].isSelected
                  ? Colors.blue
                  : Colors.white,
              //color: isSelected ? Colors.teal : Colors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(widget.sampleData[index].text),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected = false;
  String value;
  String selectedValue;
  final String text;

  RadioModel(this.isSelected, this.value, this.selectedValue, 
      this.text);
}
