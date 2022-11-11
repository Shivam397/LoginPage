import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateField extends StatelessWidget{
  final String label;

  CustomDateField({required this.label});

  DateTime now = DateTime.now();
  DateFormat format = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return 
   DateTimeField(
    
        decoration: InputDecoration(
          hintText: "dd-mm-yyyy",
          labelText: label,
          labelStyle: TextStyle(color: Colors.black),
          focusColor: Colors.white,
          contentPadding: const EdgeInsets.all(10),
        ),
        style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
              
              
             
  
          return date;
        }
    );
    
    
  }


}