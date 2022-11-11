import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownWidget extends StatelessWidget {
  var selected;
  var listItem;

  DropDownWidget({Key? key, required this.selected, this.listItem})
      : super(key: key);

  Widget build(BuildContext context) {
    return Obx(()=>
      DropdownButton<String>(
      items: listItem.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(
            dropDownStringItem,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        selected = newValue.toString();
      },
      value: selected,
      style: TextStyle(
        color: Colors.white,
      ),
    )
    );
    
  }
}

// class _DropDown extends State<DropDownWidget> {
//   @override
  
//   }

//   void _onDropDownItemSelected1(String newValue) {
//     setState(() {
//       this.widget.selected = newValue;
//     });
//   }
// }
